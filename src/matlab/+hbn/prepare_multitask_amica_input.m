function [mergedEEG, info] = prepare_multitask_amica_input(opts, subjId)
%PREPARE_MULTITASK_AMICA_INPUT Concatenate cleaned per-task .set files for a subject.
%
%   [mergedEEG, info] = hbn.prepare_multitask_amica_input(opts, subjId)
%   ensures Phase 1 `.set` checkpoints exist for each task in
%   opts.IcaTasks (re-runs phase1_preprocess for missing ones), loads
%   them, restricts every dataset to the channel intersection, and
%   concatenates via pop_mergeset.
%
%   This is the data-pool expansion described in the project brief:
%   ICA training uses multi-task data so the sample-per-weight ratio
%   (k = nSamples / nChans^2) lifts above the under-determined regime.
%   Phase 4 onwards still analyzes ThePresent only; only the AMICA
%   weights are estimated on the merged pool.
%
%   info struct (per-subject diagnostics for qa_amica.csv):
%     info.ica_tasks       string array, tasks actually used
%     info.ica_samples     total samples in merged dataset
%     info.k_factor        ica_samples / nChans^2
%     info.common_channels number of channels surviving intersection

    arguments
        opts (1, 1) struct
        subjId (1, 1) string
    end

    if numel(opts.IcaTasks) == 0
        error("hbn:phase2:multitask:no_tasks", ...
            "IcaTasks is empty; need at least one task to load");
    end

    preprocDir = opts.PreprocDir;

    taskEEGs = cell(0, 1);
    usedTasks = string.empty;
    for t = opts.IcaTasks(:)'
        setName = sprintf("%s_task-%s_desc-clean_eeg.set", subjId, t);
        setPath = fullfile(preprocDir, subjId, "eeg", setName);

        if ~isfile(setPath)
            if isfield(opts, 'BidsRoot') && opts.BidsRoot ~= ""
                fprintf("[phase2-multitask] regenerating phase 1 for %s task=%s\n", subjId, t);
                try
                    phase1_preprocess( ...
                        'BidsRoot', opts.BidsRoot, ...
                        'OutDir', preprocDir, ...
                        'Task', t, ...
                        'Subjects', subjId);
                catch ME
                    warning("hbn:phase2:multitask:phase1_failed", ...
                        "phase1 regen failed for %s task=%s: %s; skipping task", ...
                        subjId, t, ME.message);
                    continue;
                end
            end
        end

        if ~isfile(setPath)
            warning("hbn:phase2:multitask:missing_task", ...
                "no Phase 1 .set for %s task=%s; skipping task", subjId, t);
            continue;
        end

        EEG = pop_loadset('filename', char(setName), ...
            'filepath', char(fullfile(preprocDir, subjId, "eeg")));
        taskEEGs{end + 1, 1} = EEG; %#ok<AGROW>
        usedTasks(end + 1) = t; %#ok<AGROW>
    end

    if isempty(taskEEGs)
        error("hbn:phase2:multitask:no_inputs", ...
            "No Phase 1 .set files loaded for %s across IcaTasks=[%s]", ...
            subjId, strjoin(opts.IcaTasks, ", "));
    end

    common = string({taskEEGs{1}.chanlocs.labels});
    for k = 2:numel(taskEEGs)
        common = intersect(common, string({taskEEGs{k}.chanlocs.labels}), 'stable');
    end
    if numel(common) < 32
        error("hbn:phase2:multitask:few_common_channels", ...
            "Only %d channels common across %d tasks for %s; cannot fit AMICA", ...
            numel(common), numel(taskEEGs), subjId);
    end

    for k = 1:numel(taskEEGs)
        taskEEGs{k} = pop_select(taskEEGs{k}, 'channel', cellstr(common));
    end

    if numel(taskEEGs) == 1
        mergedEEG = taskEEGs{1};
    else
        mergedEEG = pop_mergeset([taskEEGs{:}], 1:numel(taskEEGs));
    end

    nSamples = size(mergedEEG.data, 2);
    nChans = size(mergedEEG.data, 1);
    info = struct( ...
        'ica_tasks', strjoin(usedTasks, "+"), ...
        'ica_samples', nSamples, ...
        'k_factor', nSamples / (nChans^2), ...
        'common_channels', nChans);

    fprintf("[phase2-multitask] %s: merged %d tasks (%s), %d samples, %d common chans, k=%.2f\n", ...
        subjId, numel(taskEEGs), strjoin(usedTasks, "+"), nSamples, nChans, info.k_factor);
end
