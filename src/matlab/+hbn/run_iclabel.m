function EEG = run_iclabel(EEG, version)
%RUN_ICLABEL Classify ICs via ICLabel and attach classifications to EEG.
%
%   EEG = hbn.run_iclabel(EEG, version) runs pop_iclabel and returns the
%   EEG struct with classifications stored at
%   EEG.etc.ic_classification.ICLabel.classifications (N_ic x 7 matrix
%   of probabilities) and EEG.etc.ic_classification.ICLabel.classes
%   (cell array of class names: brain, muscle, eye, heart, line_noise,
%   channel_noise, other).
%
%   `version` is one of "default", "lite", "beta". The locked decision
%   is "default" (validated in the original ICLabel publication).

    arguments
        EEG (1, 1) struct
        version (1, 1) string {mustBeMember(version, ["default", "lite", "beta"])} = "default"
    end

    if exist('pop_iclabel', 'file') ~= 2
        error("hbn:phase3:iclabel:plugin_missing", ...
            "pop_iclabel not on path; install the ICLabel plugin via EEGLAB.");
    end
    if isempty(EEG.icaweights)
        error("hbn:phase3:iclabel:no_weights", ...
            "EEG has no IC weights; run Phase 2 first.");
    end

    try
        EEG = pop_iclabel(EEG, char(version));
    catch ME
        error("hbn:phase3:iclabel:run_failed", ...
            "pop_iclabel failed: %s", ME.message);
    end

    if ~isfield(EEG, 'etc') || ~isfield(EEG.etc, 'ic_classification') || ...
            ~isfield(EEG.etc.ic_classification, 'ICLabel')
        error("hbn:phase3:iclabel:no_output", ...
            "pop_iclabel returned without populating ic_classification.ICLabel");
    end
end
