function [EEG, counts] = flag_non_brain_ics(EEG, brainThreshold)
%FLAG_NON_BRAIN_ICS Flag ICs whose brain probability is below threshold.
%
%   [EEG, counts] = hbn.flag_non_brain_ics(EEG, brainThreshold)
%   writes EEG.reject.gcompreject (1 x N_ic logical) with `true` for
%   ICs to drop (those with ICLabel brain probability < brainThreshold).
%   Returns a struct with per-class IC counts based on the argmax of
%   the classification matrix.
%
%   Flagging rather than deleting keeps the underlying IC structure
%   intact, so downstream phases can inspect rejected ICs without
%   re-running ICA. The pre-registered brain threshold for this
%   project is 0.69 (see .context/ideas.md).

    arguments
        EEG (1, 1) struct
        brainThreshold (1, 1) double {mustBeInRange(brainThreshold, 0, 1)}
    end

    if ~isfield(EEG, 'etc') || ~isfield(EEG.etc, 'ic_classification') || ...
            ~isfield(EEG.etc.ic_classification, 'ICLabel')
        error("hbn:phase3:flag:no_classifications", ...
            "EEG.etc.ic_classification.ICLabel missing; run hbn.run_iclabel first.");
    end

    probs = EEG.etc.ic_classification.ICLabel.classifications;
    classes = EEG.etc.ic_classification.ICLabel.classes;

    expected_classes = {'Brain', 'Muscle', 'Eye', 'Heart', 'Line Noise', 'Channel Noise', 'Other'};
    if numel(classes) ~= numel(expected_classes)
        error("hbn:phase3:flag:class_count_mismatch", ...
            "Expected %d ICLabel classes, got %d", ...
            numel(expected_classes), numel(classes));
    end
    for k = 1:numel(expected_classes)
        if ~strcmpi(classes{k}, expected_classes{k})
            error("hbn:phase3:flag:class_order_mismatch", ...
                "Class %d expected '%s', got '%s'", ...
                k, expected_classes{k}, classes{k});
        end
    end

    brain_probs = probs(:, 1);
    flag = brain_probs < brainThreshold;

    if ~isfield(EEG, 'reject') || isempty(EEG.reject)
        EEG.reject = struct();
    end
    EEG.reject.gcompreject = flag(:)';

    [~, argmax] = max(probs, [], 2);
    counts = struct( ...
        'brain_count', sum(argmax == 1 & ~flag), ...
        'muscle_count', sum(argmax == 2), ...
        'eye_count', sum(argmax == 3), ...
        'heart_count', sum(argmax == 4), ...
        'line_noise_count', sum(argmax == 5), ...
        'channel_noise_count', sum(argmax == 6), ...
        'other_count', sum(argmax == 7));
end
