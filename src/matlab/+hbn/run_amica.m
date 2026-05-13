function [EEG, stats] = run_amica(EEG, outdir, opts)
%RUN_AMICA Decompose EEG with AMICA, attach weights, return convergence stats.
%
%   [EEG, stats] = hbn.run_amica(EEG, outdir, opts) writes AMICA output
%   under `outdir` (W, S, mods), loads the weights back into the EEG
%   struct via eeg_loadamica, and returns convergence diagnostics:
%       stats.final_ll          final log-likelihood
%       stats.iterations        number of EM iterations executed
%       stats.reached_max_iter  true if AMICA stopped at MaxIter (i.e.
%                               likely did not converge in the LL sense)
%
%   `opts` is the phase2_amica opts struct; we read NumModels, MaxIter,
%   MaxThreads, DoReject, NumRej, RejSig.
%
%   Errors are raised with identifier hbn:phase2:amica:* so the caller's
%   per-subject try/catch can tag them in qa_amica.csv.

    arguments
        EEG (1, 1) struct
        outdir (1, 1) string
        opts (1, 1) struct
    end

    if exist('runamica15', 'file') ~= 2
        error("hbn:phase2:amica:plugin_missing", ...
            "AMICA plugin not on path; install via EEGLAB plugin manager.");
    end

    if ~isfolder(outdir); mkdir(outdir); end

    % runamica15 runs locally when numprocs=1 (the default); passing
    % use_queue is rejected by this version with "unknown flag". Stick to
    % flags actually parsed by the source (max_threads, max_iter, num_models,
    % numrej, rejsig, do_reject).
    args = { ...
        'outdir', char(outdir), ...
        'num_models', opts.NumModels, ...
        'max_iter', opts.MaxIter, ...
        'max_threads', opts.MaxThreads, ...
        'do_reject', double(opts.DoReject), ...
        'numrej', opts.NumRej, ...
        'rejsig', opts.RejSig};

    % runamica15 expects a data matrix, a .set filename, or a raw binary
    % .fdt path. Prefer the .fdt path when EEG was loaded from disk:
    % the AMICA Fortran binary reads it directly and skips the
    % MATLAB-side data copy. Passing the EEG struct itself silently
    % corrupts argument parsing (forrtl-66 overflow on macOS).
    datfile = "";
    has_datfile = isfield(EEG, 'datfile') && ~isempty(EEG.datfile) && ...
        isfield(EEG, 'filepath') && ~isempty(EEG.filepath);
    if has_datfile
        candidate = fullfile(EEG.filepath, EEG.datfile);
        if isfile(candidate); datfile = candidate; end
    end

    try
        if datfile ~= ""
            runamica15(char(datfile), args{:});
        else
            runamica15(EEG.data(:, :), args{:});
        end
    catch ME
        error("hbn:phase2:amica:run_failed", ...
            "runamica15 failed: %s", ME.message);
    end

    try
        EEG = eeg_loadamica(EEG, char(outdir), 1);
    catch ME
        error("hbn:phase2:amica:load_failed", ...
            "eeg_loadamica failed for outdir %s: %s", outdir, ME.message);
    end

    stats = parse_amica_output(outdir, opts.MaxIter);
end

function stats = parse_amica_output(outdir, maxIter)
    stats = struct( ...
        'final_ll', NaN, ...
        'iterations', NaN, ...
        'reached_max_iter', false);

    outFile = fullfile(outdir, 'output.mat');
    if isfile(outFile)
        try
            mods = load(outFile);
            if isfield(mods, 'mod')
                m = mods.mod;
                if isfield(m, 'LL') && ~isempty(m.LL)
                    stats.final_ll = m.LL(end);
                    stats.iterations = numel(m.LL);
                    stats.reached_max_iter = stats.iterations >= maxIter;
                end
            end
        catch
        end
    end

    if isnan(stats.iterations)
        llFile = fullfile(outdir, 'LL');
        if isfile(llFile)
            try
                ll = read_amica_binary(llFile);
                stats.final_ll = ll(end);
                stats.iterations = numel(ll);
                stats.reached_max_iter = stats.iterations >= maxIter;
            catch
            end
        end
    end
end

function v = read_amica_binary(path)
    fid = fopen(path, 'r');
    cleaner = onCleanup(@() fclose(fid)); %#ok<NASGU>
    v = fread(fid, Inf, 'double');
end
