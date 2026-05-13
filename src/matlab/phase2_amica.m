function paramsPath = phase2_amica(opts)
%PHASE2_AMICA AMICA decomposition + dipfit5 localization for HBN R3.
%   paramsPath = phase2_amica() runs on every Phase 1 checkpoint under
%   the default PreprocDir.
%   paramsPath = phase2_amica(Name=Value,...) overrides defaults.
%
%   Pipeline per subject:
%     load Phase 1 .set checkpoint
%       ->  runamica15 (single model, num_cores threads, do_reject=1)
%       ->  eeg_loadamica (attach weights/sphere/mods to EEG)
%       ->  pop_dipfit_settings (standard MNI BEM)
%       ->  pop_multifit (per-IC dipole localization)
%       ->  save IC topo PNG (first 30 components)
%       ->  save dipole montage PNG
%       ->  save checkpoint .set with weights + dipoles
%       ->  qa_amica.csv row
%
%   Per-subject failures are caught, logged, and recorded in the QA CSV
%   with status="failed_<stage>" so a single AMICA non-convergence does
%   not abort the cohort. The default `max_threads` adapts to the host
%   via `feature('numcores')`, so the same code runs on a 12-core local
%   Mac and a 2-core GitHub Actions runner.
%
%   Outputs (rooted at opts.OutDir, default "derivatives/amica"):
%     params.json
%     qa_amica.csv
%     sub-<ID>/eeg/sub-<ID>_task-<Task>_desc-amica_eeg.set
%     sub-<ID>/_amica/                 # AMICA model directory (W, S, mods)
%     sub-<ID>/figures/sub-<ID>_ic-topos.png
%     sub-<ID>/figures/sub-<ID>_dipoles.png
%
%   Name-value arguments:
%     PreprocDir   (1,1) string   default "derivatives/preproc"
%     OutDir       (1,1) string   default "derivatives/amica"
%     Task         (1,1) string   default "ThePresent"
%     Subjects     (1,:) string   default string.empty   (empty = all on disk)
%     NumModels    (1,1) double   default 1
%     MaxIter      (1,1) double   default 2000
%     MaxThreads   (1,1) double   default feature('numcores')
%     DoReject     (1,1) logical  default true
%     NumRej       (1,1) double   default 5
%     RejSig       (1,1) double   default 4
%     NumTopoICs   (1,1) double   default 30
%     IcaMethod    (1,1) string   default "amica"        ("amica" or "runica")
%     EeglabRoot   (1,1) string   default ""             (probed if empty)
%
%   IcaMethod="amica" is the production path (matches the brief). The
%   CI smoke test sets IcaMethod="runica" because AMICA's native Fortran
%   binary needs MPI runtime libs that Ubuntu runners do not have. Both
%   paths populate EEG.icaweights / icasphere / icawinv, so downstream
%   dipfit + figure code does not branch on the method.

    arguments
        opts.PreprocDir (1, 1) string = "derivatives/preproc"
        opts.OutDir (1, 1) string = "derivatives/amica"
        opts.Task (1, 1) string = "ThePresent"
        opts.Subjects (1, :) string = string.empty
        opts.NumModels (1, 1) double {mustBePositive, mustBeInteger} = 1
        opts.MaxIter (1, 1) double {mustBePositive, mustBeInteger} = 2000
        opts.MaxThreads (1, 1) double {mustBePositive, mustBeInteger} = feature('numcores')
        opts.DoReject (1, 1) logical = true
        opts.NumRej (1, 1) double {mustBeNonnegative, mustBeInteger} = 5
        opts.RejSig (1, 1) double {mustBePositive} = 4
        opts.NumTopoICs (1, 1) double {mustBePositive, mustBeInteger} = 30
        opts.IcaMethod (1, 1) string {mustBeMember(opts.IcaMethod, ["amica", "runica"])} = "amica"
        opts.EeglabRoot (1, 1) string = ""
    end

    if ~isfolder(opts.OutDir); mkdir(opts.OutDir); end

    qaPath = fullfile(opts.OutDir, "qa_amica.csv");
    if isfile(qaPath); delete(qaPath); end

    setFiles = dir(fullfile(opts.PreprocDir, "sub-*", "eeg", "*_desc-clean_eeg.set"));
    if isempty(setFiles)
        error("hbn:phase2:no_inputs", ...
            "No Phase 1 checkpoints found under %s/sub-*/eeg/*_desc-clean_eeg.set", ...
            opts.PreprocDir);
    end

    subjects_on_disk = strings(numel(setFiles), 1);
    for k = 1:numel(setFiles)
        parts = strsplit(setFiles(k).name, "_");
        subjects_on_disk(k) = parts(1);
    end
    [~, ord] = sort(subjects_on_disk);
    setFiles = setFiles(ord);
    subjects_on_disk = subjects_on_disk(ord);

    if ~isempty(opts.Subjects)
        keep = ismember(subjects_on_disk, opts.Subjects);
        setFiles = setFiles(keep);
        subjects_on_disk = subjects_on_disk(keep);
        if isempty(setFiles)
            error("hbn:phase2:no_subjects", ...
                "After filtering to Subjects=[%s], no checkpoints remain.", ...
                strjoin(opts.Subjects, ", "));
        end
    end
    fprintf("[phase2] %d Phase 1 checkpoint(s) to decompose\n", numel(setFiles));

    eeglab_root = resolve_eeglab_root(opts.EeglabRoot);
    head_model = fullfile(eeglab_root, "plugins", "dipfit", "standard_BEM");

    nOk = 0;
    nFailed = 0;
    for i = 1:numel(setFiles)
        subjId = subjects_on_disk(i);
        fprintf("[phase2] (%d/%d) %s ...\n", i, numel(setFiles), subjId);
        tStart = tic;
        try
            EEG = pop_loadset('filename', setFiles(i).name, 'filepath', setFiles(i).folder);
            qaRow = process_one_subject(EEG, subjId, head_model, opts);
            qaRow.participant_id = subjId;
            qaRow.status = "ok";
            qaRow.duration_s = toc(tStart);
            qaRow.error_message = "";
            hbn.write_qa_amica_csv(opts.OutDir, qaRow);
            nOk = nOk + 1;
        catch ME
            nFailed = nFailed + 1;
            stage = extract_stage_from_error(ME);
            warning("hbn:phase2:subject_failed", ...
                "subject %s failed at stage %s: %s", subjId, stage, ME.message);
            hbn.write_qa_amica_csv(opts.OutDir, struct( ...
                'participant_id', subjId, ...
                'status', "failed_" + stage, ...
                'ica_method', opts.IcaMethod, ...
                'n_components', NaN, ...
                'final_ll', NaN, ...
                'iterations', NaN, ...
                'reached_max_iter', false, ...
                'median_rv', NaN, ...
                'num_models', opts.NumModels, ...
                'max_threads', opts.MaxThreads, ...
                'duration_s', toc(tStart), ...
                'error_message', ME.message));
        end
    end
    fprintf("[phase2] done. ok=%d failed=%d\n", nOk, nFailed);

    paramsPath = hbn.write_params_json(opts.OutDir, opts, struct( ...
        'n_subjects_input', numel(setFiles), ...
        'n_subjects_ok', nOk, ...
        'n_subjects_failed', nFailed, ...
        'eeglab_root', char(eeglab_root)));
end

function qaRow = process_one_subject(EEG, subjId, head_model, opts)
    out_eeg_dir = fullfile(opts.OutDir, subjId, "eeg");
    out_amica_dir = fullfile(opts.OutDir, subjId, "_amica");
    out_fig_dir = fullfile(opts.OutDir, subjId, "figures");
    for d = [out_eeg_dir, out_amica_dir, out_fig_dir]
        if ~isfolder(d); mkdir(d); end
    end

    switch lower(opts.IcaMethod)
        case "amica"
            [EEG, amicaStats] = hbn.run_amica(EEG, out_amica_dir, opts);
        case "runica"
            [EEG, amicaStats] = hbn.run_infomax(EEG, out_amica_dir, opts);
        otherwise
            error("hbn:phase2:unknown_ica_method", ...
                "IcaMethod=%s not supported", opts.IcaMethod);
    end

    [EEG, dipoleStats] = hbn.fit_dipoles(EEG, head_model);

    hbn.save_ic_topo_figure(EEG, out_fig_dir, subjId, opts.NumTopoICs);
    hbn.save_dipole_figure(EEG, out_fig_dir, subjId);

    out_set = sprintf("%s_task-%s_desc-amica_eeg.set", subjId, opts.Task);
    pop_saveset(EEG, 'filename', char(out_set), 'filepath', char(out_eeg_dir));

    qaRow = struct( ...
        'ica_method', opts.IcaMethod, ...
        'n_components', EEG.nbchan, ...
        'final_ll', amicaStats.final_ll, ...
        'iterations', amicaStats.iterations, ...
        'reached_max_iter', amicaStats.reached_max_iter, ...
        'median_rv', dipoleStats.median_rv, ...
        'num_models', opts.NumModels, ...
        'max_threads', opts.MaxThreads);
end

function root = resolve_eeglab_root(override)
    if override ~= ""
        root = override;
        return;
    end
    w = which('eeglab');
    if isempty(w)
        error("hbn:phase2:no_eeglab", ...
            "EEGLAB not on path; pass EeglabRoot or add EEGLAB before calling phase2.");
    end
    root = string(fileparts(w));
end

function stage = extract_stage_from_error(ME)
    parts = split(string(ME.identifier), ':');
    if numel(parts) >= 3 && parts(1) == "hbn"
        stage = parts(3);
    else
        stage = "unknown";
    end
end
