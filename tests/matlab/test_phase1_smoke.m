function test_phase1_smoke
%TEST_PHASE1_SMOKE Real-data smoke test for Phase 1 on a single subject.
%   Runs phase1_preprocess with SmokeSubjectCount=1 and asserts that:
%     - params.json and qa_channels.csv are produced and carry expected fields
%     - exactly one checkpoint .set is written
%     - four PSD PNGs land in the figures directory
%     - the checkpoint loads and round-trips with matching channel count
%       and srate against the QA CSV
%
%   No mocks. If the local BIDS dataset is missing, the test fails with
%   a clear message and must be run on a machine with the data available.

    bidsRoot = test_bids_root();

    testOut = string(tempname);
    cleaner = onCleanup(@() rmdir_if_exists(testOut)); %#ok<NASGU>

    paramsPath = phase1_preprocess( ...
        BidsRoot = bidsRoot, ...
        OutDir = testOut, ...
        SmokeSubjectCount = 1);

    % Artifact existence
    assert(isfile(paramsPath), "params.json missing at %s", paramsPath);
    qaPath = fullfile(testOut, "qa_channels.csv");
    assert(isfile(qaPath), "qa_channels.csv missing");

    setFiles = dir(fullfile(testOut, "sub-*", "eeg", "*_desc-clean_eeg.set"));
    assert(numel(setFiles) == 1, ...
        "expected 1 .set file, got %d", numel(setFiles));

    pngFiles = dir(fullfile(testOut, "sub-*", "figures", "*_psd.png"));
    assert(numel(pngFiles) == 4, ...
        "expected 4 PSD PNGs (raw/hpf/cleanline/chanreject), got %d", numel(pngFiles));

    % params.json schema: every documented field must be present so a
    % regression that drops `extra` fields (n_subjects_*, bids_import_scratch)
    % or core opts (LineNoiseHz, ChannelCriterion, ...) does not pass silently.
    params = jsondecode(fileread(paramsPath));
    requiredFields = ["HpfHz", "RunCleanline", "LineNoiseHz", "ChannelCriterion", ...
        "LineNoiseCriterion", "Task", "BidsRoot", "SmokeSubjectCount", ...
        "matlab_version", "eeglab_version", "git_sha", "timestamp_iso", ...
        "n_subjects_eligible", "n_subjects_ok", "n_subjects_failed", ...
        "n_subjects_missing_from_import", "bids_import_scratch"];
    missingFields = setdiff(requiredFields, string(fieldnames(params)));
    assert(isempty(missingFields), ...
        "params.json missing fields: %s", strjoin(missingFields, ", "));
    assert(params.HpfHz == 1, "HpfHz=%g expected 1", params.HpfHz);
    assert(islogical(params.RunCleanline) && ~params.RunCleanline, ...
        "RunCleanline should default to false");
    assert(params.n_subjects_ok == 1, "n_subjects_ok=%d expected 1", params.n_subjects_ok);
    assert(params.n_subjects_failed == 0, "n_subjects_failed=%d expected 0", params.n_subjects_failed);
    assert(params.SmokeSubjectCount == 1, "SmokeSubjectCount mismatch");
    assert(strlength(string(params.git_sha)) > 0, "git_sha should be populated or 'unknown'");
    assert(numel(params.LineNoiseHz) == 3, ...
        "LineNoiseHz expected 3-element default, got %d", numel(params.LineNoiseHz));

    % qa_channels.csv content
    qa = readtable(qaPath, "TextType", "string", "VariableNamingRule", "preserve");
    assert(height(qa) == 1, "qa_channels.csv should have 1 row, has %d", height(qa));
    assert(qa.status(1) == "ok", "qa row status=%s expected ok", qa.status(1));
    assert(qa.cleanline_status(1) == "skipped_nyquist", ...
        "cleanline_status=%s expected skipped_nyquist at 100 Hz", qa.cleanline_status(1));
    assert(qa.srate(1) > 0, "srate in QA CSV should be positive");
    % Cz reference is flat by construction in HBN; channel rejection must
    % flag at least one channel. A no-op rejector would silently pass without
    % this assertion.
    assert(strlength(qa.rejected_channels(1)) > 0, ...
        "rejected_channels should be non-empty (Cz expected); got '%s'", ...
        qa.rejected_channels(1));

    % Checkpoint round-trip and consistency
    EEG = pop_loadset('filename', setFiles(1).name, 'filepath', setFiles(1).folder);
    assert(EEG.srate == qa.srate(1), ...
        "set srate=%g disagrees with QA srate=%g", EEG.srate, qa.srate(1));
    assert(EEG.nbchan == qa.n_channels_after(1), ...
        "set nbchan=%d disagrees with QA n_channels_after=%d", ...
        EEG.nbchan, qa.n_channels_after(1));
    assert(EEG.nbchan > 0, "checkpoint has zero channels");
    assert(EEG.pnts > 0, "checkpoint has empty data");
    % Verify the high-pass actually ran by comparing 0-0.5 Hz power (well
    % below the 1 Hz HPF passband) on the saved checkpoint against a
    % freshly-imported raw segment from the same subject. The threshold of
    % 0.5x is conservative: a real 1 Hz HPF kills sub-passband power by
    % orders of magnitude; a no-op leaves the ratio near 1.
    rawSet = dir(fullfile(testOut, "_bids_import_scratch", "**", ...
        sprintf("%s_*.set", string(EEG.subject))));
    % Fail loudly if the scratch tree layout changed; silently skipping the
    % HPF assertion would defeat its purpose.
    assert(~isempty(rawSet), ...
        "raw scratch SET not found under %s; HPF efficacy check would silently skip", ...
        fullfile(testOut, "_bids_import_scratch"));
    rawEEG = pop_loadset('filename', rawSet(1).name, 'filepath', rawSet(1).folder);
    rawLow = mean(bandpower_safe(rawEEG.data, rawEEG.srate, 0, 0.5));
    cleanLow = mean(bandpower_safe(EEG.data, EEG.srate, 0, 0.5));
    assert(cleanLow < 0.5 * rawLow, ...
        "1 Hz HPF appears not to have run: rawLow=%.3g cleanLow=%.3g", ...
        rawLow, cleanLow);

    fprintf("test_phase1_smoke: OK\n");
end

function p = bandpower_safe(data, srate, lo, hi)
    % Mean band-power per channel between [lo, hi] Hz via FFT on the full
    % continuous record. Returns a vector with one entry per channel.
    n = size(data, 2);
    f = (0:n - 1) * srate / n;
    keep = f >= lo & f <= hi;
    spec = abs(fft(double(data), [], 2)).^2;
    p = mean(spec(:, keep), 2);
end

function rmdir_if_exists(p)
    if isfolder(p)
        rmdir(p, 's');
    end
end
