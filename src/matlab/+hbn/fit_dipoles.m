function [EEG, stats] = fit_dipoles(EEG, head_model_dir)
%FIT_DIPOLES Localize ICs with dipfit5 using the standard MNI BEM.
%
%   [EEG, stats] = hbn.fit_dipoles(EEG, head_model_dir) configures the
%   dipfit5 model from `head_model_dir` (the standard_BEM folder shipped
%   with EEGLAB's dipfit plugin), then runs `pop_multifit` on every IC.
%
%   Returns stats:
%       stats.median_rv   median residual variance across ICs
%       stats.n_fitted    number of ICs with a finite dipole RV

    arguments
        EEG (1, 1) struct
        head_model_dir (1, 1) string
    end

    if ~isfolder(head_model_dir)
        error("hbn:phase2:dipfit:no_head_model", ...
            "Standard MNI BEM head model not found at %s", head_model_dir);
    end

    hdmFile = fullfile(head_model_dir, "standard_vol.mat");
    mriFile = fullfile(head_model_dir, "standard_mri.mat");
    chanFile = fullfile(head_model_dir, "elec", "standard_1005.elc");
    for f = [hdmFile, mriFile, chanFile]
        if ~isfile(f)
            error("hbn:phase2:dipfit:missing_artifact", ...
                "Required dipfit artifact missing: %s", f);
        end
    end

    try
        EEG = pop_dipfit_settings(EEG, ...
            'hdmfile', char(hdmFile), ...
            'mrifile', char(mriFile), ...
            'chanfile', char(chanFile), ...
            'coordformat', 'MNI', ...
            'chansel', 1:EEG.nbchan);
    catch ME
        error("hbn:phase2:dipfit:settings_failed", ...
            "pop_dipfit_settings failed: %s", ME.message);
    end

    try
        EEG = pop_multifit(EEG, 1:size(EEG.icaweights, 1), ...
            'threshold', 100, ...
            'plotopt', {'normlen', 'on'}, ...
            'rmout', 'on');
    catch ME
        error("hbn:phase2:dipfit:multifit_failed", ...
            "pop_multifit failed: %s", ME.message);
    end

    if ~isfield(EEG, 'dipfit') || ~isfield(EEG.dipfit, 'model') || isempty(EEG.dipfit.model)
        error("hbn:phase2:dipfit:no_dipoles", ...
            "pop_multifit returned no EEG.dipfit.model");
    end

    rv = nan(numel(EEG.dipfit.model), 1);
    for k = 1:numel(EEG.dipfit.model)
        m = EEG.dipfit.model(k);
        if isfield(m, 'rv') && ~isempty(m.rv) && isfinite(m.rv)
            rv(k) = m.rv;
        end
    end

    stats = struct( ...
        'median_rv', median(rv, 'omitnan'), ...
        'n_fitted', sum(isfinite(rv)));
end
