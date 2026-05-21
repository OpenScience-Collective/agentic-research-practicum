function test_phase3_smoke
%TEST_PHASE3_SMOKE Real-data smoke test for Phase 3 on a single subject.
%   Chains phase1_preprocess -> phase2_amica (IcaMethod=runica) ->
%   phase3_iclabel on the fixture. Asserts:
%     - ICLabel classifications attached to EEG.etc.ic_classification
%     - EEG.reject.gcompreject populated (length matches IC count)
%     - qa_iclabel.csv has one row with consistent per-class counts
%     - ic-classes and brain-ic-topos PNGs land in figures/
%     - params.json carries BrainThreshold + IcLabelVersion + tool versions
%
%   This is a wiring smoke test. IcaMethod=runica + MaxIter=100 means
%   the underlying decomposition is poor; do NOT interpret the brain_count
%   from this test as a quality signal. The 3-subject real-data run on
%   AMICA + 2000 iter is the place to read absolute brain-IC numbers.

    bidsRoot = test_bids_root();

    testOut = string(tempname);
    cleaner = onCleanup(@() rmdir_if_exists(testOut)); %#ok<NASGU>
    preprocDir = fullfile(testOut, "preproc");
    amicaDir = fullfile(testOut, "amica");
    iclabelDir = fullfile(testOut, "iclabel");

    phase1_preprocess( ...
        BidsRoot = bidsRoot, ...
        OutDir = preprocDir, ...
        SmokeSubjectCount = 1);

    phase2_amica( ...
        PreprocDir = preprocDir, ...
        OutDir = amicaDir, ...
        MaxIter = 100, ...
        DoReject = false, ...
        IcaMethod = "runica");

    paramsPath = phase3_iclabel( ...
        AmicaDir = amicaDir, ...
        OutDir = iclabelDir);

    assert(isfile(paramsPath), "params.json missing at %s", paramsPath);
    qaPath = fullfile(iclabelDir, "qa_iclabel.csv");
    assert(isfile(qaPath), "qa_iclabel.csv missing");

    setFiles = dir(fullfile(iclabelDir, "sub-*", "eeg", "*_desc-iclabel_eeg.set"));
    assert(numel(setFiles) == 1, ...
        "expected 1 ICLabel checkpoint, got %d", numel(setFiles));

    classPng = dir(fullfile(iclabelDir, "sub-*", "figures", "*_ic-classes.png"));
    brainPng = dir(fullfile(iclabelDir, "sub-*", "figures", "*_brain-ic-topos.png"));
    assert(numel(classPng) == 1, "expected 1 ic-classes PNG, got %d", numel(classPng));
    assert(numel(brainPng) == 1, "expected 1 brain-ic-topos PNG, got %d", numel(brainPng));

    qa = readtable(qaPath, "TextType", "string", "VariableNamingRule", "preserve");
    assert(height(qa) == 1, "qa_iclabel.csv should have 1 row, has %d", height(qa));
    assert(ismember(qa.status(1), ["ok", "ok_low_brain"]), ...
        "qa row status=%s expected ok or ok_low_brain", qa.status(1));
    assert(qa.n_components(1) > 0, "n_components should be positive");
    perClassSum = qa.brain_count(1) + qa.muscle_count(1) + qa.eye_count(1) + ...
        qa.heart_count(1) + qa.line_noise_count(1) + qa.channel_noise_count(1) + ...
        qa.other_count(1);
    % brain_count in QA reflects kept brain ICs (argmax == brain AND not flagged).
    % ICs whose argmax is brain but brain prob < threshold are flagged AND not
    % counted in brain_count; they fall through to "other_count"? No, they
    % stay in their argmax class but are flagged. So perClassSum may be less
    % than n_components by the count of argmax-brain-but-flagged ICs.
    assert(perClassSum <= qa.n_components(1), ...
        "per-class sum %d should not exceed n_components %d", ...
        perClassSum, qa.n_components(1));
    assert(qa.brain_threshold(1) == 0.69, ...
        "brain_threshold=%g expected 0.69", qa.brain_threshold(1));

    params = jsondecode(fileread(paramsPath));
    requiredFields = ["BrainThreshold", "IcLabelVersion", "MinBrainIcs", ...
        "AmicaDir", "OutDir", "Task", ...
        "matlab_version", "eeglab_version", "git_sha", "timestamp_iso", ...
        "n_subjects_input", "n_subjects_ok", "n_subjects_failed"];
    missingFields = setdiff(requiredFields, string(fieldnames(params)));
    assert(isempty(missingFields), ...
        "params.json missing fields: %s", strjoin(missingFields, ", "));
    assert(params.BrainThreshold == 0.69, "BrainThreshold should default to 0.69");

    EEG = pop_loadset('filename', setFiles(1).name, 'filepath', setFiles(1).folder);
    assert(isfield(EEG.etc, 'ic_classification'), ...
        "EEG.etc.ic_classification missing");
    assert(isfield(EEG.etc.ic_classification, 'ICLabel'), ...
        "EEG.etc.ic_classification.ICLabel missing");
    assert(size(EEG.etc.ic_classification.ICLabel.classifications, 1) == size(EEG.icaweights, 1), ...
        "classifications row count must match IC count");
    assert(isfield(EEG.reject, 'gcompreject') && ...
        numel(EEG.reject.gcompreject) == size(EEG.icaweights, 1), ...
        "EEG.reject.gcompreject must be a vector of length n_components");

    fprintf("test_phase3_smoke: OK (%d ICs, %d brain kept, %d flagged)\n", ...
        size(EEG.icaweights, 1), qa.brain_count(1), sum(EEG.reject.gcompreject));
end

function rmdir_if_exists(p)
    if isfolder(p)
        rmdir(p, 's');
    end
end
