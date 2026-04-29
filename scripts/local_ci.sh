#!/usr/bin/env bash
# Local CI for heavy MATLAB checks that cannot run on GitHub Actions
# (full EEGLAB pipeline tests on real BDF data).
#
# GH Actions runs cheap checks (typos, yamllint, markdown, MATLAB checkcode).
# This script runs the heavy stuff: actual phase smoke tests on the local
# 100 Hz R3 dataset using the user's licensed MATLAB + EEGLAB install.
#
# Usage:
#   ./scripts/local_ci.sh                 # run all
#   ./scripts/local_ci.sh --phase 1       # only phase 1 smoke test
#   ./scripts/local_ci.sh --quick         # skip phases that need AMICA

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

MATLAB_BIN="${MATLAB_BIN:-matlab}"
EEGLAB_PATH="${EEGLAB_PATH:-/Users/yahya/Documents/git/eeg/eeglab}"
BIDS_ROOT="${BIDS_ROOT:-/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf}"

PHASE=""
QUICK=0
while [[ $# -gt 0 ]]; do
    case "$1" in
        --phase) PHASE="$2"; shift 2 ;;
        --quick) QUICK=1; shift ;;
        -h|--help)
            echo "Usage: $0 [--phase N] [--quick]"
            exit 0
            ;;
        *) echo "Unknown arg: $1"; exit 2 ;;
    esac
done

echo "=== Local CI ==="
echo "REPO_ROOT=$REPO_ROOT"
echo "MATLAB_BIN=$MATLAB_BIN"
echo "EEGLAB_PATH=$EEGLAB_PATH"
echo "BIDS_ROOT=$BIDS_ROOT"

if ! command -v "$MATLAB_BIN" >/dev/null 2>&1; then
    echo "ERROR: matlab not on PATH. Set MATLAB_BIN or add MATLAB to PATH." >&2
    exit 1
fi

if [[ ! -d "$EEGLAB_PATH" ]]; then
    echo "ERROR: EEGLAB not found at $EEGLAB_PATH" >&2
    exit 1
fi

if [[ ! -d "$BIDS_ROOT" ]]; then
    echo "WARN: BIDS_ROOT $BIDS_ROOT not present; phase tests that need data will be skipped."
fi

# 1. Style + lint via miss_hit (fast, no MATLAB needed if installed).
if command -v mh_style >/dev/null 2>&1; then
    echo "--- mh_style ---"
    mh_style src/matlab || { echo "mh_style failed"; exit 1; }
    echo "--- mh_lint ---"
    mh_lint src/matlab || { echo "mh_lint failed"; exit 1; }
else
    echo "skip miss_hit (not installed; pip install miss-hit)"
fi

# 2. MATLAB checkcode + smoke tests via runtests.
echo "--- MATLAB checkcode + tests ---"
"$MATLAB_BIN" -batch "
addpath(genpath('$EEGLAB_PATH'));
addpath(genpath(fullfile(pwd, 'src', 'matlab')));
addpath(genpath(fullfile(pwd, 'tests', 'matlab')));

% checkcode on every .m
files = dir(fullfile('src', 'matlab', '**', '*.m'));
if ~isempty(files)
    paths = fullfile({files.folder}, {files.name});
    issues = checkcode(paths{:}, '-id', '-severity');
    n = 0;
    for k = 1:numel(issues)
        msgs = issues{k};
        for j = 1:numel(msgs)
            fprintf('%s:%d: [%s] %s\n', paths{k}, msgs(j).line, msgs(j).id, msgs(j).message);
            if ~isempty(msgs(j).severity) && msgs(j).severity > 0
                n = n + 1;
            end
        end
    end
    if n > 0
        error('checkcode found %d severe issues.', n);
    end
else
    fprintf('No MATLAB sources yet.\n');
end

% Smoke tests if any.
testDir = fullfile(pwd, 'tests', 'matlab');
if isfolder(testDir) && ~isempty(dir(fullfile(testDir, '*.m')))
    fprintf('Running runtests on %s\n', testDir);
    results = runtests(testDir, 'IncludeSubfolders', true);
    disp(results);
    if any([results.Failed])
        error('MATLAB test failures.');
    end
else
    fprintf('No MATLAB tests yet.\n');
end
"

echo "=== Local CI passed ==="
