function paramsPath = phase3_iclabel(opts)
%PHASE3_ICLABEL Classify ICs with ICLabel and flag non-brain components.
%   paramsPath = phase3_iclabel() runs on every Phase 2 checkpoint under
%   the default AmicaDir.
%   paramsPath = phase3_iclabel(Name=Value,...) overrides defaults.
%
%   Pipeline per subject:
%     load Phase 2 .set checkpoint
%       ->  pop_iclabel('default')                        (classifications)
%       ->  flag ICs where brain probability < BrainThreshold  (default 0.69)
%       ->  save IC class bar figure + brain-IC topo subset
%       ->  save checkpoint .set with classifications + flag
%       ->  qa_iclabel.csv row
%
%   The locked decision per .context/ideas.md is to drop ICs whose brain
%   class probability is below 0.69. We flag rather than physically
%   remove so Phase 4 (epoching) can still inspect the dropped ICs if
%   needed; flags live in EEG.reject.gcompreject and the rich
%   classifications stay in EEG.etc.ic_classification.ICLabel.
%
%   Outputs (rooted at opts.OutDir, default "derivatives/iclabel"):
%     params.json
%     qa_iclabel.csv
%     sub-<ID>/eeg/sub-<ID>_task-<Task>_desc-iclabel_eeg.set
%     sub-<ID>/figures/sub-<ID>_ic-classes.png
%     sub-<ID>/figures/sub-<ID>_brain-ic-topos.png
%
%   Name-value arguments:
%     AmicaDir         (1,1) string   default "derivatives/amica"
%     OutDir           (1,1) string   default "derivatives/iclabel"
%     Task             (1,1) string   default "ThePresent"
%     Subjects         (1,:) string   default string.empty
%     BrainThreshold   (1,1) double   default 0.69
%     IcLabelVersion   (1,1) string   default "default"
%     MinBrainIcs      (1,1) double   default 5      (subjects below get
%                                                    status="ok_low_brain")

    arguments
        opts.AmicaDir (1, 1) string = "derivatives/amica"
        opts.OutDir (1, 1) string = "derivatives/iclabel"
        opts.Task (1, 1) string = "ThePresent"
        opts.Subjects (1, :) string = string.empty
        opts.BrainThreshold (1, 1) double {mustBeInRange(opts.BrainThreshold, 0, 1)} = 0.69
        opts.IcLabelVersion (1, 1) string {mustBeMember(opts.IcLabelVersion, ["default", "lite", "beta"])} = "default"
        opts.MinBrainIcs (1, 1) double {mustBeNonnegative, mustBeInteger} = 5
    end

    if ~isfolder(opts.OutDir); mkdir(opts.OutDir); end
    qaPath = fullfile(opts.OutDir, "qa_iclabel.csv");
    if isfile(qaPath); delete(qaPath); end

    setFiles = dir(fullfile(opts.AmicaDir, "sub-*", "eeg", "*_desc-amica_eeg.set"));
    if isempty(setFiles)
        error("hbn:phase3:no_inputs", ...
            "No Phase 2 checkpoints found under %s/sub-*/eeg/*_desc-amica_eeg.set", ...
            opts.AmicaDir);
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
            error("hbn:phase3:no_subjects", ...
                "After filtering to Subjects=[%s], no checkpoints remain.", ...
                strjoin(opts.Subjects, ", "));
        end
    end
    fprintf("[phase3] %d Phase 2 checkpoint(s) to classify\n", numel(setFiles));

    nOk = 0;
    nFailed = 0;
    for i = 1:numel(setFiles)
        subjId = subjects_on_disk(i);
        fprintf("[phase3] (%d/%d) %s ...\n", i, numel(setFiles), subjId);
        tStart = tic;
        try
            EEG = pop_loadset('filename', setFiles(i).name, 'filepath', setFiles(i).folder);
            qaRow = process_one_subject(EEG, subjId, opts);
            qaRow.participant_id = subjId;
            qaRow.duration_s = toc(tStart);
            qaRow.error_message = "";
            hbn.write_qa_iclabel_csv(opts.OutDir, qaRow);
            nOk = nOk + 1;
        catch ME
            nFailed = nFailed + 1;
            stage = extract_stage_from_error(ME);
            warning("hbn:phase3:subject_failed", ...
                "subject %s failed at stage %s: %s", subjId, stage, ME.message);
            hbn.write_qa_iclabel_csv(opts.OutDir, struct( ...
                'participant_id', subjId, ...
                'status', "failed_" + stage, ...
                'n_components', NaN, ...
                'brain_count', NaN, ...
                'muscle_count', NaN, ...
                'eye_count', NaN, ...
                'heart_count', NaN, ...
                'line_noise_count', NaN, ...
                'channel_noise_count', NaN, ...
                'other_count', NaN, ...
                'brain_threshold', opts.BrainThreshold, ...
                'iclabel_version', opts.IcLabelVersion, ...
                'duration_s', toc(tStart), ...
                'error_message', ME.message));
        end
    end
    fprintf("[phase3] done. ok=%d failed=%d\n", nOk, nFailed);

    paramsPath = hbn.write_params_json(opts.OutDir, opts, struct( ...
        'n_subjects_input', numel(setFiles), ...
        'n_subjects_ok', nOk, ...
        'n_subjects_failed', nFailed));
end

function qaRow = process_one_subject(EEG, subjId, opts)
    out_eeg_dir = fullfile(opts.OutDir, subjId, "eeg");
    out_fig_dir = fullfile(opts.OutDir, subjId, "figures");
    for d = [out_eeg_dir, out_fig_dir]
        if ~isfolder(d); mkdir(d); end
    end

    EEG = hbn.run_iclabel(EEG, opts.IcLabelVersion);

    [EEG, classCounts] = hbn.flag_non_brain_ics(EEG, opts.BrainThreshold);

    hbn.save_ic_class_figure(EEG, out_fig_dir, subjId);
    hbn.save_brain_ic_topo_figure(EEG, out_fig_dir, subjId);

    out_set = sprintf("%s_task-%s_desc-iclabel_eeg.set", subjId, opts.Task);
    pop_saveset(EEG, 'filename', char(out_set), 'filepath', char(out_eeg_dir));

    status = "ok";
    if classCounts.brain_count < opts.MinBrainIcs
        status = "ok_low_brain";
    end

    qaRow = struct( ...
        'status', status, ...
        'n_components', size(EEG.icaweights, 1), ...
        'brain_count', classCounts.brain_count, ...
        'muscle_count', classCounts.muscle_count, ...
        'eye_count', classCounts.eye_count, ...
        'heart_count', classCounts.heart_count, ...
        'line_noise_count', classCounts.line_noise_count, ...
        'channel_noise_count', classCounts.channel_noise_count, ...
        'other_count', classCounts.other_count, ...
        'brain_threshold', opts.BrainThreshold, ...
        'iclabel_version', opts.IcLabelVersion);
end

function stage = extract_stage_from_error(ME)
    parts = split(string(ME.identifier), ':');
    if numel(parts) >= 3 && parts(1) == "hbn"
        stage = parts(3);
    else
        stage = "unknown";
    end
end
