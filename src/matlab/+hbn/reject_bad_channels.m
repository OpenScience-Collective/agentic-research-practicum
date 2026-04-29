function [EEG, rejected] = reject_bad_channels(EEG, opts)
%REJECT_BAD_CHANNELS Channel-level rejection via pop_clean_rawdata.
%   [EEG, rejected] = hbn.reject_bad_channels(EEG, opts) runs
%   pop_clean_rawdata in channel-rejection-only mode: no ASR, no windowed
%   rejection, no additional high-pass. `rejected` is a string array of
%   channel labels that were removed, derived by diffing chanlocs pre/post.
%
%   The Cz reference electrode in the HBN BIDS dataset is flat by
%   construction and is typically flagged by this step; that is expected
%   behavior, not a pipeline failure. See `.context/research.md` for the
%   full rationale.
%
%   Errors if pop_clean_rawdata returns zero channels (hbn:reject_bad_channels:all_rejected).
    arguments
        EEG struct
        opts struct
    end
    before = string({EEG.chanlocs.labels});
    try
        EEG = pop_clean_rawdata(EEG, ...
            'FlatlineCriterion', 'off', ...
            'ChannelCriterion', opts.ChannelCriterion, ...
            'LineNoiseCriterion', opts.LineNoiseCriterion, ...
            'Highpass', 'off', ...
            'BurstCriterion', 'off', ...
            'WindowCriterion', 'off', ...
            'BurstRejection', 'off', ...
            ... % Why: 'Euclidian' (sic) is the literal token clean_rawdata's
            ... % asr_calibrate accepts; 'Euclidean' is silently ignored.
            ... % Do not "fix" the spelling.
            'Distance', 'Euclidian', ...
            'fusechanrej', 1);
    catch ME
        error("hbn:reject_bad_channels:pop_clean_rawdata_failed", ...
            "pop_clean_rawdata failed for subject %s: %s", ...
            string(EEG.subject), ME.message);
    end
    after = string({EEG.chanlocs.labels});
    rejected = setdiff(before, after, 'stable');

    if EEG.nbchan == 0
        error("hbn:reject_bad_channels:all_rejected", ...
            "pop_clean_rawdata removed every channel (subject=%s)", string(EEG.subject));
    end
    rejectFraction = (numel(before) - EEG.nbchan) / numel(before);
    if rejectFraction > 0.6
        % 60% is well past Cz-flat plus a handful of bad electrodes; an
        % artifact storm at this scale should land as failed_chanreject in
        % the QA CSV, not pass silently as ok.
        error("hbn:reject_bad_channels:excessive_rejection", ...
            "Rejected %d of %d channels (%.0f%%) for subject %s; threshold 60%%", ...
            numel(before) - EEG.nbchan, numel(before), rejectFraction * 100, ...
            string(EEG.subject));
    end
    if rejectFraction > 0.5
        warning("hbn:reject_bad_channels:over_half_rejected", ...
            "Rejected %d of %d channels for subject %s", ...
            numel(before) - EEG.nbchan, numel(before), string(EEG.subject));
    end
end
