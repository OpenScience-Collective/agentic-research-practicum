function pngPath = save_brain_ic_topo_figure(EEG, outDir, subjId)
%SAVE_BRAIN_IC_TOPO_FIGURE Render the kept brain ICs as a topo montage.
%
%   pngPath = hbn.save_brain_ic_topo_figure(EEG, outDir, subjId)
%   writes <outDir>/<subjId>_brain-ic-topos.png with one tile per
%   surviving brain IC (gcompreject==false and argmax class == Brain).
%   If no brain IC survives, writes a placeholder text PNG so the file
%   exists for downstream QA but signals the issue.

    arguments
        EEG (1, 1) struct
        outDir (1, 1) string
        subjId (1, 1) string
    end

    if ~isfolder(outDir); mkdir(outDir); end
    probs = EEG.etc.ic_classification.ICLabel.classifications;
    flag = logical(EEG.reject.gcompreject(:));
    [~, argmax] = max(probs, [], 2);
    brainIcs = find(argmax == 1 & ~flag);

    pngPath = fullfile(outDir, sprintf("%s_brain-ic-topos.png", subjId));

    if isempty(brainIcs)
        fig = figure('Visible', 'off', 'Position', [100 100 800 400]);
        cleaner = onCleanup(@() close(fig)); %#ok<NASGU>
        axis off;
        text(0.5, 0.5, sprintf('%s: no brain ICs above threshold', subjId), ...
            'HorizontalAlignment', 'center', 'FontSize', 18, 'Interpreter', 'none');
        exportgraphics(fig, pngPath, 'Resolution', 150);
        return;
    end

    handlesBefore = findall(groot, 'Type', 'figure');

    nPlot = numel(brainIcs);
    rows = ceil(sqrt(nPlot));
    cols = ceil(nPlot / rows);
    pop_topoplot(EEG, 0, brainIcs', ...
        sprintf('%s brain ICs (%d kept)', subjId, nPlot), ...
        [rows cols], 0, 'electrodes', 'off');

    handlesAfter = findall(groot, 'Type', 'figure');
    newHandles = setdiff(handlesAfter, handlesBefore);
    if isempty(newHandles)
        error("hbn:phase3:brain_topo:no_figure", ...
            "pop_topoplot did not create a figure for %s", subjId);
    end
    fig = newHandles(end);
    cleaner = onCleanup(@() close_if_valid(newHandles)); %#ok<NASGU>

    set(fig, 'Visible', 'off');
    exportgraphics(fig, pngPath, 'Resolution', 150);
end

function close_if_valid(handles)
    for h = handles(:)'
        if isgraphics(h); close(h); end
    end
end
