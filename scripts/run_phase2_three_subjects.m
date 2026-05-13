function run_phase2_three_subjects
%RUN_PHASE2_THREE_SUBJECTS End-to-end Phase 1 + Phase 2 on 3 subjects.
%   Regenerates the Phase 1 .set/.fdt checkpoints under
%   derivatives/preproc/ (the heavy checkpoints are gitignored, so this
%   step is needed on a fresh checkout), then runs phase2_amica on those
%   checkpoints with the brief's recommended parameters (AMICA defaults
%   plus do_reject for time-point cleaning, dipfit5 with standard MNI BEM).
%
%   Invoked from the worktree root:
%     matlab -batch "addpath('scripts'); run_phase2_three_subjects()"

    eeglab_path = '/Users/yahya/Documents/git/eeg/eeglab';
    bids_root   = '/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf';

    script_dir = fileparts(mfilename('fullpath'));
    repo_root  = fileparts(script_dir);
    cd(repo_root);

    addpath(eeglab_path);
    evalc('eeglab nogui');
    addpath(genpath(fullfile(repo_root, 'src', 'matlab')));

    fprintf('[phase2-3subj] cwd: %s\n', pwd);
    fprintf('[phase2-3subj] BIDS root: %s\n', bids_root);
    fprintf('[phase2-3subj] EEGLAB: %s\n', eeglab_path);
    fprintf('[phase2-3subj] starting at %s\n', datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>

    preprocDir = fullfile(repo_root, 'derivatives', 'preproc');
    amicaDir = fullfile(repo_root, 'derivatives', 'amica');

    setFiles = dir(fullfile(preprocDir, 'sub-*', 'eeg', '*_desc-clean_eeg.set'));
    if isempty(setFiles)
        fprintf('[phase2-3subj] no Phase 1 checkpoints on disk; regenerating ...\n');
        phase1_preprocess( ...
            'BidsRoot', bids_root, ...
            'OutDir', preprocDir, ...
            'SmokeSubjectCount', 3);
    else
        fprintf('[phase2-3subj] found %d existing Phase 1 checkpoint(s); skipping regenerate\n', ...
            numel(setFiles));
    end

    fprintf('[phase2-3subj] phase2_amica starting at %s\n', ...
        datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
    phase2_amica( ...
        'PreprocDir', preprocDir, ...
        'OutDir', amicaDir);

    fprintf('[phase2-3subj] finished at %s\n', ...
        datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
end
