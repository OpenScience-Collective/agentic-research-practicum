function pngPath = save_ic_topo_figure(EEG, outDir, subjId, numICs)
%SAVE_IC_TOPO_FIGURE Render the first N IC scalp topographies to PNG.
%
%   pngPath = hbn.save_ic_topo_figure(EEG, outDir, subjId, numICs)
%   writes <outDir>/<subjId>_ic-topos.png with a montage of the first
%   `numICs` independent components. Closes the figure before returning
%   so headless batch runs do not accumulate figure handles.
%
%   Note on figure capture: pop_topoplot opens its OWN figure; an empty
%   pre-created handle passed to exportgraphics produces a blank canvas
%   (visible as byte-identical PNGs across subjects). We snapshot the
%   set of figure handles before pop_topoplot, then claim every handle
%   that did not exist before, then export the topmost one.

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

    handlesBefore = findall(groot, 'Type', 'figure');

    pop_topoplot(EEG, 0, 1:nPlot, sprintf('%s first %d ICs', subjId, nPlot), ...
        [ceil(sqrt(nPlot)) ceil(nPlot / ceil(sqrt(nPlot)))], 0, 'electrodes', 'off');

    handlesAfter = findall(groot, 'Type', 'figure');
    newHandles = setdiff(handlesAfter, handlesBefore);
    if isempty(newHandles)
        error("hbn:phase2:topo:no_figure", ...
            "pop_topoplot did not create a figure for %s", subjId);
    end
    fig = newHandles(end);
    cleaner = onCleanup(@() close_if_valid(newHandles)); %#ok<NASGU>

    set(fig, 'Visible', 'off');
    % Earlier versions overlaid an sgtitle here; on a tight tile grid it
    % occludes the top-row tiles (ICs 1-5), making the highest-variance
    % components unreviewable. Skip sgtitle; pop_topoplot already wrote
    % the per-figure title via its 4th positional argument above.

    pngPath = fullfile(outDir, sprintf("%s_ic-topos.png", subjId));
    exportgraphics(fig, pngPath, 'Resolution', 150);
end

function close_if_valid(handles)
    for h = handles(:)'
        if isgraphics(h); close(h); end
    end
end
