function test_phase2_smoke
%TEST_PHASE2_SMOKE Real-data smoke test for Phase 2 on a single subject.
%   Chains phase1_preprocess -> phase2_amica on the fixture (or whatever
%   HBN_BIDS_ROOT resolves to via test_bids_root). Asserts:
%     - AMICA weights attached (EEG.icaweights non-empty)
%     - Dipoles fitted (EEG.dipfit.model populated with finite positions)
%     - qa_amica.csv produced with one ok row
%     - IC topo and dipole PNGs land in figures/
%     - params.json carries the AMICA parameters and tool versions
%
%   IMPORTANT: this is a *wiring* smoke test, not a science-quality
%   decomposition. It runs at MaxIter=100 with DoReject=false on 60 s of
%   data; the resulting IC topographies, RV distribution, and dipole
%   coverage are predictably poor. The 3-subject real-data run
%   (scripts/run_phase2_three_subjects.m) uses MaxIter=2000 and
%   DoReject=true on ~210 s recordings, which is what produces
%   interpretable results. Do NOT interpret RV from this test scientifically.
%
%   Wall-time: ~5-7 min total (1 min Phase 1 + 1-2 min AMICA at 100 iters
%   + 2-4 min per-IC dipfit). On CI runners with 2-4 cores expect upper end.
%
%   No mocks. If neither HBN_BIDS_ROOT nor the fixture nor the /Volumes
%   path resolves, test_bids_root errors with a clear message.

    bidsRoot = test_bids_root();

    testOut = string(tempname);
    cleaner = onCleanup(@() rmdir_if_exists(testOut)); %#ok<NASGU>
    preprocDir = fullfile(testOut, "preproc");
    amicaDir = fullfile(testOut, "amica");

    phase1_preprocess( ...
        BidsRoot = bidsRoot, ...
        OutDir = preprocDir, ...
        SmokeSubjectCount = 1);

    paramsPath = phase2_amica( ...
        PreprocDir = preprocDir, ...
        OutDir = amicaDir, ...
        MaxIter = 100, ...
        DoReject = false);

    assert(isfile(paramsPath), "params.json missing at %s", paramsPath);
    qaPath = fullfile(amicaDir, "qa_amica.csv");
    assert(isfile(qaPath), "qa_amica.csv missing");

    setFiles = dir(fullfile(amicaDir, "sub-*", "eeg", "*_desc-amica_eeg.set"));
    assert(numel(setFiles) == 1, ...
        "expected 1 AMICA checkpoint, got %d", numel(setFiles));

    icPng = dir(fullfile(amicaDir, "sub-*", "figures", "*_ic-topos.png"));
    dipPng = dir(fullfile(amicaDir, "sub-*", "figures", "*_dipoles.png"));
    assert(numel(icPng) == 1, "expected 1 IC topo PNG, got %d", numel(icPng));
    assert(numel(dipPng) == 1, "expected 1 dipole PNG, got %d", numel(dipPng));

    qa = readtable(qaPath, "TextType", "string", "VariableNamingRule", "preserve");
    assert(height(qa) == 1, "qa_amica.csv should have 1 row, has %d", height(qa));
    assert(qa.status(1) == "ok", "qa row status=%s expected ok", qa.status(1));
    assert(qa.n_components(1) > 0, "n_components should be positive");
    assert(isfinite(qa.final_ll(1)), "final_ll should be finite");
    assert(qa.iterations(1) > 0, "iterations should be positive");
    assert(isfinite(qa.median_rv(1)) && qa.median_rv(1) >= 0 && qa.median_rv(1) <= 1, ...
        "median_rv should be in [0,1], got %.3f", qa.median_rv(1));

    params = jsondecode(fileread(paramsPath));
    requiredFields = ["NumModels", "MaxIter", "MaxThreads", "DoReject", ...
        "NumRej", "RejSig", "PreprocDir", "OutDir", "Task", ...
        "matlab_version", "eeglab_version", "git_sha", "timestamp_iso", ...
        "n_subjects_input", "n_subjects_ok", "n_subjects_failed", "eeglab_root"];
    missingFields = setdiff(requiredFields, string(fieldnames(params)));
    assert(isempty(missingFields), ...
        "params.json missing fields: %s", strjoin(missingFields, ", "));
    assert(params.n_subjects_ok == 1, "n_subjects_ok=%d expected 1", params.n_subjects_ok);

    EEG = pop_loadset('filename', setFiles(1).name, 'filepath', setFiles(1).folder);
    assert(~isempty(EEG.icaweights), "EEG.icaweights empty");
    assert(~isempty(EEG.icasphere), "EEG.icasphere empty");
    assert(size(EEG.icaweights, 1) == qa.n_components(1), ...
        "set IC count %d disagrees with QA n_components %d", ...
        size(EEG.icaweights, 1), qa.n_components(1));
    assert(isfield(EEG, 'dipfit') && ~isempty(EEG.dipfit.model), ...
        "EEG.dipfit.model missing or empty");
    finite_dipoles = 0;
    for k = 1:numel(EEG.dipfit.model)
        m = EEG.dipfit.model(k);
        if isfield(m, 'posxyz') && ~isempty(m.posxyz) && all(isfinite(m.posxyz(:)))
            finite_dipoles = finite_dipoles + 1;
        end
    end
    assert(finite_dipoles > 0, "no ICs got a finite dipole position");

    fprintf("test_phase2_smoke: OK (%d ICs, %d dipoles, median RV %.3f)\n", ...
        size(EEG.icaweights, 1), finite_dipoles, qa.median_rv(1));
end

function rmdir_if_exists(p)
    if isfolder(p)
        rmdir(p, 's');
    end
end
