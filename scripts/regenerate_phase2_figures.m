function regenerate_phase2_figures
%REGENERATE_PHASE2_FIGURES Re-render Phase 2 IC topo + dipole PNGs.
%   Loads each derivatives/amica/sub-XXX/eeg/*_desc-amica_eeg.set
%   checkpoint and regenerates the figures via hbn.save_ic_topo_figure
%   and hbn.save_dipole_figure. Use after fixing a figure-export bug
%   when you do not want to redo the multi-hour AMICA + dipfit pass.

    eeglab_path = '/Users/yahya/Documents/git/eeg/eeglab';
    script_dir = fileparts(mfilename('fullpath'));
    repo_root  = fileparts(script_dir);
    cd(repo_root);

    addpath(eeglab_path);
    evalc('eeglab nogui');
    addpath(genpath(fullfile(repo_root, 'src', 'matlab')));

    amicaDir = fullfile(repo_root, 'derivatives', 'amica');
    setFiles = dir(fullfile(amicaDir, 'sub-*', 'eeg', '*_desc-amica_eeg.set'));
    if isempty(setFiles)
        error("hbn:regen:no_inputs", "No AMICA checkpoints under %s", amicaDir);
    end

    fprintf('[regen] %d AMICA checkpoint(s) to refigure\n', numel(setFiles));
    for i = 1:numel(setFiles)
        parts = strsplit(setFiles(i).name, '_');
        subjId = string(parts{1});
        out_fig_dir = fullfile(amicaDir, subjId, 'figures');
        if ~isfolder(out_fig_dir); mkdir(out_fig_dir); end

        fprintf('[regen] (%d/%d) %s loading ...\n', i, numel(setFiles), subjId);
        EEG = pop_loadset('filename', setFiles(i).name, 'filepath', setFiles(i).folder);

        fprintf('[regen] (%d/%d) %s ic-topos ...\n', i, numel(setFiles), subjId);
        hbn.save_ic_topo_figure(EEG, out_fig_dir, subjId, 30);

        fprintf('[regen] (%d/%d) %s dipoles ...\n', i, numel(setFiles), subjId);
        hbn.save_dipole_figure(EEG, out_fig_dir, subjId);
    end
    fprintf('[regen] done.\n');
end
