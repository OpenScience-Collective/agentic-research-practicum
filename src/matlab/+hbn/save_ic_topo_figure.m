function pngPath = save_ic_topo_figure(EEG, outDir, subjId, numICs)
%SAVE_IC_TOPO_FIGURE Render the first N IC scalp topographies to PNG.
%
%   pngPath = hbn.save_ic_topo_figure(EEG, outDir, subjId, numICs)
%   writes <outDir>/<subjId>_ic-topos.png with a montage of the first
%   `numICs` independent components. Closes the figure before returning
%   so headless batch runs do not accumulate figure handles.

    arguments
        EEG (1, 1) struct
        outDir (1, 1) string
        subjId (1, 1) string
        numICs (1, 1) double {mustBePositive, mustBeInteger} = 30
    end

    if ~isfolder(outDir); mkdir(outDir); end

    nAvail = size(EEG.icaweights, 1);
    if nAvail == 0
        error("hbn:phase2:topo:no_ics", ...
            "EEG has no IC weights; cannot render topographies.");
    end
    nPlot = min(numICs, nAvail);

    fig = figure('Visible', 'off', 'Position', [100 100 1200 900]);
    cleaner = onCleanup(@() close(fig)); %#ok<NASGU>

    pop_topoplot(EEG, 0, 1:nPlot, sprintf('%s first %d ICs', subjId, nPlot), ...
        [ceil(sqrt(nPlot)) ceil(nPlot / ceil(sqrt(nPlot)))], 0, 'electrodes', 'off');

    sgtitle(sprintf('%s, IC scalp topographies (first %d of %d)', ...
        subjId, nPlot, nAvail), 'Interpreter', 'none');

    pngPath = fullfile(outDir, sprintf("%s_ic-topos.png", subjId));
    exportgraphics(fig, pngPath, 'Resolution', 150);
end
