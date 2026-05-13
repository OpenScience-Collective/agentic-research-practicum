function pngPath = save_dipole_figure(EEG, outDir, subjId)
%SAVE_DIPOLE_FIGURE Render dipole montage to PNG for QA review.
%
%   pngPath = hbn.save_dipole_figure(EEG, outDir, subjId) writes
%   <outDir>/<subjId>_dipoles.png with the standard pop_dipplot
%   top-view image. ICs without a finite dipole position (RV NaN) are
%   skipped.
%
%   Like save_ic_topo_figure, this snapshots figure handles before and
%   after pop_dipplot to grab the figure that pop_dipplot actually
%   creates, instead of exporting an empty pre-allocated handle.

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

    handlesBefore = findall(groot, 'Type', 'figure');

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

    handlesAfter = findall(groot, 'Type', 'figure');
    newHandles = setdiff(handlesAfter, handlesBefore);
    if isempty(newHandles)
        error("hbn:phase2:dipplot:no_figure", ...
            "pop_dipplot did not create a figure for %s", subjId);
    end
    fig = newHandles(end);
    cleaner = onCleanup(@() close_if_valid(newHandles)); %#ok<NASGU>

    set(fig, 'Visible', 'off');
    % pop_dipplot leaves the axes visible by default which prints a
    % gridline mesh across the rendered brain. Hide every axes inside
    % the figure so the export shows only the dipole + head surface.
    axesHandles = findall(fig, 'Type', 'axes');
    for a = axesHandles(:)'
        set(a, 'Visible', 'off');
    end
    try
        sgtitle(fig, sprintf('%s, fitted dipoles (%d of %d ICs)', ...
            subjId, numel(fitted), numel(EEG.dipfit.model)), 'Interpreter', 'none');
    catch
    end

    pngPath = fullfile(outDir, sprintf("%s_dipoles.png", subjId));
    exportgraphics(fig, pngPath, 'Resolution', 150);
end

function close_if_valid(handles)
    for h = handles(:)'
        if isgraphics(h); close(h); end
    end
end
