function run_phase1_three_subjects
%RUN_PHASE1_THREE_SUBJECTS Headless re-run of phase 1 preprocessing for 3 subjects.
%   Recovers the Stage B 3-subject results lost when the repo was transferred.
%   Invoked from the worktree root:
%     matlab -batch "run('scripts/run_phase1_three_subjects.m')"
%   or equivalently:
%     matlab -batch "addpath('scripts'); run_phase1_three_subjects()"

    eeglab_path = '/Users/yahya/Documents/git/eeg/eeglab';
    bids_root   = '/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf';

    % Anchor paths to this script's location so MATLAB's run() chdir behavior
    % does not break addpath. The script lives at <repo>/scripts/, so the
    % repo root is one level up.
    script_dir = fileparts(mfilename('fullpath'));
    repo_root  = fileparts(script_dir);
    cd(repo_root);

    addpath(eeglab_path);
    evalc('eeglab nogui');
    addpath(genpath(fullfile(repo_root, 'src', 'matlab')));

    fprintf('[phase1-rerun] cwd: %s\n', pwd);
    fprintf('[phase1-rerun] BIDS root: %s\n', bids_root);
    fprintf('[phase1-rerun] EEGLAB: %s\n', eeglab_path);
    fprintf('[phase1-rerun] starting at %s\n', datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>

    paramsPath = phase1_preprocess( ...
        'BidsRoot', bids_root, ...
        'OutDir', 'derivatives/preproc', ...
        'SmokeSubjectCount', 3);

    fprintf('[phase1-rerun] params written: %s\n', paramsPath);
    fprintf('[phase1-rerun] finished at %s\n', datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
end
