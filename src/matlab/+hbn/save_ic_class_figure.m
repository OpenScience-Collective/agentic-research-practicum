function pngPath = save_ic_class_figure(EEG, outDir, subjId)
%SAVE_IC_CLASS_FIGURE Bar chart of IC class counts and rejection flags.
%
%   Renders <outDir>/<subjId>_ic-classes.png with:
%     - top: stacked bar of per-class IC counts based on argmax of
%             ICLabel classification probabilities
%     - bottom: scatter of brain probability vs IC index, with the
%               rejection threshold drawn as a horizontal line

    arguments
        EEG (1, 1) struct
        outDir (1, 1) string
        subjId (1, 1) string
    end

    if ~isfolder(outDir); mkdir(outDir); end
    probs = EEG.etc.ic_classification.ICLabel.classifications;
    classes = EEG.etc.ic_classification.ICLabel.classes;

    flag = false(size(probs, 1), 1);
    if isfield(EEG, 'reject') && isfield(EEG.reject, 'gcompreject')
        flag = logical(EEG.reject.gcompreject(:));
    end
    [~, argmax] = max(probs, [], 2);

    counts = zeros(numel(classes), 1);
    for k = 1:numel(classes)
        counts(k) = sum(argmax == k);
    end
    brain_kept = sum(argmax == 1 & ~flag);
    brain_dropped = sum(argmax == 1 & flag);

    fig = figure('Visible', 'off', 'Position', [100 100 1000 700]);
    cleaner = onCleanup(@() close(fig)); %#ok<NASGU>

    subplot(2, 1, 1);
    bar_data = counts;
    bar_data(1) = brain_kept;
    extra = brain_dropped;
    hold on;
    bar(1:numel(classes), bar_data, 'FaceColor', [0.2 0.6 0.2]);
    if extra > 0
        bar(1, brain_kept + extra, 'FaceColor', [0.7 0.2 0.2], 'FaceAlpha', 0.4);
        bar(1, brain_kept, 'FaceColor', [0.2 0.6 0.2]);
    end
    set(gca, 'XTick', 1:numel(classes), 'XTickLabel', classes);
    ylabel('IC count');
    title(sprintf('%s, IC class counts (brain kept: %d, brain dropped: %d)', ...
        subjId, brain_kept, brain_dropped), 'Interpreter', 'none');
    grid on;

    subplot(2, 1, 2);
    nIc = size(probs, 1);
    hold on;
    scatter(1:nIc, probs(:, 1), 36, 'filled', 'MarkerFaceColor', [0.2 0.4 0.8]);
    yline(0.69, '--', 'brain threshold 0.69');
    xlabel('IC index');
    ylabel('Brain probability');
    ylim([0 1]);
    xlim([0 nIc + 1]);
    grid on;
    title('Brain probability per IC');

    pngPath = fullfile(outDir, sprintf("%s_ic-classes.png", subjId));
    exportgraphics(fig, pngPath, 'Resolution', 150);
end
