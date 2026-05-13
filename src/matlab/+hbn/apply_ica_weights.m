function targetEEG = apply_ica_weights(sourceEEG, targetEEG)
%APPLY_ICA_WEIGHTS Copy ICA weights from sourceEEG onto targetEEG.
%
%   targetEEG = hbn.apply_ica_weights(sourceEEG, targetEEG) installs the
%   AMICA weights/sphere from sourceEEG into targetEEG (which is typically
%   the ThePresent-only Phase 1 .set restricted to the same channel set).
%   Used after multi-task AMICA training to attach the multi-task-learned
%   weights to the single-task analysis EEG.
%
%   Assumes channel set match: targetEEG must already be on the same
%   channel intersection as sourceEEG (use pop_select beforehand).

    arguments
        sourceEEG (1, 1) struct
        targetEEG (1, 1) struct
    end

    nChansTarget = size(targetEEG.data, 1);
    nChansSource = size(sourceEEG.icaweights, 2);
    if nChansTarget ~= nChansSource
        error("hbn:phase2:apply_weights:chan_mismatch", ...
            "target has %d channels, source AMICA was trained on %d; " + ...
            "pop_select target to the same intersection first", ...
            nChansTarget, nChansSource);
    end
    if isempty(sourceEEG.icaweights) || isempty(sourceEEG.icasphere)
        error("hbn:phase2:apply_weights:no_weights", ...
            "sourceEEG has no AMICA weights to copy");
    end

    targetEEG.icaweights = sourceEEG.icaweights;
    targetEEG.icasphere = sourceEEG.icasphere;
    targetEEG.icachansind = sourceEEG.icachansind;
    targetEEG.icawinv = sourceEEG.icawinv;
    targetEEG.icaact = [];
    targetEEG = eeg_checkset(targetEEG, 'ica');
end
