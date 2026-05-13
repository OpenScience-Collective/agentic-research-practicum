function [EEG, stats] = run_infomax(EEG, outdir, opts)
%RUN_INFOMAX Run EEGLAB Extended Infomax (runica) as an ICA fallback.
%
%   Used by the Phase 2 CI smoke test when AMICA's native Fortran binary
%   is unavailable (Linux runners lack libmpifort.so.12 and similar deps).
%   Infomax is bundled with EEGLAB core, runs in pure MATLAB, and produces
%   the same EEG.icaweights / EEG.icasphere / EEG.icawinv fields, so the
%   downstream dipfit + figure code does not branch.
%
%   Production runs should use hbn.run_amica instead; AMICA gives better
%   decompositions on the HBN data and is what the brief specifies. This
%   helper exists only to keep the CI wiring path green.

    arguments
        EEG (1, 1) struct
        outdir (1, 1) string
        opts (1, 1) struct
    end

    if exist('pop_runica', 'file') ~= 2
        error("hbn:phase2:infomax:plugin_missing", ...
            "pop_runica not on path; EEGLAB core appears incomplete.");
    end

    if ~isfolder(outdir); mkdir(outdir); end

    try
        EEG = pop_runica(EEG, ...
            'icatype', 'runica', ...
            'extended', 1, ...
            'maxsteps', opts.MaxIter);
    catch ME
        error("hbn:phase2:infomax:run_failed", ...
            "pop_runica (runica) failed: %s", ME.message);
    end

    if isempty(EEG.icaweights) || isempty(EEG.icasphere)
        error("hbn:phase2:infomax:no_weights", ...
            "runica produced no weights/sphere; convergence failed.");
    end

    stats = struct( ...
        'final_ll', NaN, ...
        'iterations', NaN, ...
        'reached_max_iter', false);

    if isfield(EEG.etc, 'icaweights_beforerms')
        % runica does not expose log-likelihood; record what we know.
        stats.iterations = opts.MaxIter;
    end
end
