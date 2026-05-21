function run_phase3_three_subjects
%RUN_PHASE3_THREE_SUBJECTS Run phase3_iclabel on the 3 Phase 2 subjects.
%   Requires derivatives/amica/sub-*/eeg/*_desc-amica_eeg.set on disk.
%   If those checkpoints are missing (they are gitignored), regenerates
%   Phase 1 and Phase 2 from scratch first.
%
%   Invoked from the worktree root:
%     matlab -batch "addpath('scripts'); run_phase3_three_subjects()"

    eeglab_path = '/Users/yahya/Documents/git/eeg/eeglab';
    bids_root   = '/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf';

    script_dir = fileparts(mfilename('fullpath'));
    repo_root  = fileparts(script_dir);
    cd(repo_root);

    addpath(eeglab_path);
    evalc('eeglab nogui');
    addpath(genpath(fullfile(repo_root, 'src', 'matlab')));

    fprintf('[phase3-3subj] cwd: %s\n', pwd);
    fprintf('[phase3-3subj] starting at %s\n', datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>

    preprocDir = fullfile(repo_root, 'derivatives', 'preproc');
    amicaDir   = fullfile(repo_root, 'derivatives', 'amica');
    iclabelDir = fullfile(repo_root, 'derivatives', 'iclabel');

    amicaSets = dir(fullfile(amicaDir, 'sub-*', 'eeg', '*_desc-amica_eeg.set'));
    if isempty(amicaSets)
        fprintf('[phase3-3subj] no Phase 2 checkpoints on disk; regenerating Phase 1 + 2 ...\n');
        preprocSets = dir(fullfile(preprocDir, 'sub-*', 'eeg', '*_desc-clean_eeg.set'));
        if isempty(preprocSets)
            phase1_preprocess( ...
                'BidsRoot', bids_root, ...
                'OutDir', preprocDir, ...
                'SmokeSubjectCount', 3);
        end
        phase2_amica( ...
            'PreprocDir', preprocDir, ...
            'OutDir', amicaDir);
    else
        fprintf('[phase3-3subj] found %d Phase 2 checkpoint(s); skipping regenerate\n', ...
            numel(amicaSets));
    end

    fprintf('[phase3-3subj] phase3_iclabel starting at %s\n', ...
        datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
    phase3_iclabel( ...
        'AmicaDir', amicaDir, ...
        'OutDir', iclabelDir);

    fprintf('[phase3-3subj] finished at %s\n', ...
        datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
end
