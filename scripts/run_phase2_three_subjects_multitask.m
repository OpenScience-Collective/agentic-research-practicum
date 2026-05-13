function run_phase2_three_subjects_multitask
%RUN_PHASE2_THREE_SUBJECTS_MULTITASK Phase 2 with multi-task AMICA pool.
%   Phase 2 production run on 3 subjects using the 4-movie task pool for
%   ICA training (DespicableMe, DiaryOfAWimpyKid, FunwithFractals,
%   ThePresent). Each task is regenerated through Phase 1 cleaning if
%   the cleaned .set is missing. AMICA fits the merged cleaned data; the
%   resulting weights are transplanted onto the ThePresent-only Phase 1
%   .set before dipfit + figures + checkpoint.
%
%   Invoked from the worktree root:
%     matlab -batch "addpath('scripts'); run_phase2_three_subjects_multitask()"

    eeglab_path = '/Users/yahya/Documents/git/eeg/eeglab';
    bids_root   = '/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf';

    script_dir = fileparts(mfilename('fullpath'));
    repo_root  = fileparts(script_dir);
    cd(repo_root);

    addpath(eeglab_path);
    evalc('eeglab nogui');
    addpath(genpath(fullfile(repo_root, 'src', 'matlab')));

    fprintf('[phase2-mt] cwd: %s\n', pwd);
    fprintf('[phase2-mt] starting at %s\n', datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>

    preprocDir = fullfile(repo_root, 'derivatives', 'preproc');
    amicaDir   = fullfile(repo_root, 'derivatives', 'amica');

    icaTasks = ["DespicableMe", "DiaryOfAWimpyKid", "FunwithFractals", "ThePresent"];
    fprintf('[phase2-mt] IcaTasks: %s\n', strjoin(icaTasks, ', '));

    % Ensure phase 1 .set for the target task (ThePresent) on all 3 subjects.
    % Per-task .sets for the other 3 movies are produced lazily by
    % hbn.prepare_multitask_amica_input as needed.
    targetSets = dir(fullfile(preprocDir, 'sub-*', 'eeg', '*_task-ThePresent_desc-clean_eeg.set'));
    if numel(targetSets) < 3
        fprintf('[phase2-mt] regenerating Phase 1 ThePresent on 3 subjects ...\n');
        phase1_preprocess( ...
            'BidsRoot', bids_root, ...
            'OutDir', preprocDir, ...
            'Task', 'ThePresent', ...
            'SmokeSubjectCount', 3);
    else
        fprintf('[phase2-mt] found %d ThePresent .set; using existing\n', numel(targetSets));
    end

    fprintf('[phase2-mt] phase2_amica multi-task starting at %s\n', ...
        datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
    phase2_amica( ...
        'PreprocDir', preprocDir, ...
        'OutDir', amicaDir, ...
        'BidsRoot', bids_root, ...
        'IcaTasks', icaTasks);

    fprintf('[phase2-mt] finished at %s\n', ...
        datestr(now, 'yyyy-mm-dd HH:MM:SS')); %#ok<DATST,TNOW1>
end
