function build_test_fixture(opts)
%BUILD_TEST_FIXTURE Build a small real-EEG BIDS fixture for CI.
%
%   Reads the first NDuration seconds of sub-NDARAA948VFH's ThePresent
%   recording, writes a self-contained mini BIDS tree under
%   tests/fixtures/bids_mini/. The output is real EEG, real events,
%   and real sidecars; nothing is synthesized.
%
%   Run from the worktree root:
%     matlab -batch "run('scripts/build_test_fixture.m')"
%
%   Name-value arguments:
%     SourceRoot  source BIDS root (default: the local R3 100 Hz path)
%     Subject     subject ID to slice (default: sub-NDARAA948VFH)
%     NDuration   number of seconds to retain from t=0 (default: 60)
%     OutRoot     output BIDS root (default: tests/fixtures/bids_mini)
%
%   The default window (0..60 s) covers shot_events.tsv rows 1..15,
%   which include boy-only, puppy-only, and "neither" shots; enough
%   diversity for downstream epoching tests once Phase 4 lands.

    arguments
        opts.SourceRoot (1, 1) string = "/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf"
        opts.Subject (1, 1) string = "sub-NDARAA948VFH"
        opts.NDuration (1, 1) double {mustBePositive} = 60
        opts.OutRoot (1, 1) string = "tests/fixtures/bids_mini"
    end

    script_dir = fileparts(mfilename('fullpath'));
    repo_root  = fileparts(script_dir);
    cd(repo_root);

    addpath('/Users/yahya/Documents/git/eeg/eeglab');
    evalc('eeglab nogui');

    src = opts.SourceRoot;
    sub = opts.Subject;
    nd  = opts.NDuration;
    out = fullfile(repo_root, opts.OutRoot);

    if ~isfolder(src)
        error("hbn:build_fixture:no_source", ...
            "Source BIDS root not found: %s", src);
    end

    src_eeg_dir = fullfile(src, sub, 'eeg');
    src_bdf     = fullfile(src_eeg_dir, sprintf("%s_task-ThePresent_eeg.bdf", sub));
    src_eegj    = fullfile(src_eeg_dir, sprintf("%s_task-ThePresent_eeg.json", sub));
    src_chans   = fullfile(src_eeg_dir, sprintf("%s_task-ThePresent_channels.tsv", sub));
    src_events  = fullfile(src_eeg_dir, sprintf("%s_task-ThePresent_events.tsv", sub));
    for f = [src_bdf, src_eegj, src_chans, src_events]
        if ~isfile(f); error("hbn:build_fixture:missing_input", "Missing: %s", f); end
    end

    out_eeg_dir = fullfile(out, sub, 'eeg');
    if ~isfolder(out_eeg_dir); mkdir(out_eeg_dir); end

    fprintf("[fixture] reading %s\n", src_bdf);
    EEG = pop_biosig(char(src_bdf));
    fprintf("[fixture] source: %d ch, srate=%g, %d samples (%.1f s)\n", ...
        EEG.nbchan, EEG.srate, EEG.pnts, EEG.xmax);

    if EEG.xmax < nd
        error("hbn:build_fixture:too_short", ...
            "Source recording is %.1f s, shorter than requested %.1f s.", EEG.xmax, nd);
    end

    cropped = pop_select(EEG, 'time', [0 nd]);
    fprintf("[fixture] cropped to %d samples (%.1f s)\n", cropped.pnts, cropped.xmax);

    out_bdf = fullfile(out_eeg_dir, sprintf("%s_task-ThePresent_eeg.bdf", sub));
    pop_writeeeg(cropped, char(out_bdf), 'TYPE', 'BDF');
    bdf_info = dir(out_bdf);
    fprintf("[fixture] wrote %s (%.2f MB)\n", out_bdf, bdf_info.bytes / 1024 / 1024);

    out_chans = fullfile(out_eeg_dir, sprintf("%s_task-ThePresent_channels.tsv", sub));
    copyfile(src_chans, out_chans);
    fprintf("[fixture] copied %s\n", out_chans);

    src_events_tbl = readtable(src_events, 'FileType', 'text', 'Delimiter', '\t');
    src_events_tbl = src_events_tbl(src_events_tbl.onset < nd, :);
    out_events = fullfile(out_eeg_dir, sprintf("%s_task-ThePresent_events.tsv", sub));
    writetable(src_events_tbl, out_events, 'FileType', 'text', 'Delimiter', '\t');
    fprintf("[fixture] wrote %s with %d in-window event(s)\n", out_events, height(src_events_tbl));

    out_eegj = fullfile(out_eeg_dir, sprintf("%s_task-ThePresent_eeg.json", sub));
    src_eegj_struct = jsondecode(fileread(src_eegj));
    src_eegj_struct.RecordingDuration = nd;
    fid_j = fopen(out_eegj, 'w');
    fprintf(fid_j, '%s', jsonencode(src_eegj_struct, 'PrettyPrint', true));
    fclose(fid_j);
    fprintf("[fixture] wrote %s (RecordingDuration set to %g)\n", out_eegj, nd);

    % Root-level BIDS inheritance: pop_importbids reads task-*_eeg.json at
    % the dataset root and merges it with the subject-level sidecar. The
    % root file carries Manufacturer / ManufacturersModelName that EEGLAB
    % uses to auto-look-up channel locations. Without it, clean_rawdata
    % falls into a location-free path that fails at srate < 110 Hz.
    for rootSidecar = ["task-ThePresent_eeg.json", "task-ThePresent_events.json"]
        srcRoot = fullfile(src, rootSidecar);
        if isfile(srcRoot)
            copyfile(srcRoot, fullfile(out, rootSidecar));
            fprintf("[fixture] copied root-level %s\n", rootSidecar);
        end
    end

    src_ds = fullfile(src, 'dataset_description.json');
    if isfile(src_ds)
        copyfile(src_ds, fullfile(out, 'dataset_description.json'));
    end

    src_pj = fullfile(src, 'participants.json');
    if isfile(src_pj)
        copyfile(src_pj, fullfile(out, 'participants.json'));
    end

    src_pt = readtable(fullfile(src, 'participants.tsv'), ...
        'FileType', 'text', 'Delimiter', '\t');
    src_pt = src_pt(strcmp(src_pt.participant_id, char(sub)), :);
    writetable(src_pt, fullfile(out, 'participants.tsv'), ...
        'FileType', 'text', 'Delimiter', '\t');
    fprintf("[fixture] wrote participants.tsv with 1 row\n");

    src_readme = fullfile(src, 'README');
    if isfile(src_readme); copyfile(src_readme, fullfile(out, 'README')); end

    fixture_readme = fullfile(out, 'FIXTURE_README.md');
    fid = fopen(fixture_readme, 'w');
    fprintf(fid, "# HBN R3 fixture\n\n");
    fprintf(fid, "Mini BIDS-EEG dataset derived from the HBN R3 100 Hz local copy.\n");
    fprintf(fid, "Used by `tests/matlab/*.m` to run real-data smoke tests in CI\n");
    fprintf(fid, "without requiring the full /Volumes mount.\n\n");
    fprintf(fid, "## Provenance\n\n");
    fprintf(fid, "- Subject: `%s`\n", sub);
    fprintf(fid, "- Task: `ThePresent`\n");
    fprintf(fid, "- Window: 0 to %g s (from full recording of %.1f s)\n", nd, EEG.xmax);
    fprintf(fid, "- Sampling rate: %g Hz\n", cropped.srate);
    fprintf(fid, "- Channels: %d (unchanged from source)\n", cropped.nbchan);
    fprintf(fid, "- Built from: `%s`\n", src);
    fprintf(fid, "- License: CC-BY-SA 4.0 (inherited from HBN-EEG; see `dataset_description.json`).\n\n");
    fprintf(fid, "## Reproduce\n\n");
    fprintf(fid, "```bash\n");
    fprintf(fid, 'matlab -batch "run(''scripts/build_test_fixture.m'')"\n');
    fprintf(fid, "```\n\n");
    fprintf(fid, "## Why this window\n\n");
    fprintf(fid, "shot_events.tsv rows that fall in [0, %g) span shots 1..15, which\n", nd);
    fprintf(fid, "include boy-only (#2..#5), neither (#7, #14), boy+puppy (#16 sits\n");
    fprintf(fid, "exactly at the boundary, dropped), and the first puppy-only shot\n");
    fprintf(fid, "(#15 at 55.042 s). Phase 4 epoching has enough material.\n");
    fclose(fid);
    fprintf("[fixture] wrote %s\n", fixture_readme);

    fprintf("[fixture] done.\n");
end
