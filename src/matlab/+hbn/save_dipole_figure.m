function pngPath = save_dipole_figure(EEG, outDir, subjId)
%SAVE_DIPOLE_FIGURE Render dipole montage to PNG for QA review.
%
%   pngPath = hbn.save_dipole_figure(EEG, outDir, subjId) writes
%   <outDir>/<subjId>_dipoles.png with the standard pop_dipplot montage
%   (top + side + back views). ICs that did not get a dipole (residual
%   variance NaN) are skipped.

    arguments
        EEG (1, 1) struct
        outDir (1, 1) string
        subjId (1, 1) string
    end

    if ~isfolder(outDir); mkdir(outDir); end
    if ~isfield(EEG, 'dipfit') || ~isfield(EEG.dipfit, 'model') || isempty(EEG.dipfit.model)
        error("hbn:phase2:dipplot:no_model", ...
            "EEG.dipfit.model missing; cannot render dipole figure.");
    end

    fitted = [];
    for k = 1:numel(EEG.dipfit.model)
        m = EEG.dipfit.model(k);
        if isfield(m, 'posxyz') && ~isempty(m.posxyz) && all(isfinite(m.posxyz(:)))
            fitted(end + 1) = k; %#ok<AGROW>
        end
    end
    if isempty(fitted)
        error("hbn:phase2:dipplot:no_fitted", ...
            "No ICs have finite dipole positions; nothing to plot.");
    end

    fig = figure('Visible', 'off', 'Position', [100 100 1400 500]);
    cleaner = onCleanup(@() close(fig)); %#ok<NASGU>

    try
        pop_dipplot(EEG, fitted, ...
            'mri', EEG.dipfit.mrifile, ...
            'projlines', 'on', ...
            'normlen', 'on', ...
            'view', [0 0 1]);
    catch ME
        error("hbn:phase2:dipplot:plot_failed", ...
            "pop_dipplot failed: %s", ME.message);
    end

    sgtitle(sprintf('%s, fitted dipoles (%d of %d ICs)', ...
        subjId, numel(fitted), numel(EEG.dipfit.model)), 'Interpreter', 'none');

    pngPath = fullfile(outDir, sprintf("%s_dipoles.png", subjId));
    exportgraphics(fig, pngPath, 'Resolution', 150);
end
