#!/usr/bin/env bash
# Local CI for heavy MATLAB checks that cannot run on GitHub Actions
# (full EEGLAB pipeline tests on real BDF data).
#
# GH Actions runs cheap checks (typos, yamllint, markdown, MATLAB checkcode).
# This script runs the heavy stuff: actual phase smoke tests on the local
# 100 Hz R3 dataset using the user's licensed MATLAB + EEGLAB install.
#
# Usage:
#   ./scripts/local_ci.sh                 # run miss_hit + all phase tests
#   ./scripts/local_ci.sh --phase 1       # only test_phase1_*.m
#   ./scripts/local_ci.sh --quick         # skip miss_hit (fast iteration)
#   ./scripts/local_ci.sh --no-lint       # skip miss_hit even if installed
#
# Required env:
#   EEGLAB_PATH   absolute path to the EEGLAB install
#   BIDS_ROOT     absolute path to the local R3 BIDS root
# Optional env:
#   MATLAB_BIN    matlab executable (default: matlab on PATH)

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

MATLAB_BIN="${MATLAB_BIN:-matlab}"
EEGLAB_PATH="${EEGLAB_PATH:-}"
BIDS_ROOT="${BIDS_ROOT:-}"

PHASE=""
QUICK=0
NO_LINT=0
while [[ $# -gt 0 ]]; do
    case "$1" in
        --phase) PHASE="$2"; shift 2 ;;
        --quick) QUICK=1; shift ;;
        --no-lint) NO_LINT=1; shift ;;
        -h|--help)
            sed -n '2,21p' "$0"
            exit 0
            ;;
        *) echo "Unknown arg: $1" >&2; exit 2 ;;
    esac
done

if [[ -n "$PHASE" && ! "$PHASE" =~ ^[0-9]+$ ]]; then
    echo "ERROR: --phase requires a positive integer, got '$PHASE'" >&2
    exit 2
fi

echo "=== Local CI ==="
echo "REPO_ROOT=$REPO_ROOT"
echo "MATLAB_BIN=$MATLAB_BIN"
echo "EEGLAB_PATH=${EEGLAB_PATH:-<unset>}"
echo "BIDS_ROOT=${BIDS_ROOT:-<unset>}"
echo "PHASE=${PHASE:-<all>}"
echo "QUICK=$QUICK"

if ! command -v "$MATLAB_BIN" >/dev/null 2>&1; then
    echo "ERROR: matlab not on PATH. Set MATLAB_BIN or add MATLAB to PATH." >&2
    exit 1
fi
if [[ -z "$EEGLAB_PATH" || ! -d "$EEGLAB_PATH" ]]; then
    echo "ERROR: EEGLAB_PATH must be set to an existing directory (got '$EEGLAB_PATH')." >&2
    exit 1
fi
if [[ -z "$BIDS_ROOT" || ! -d "$BIDS_ROOT" ]]; then
    # The whole point of local CI is to run on real BDF data; a missing
    # dataset would make smoke tests early-return on the no-data branch and
    # mask regressions as green. Fail loudly instead.
    echo "ERROR: BIDS_ROOT must be set to an existing directory (got '$BIDS_ROOT')." >&2
    exit 1
fi

# 1. Style + lint via miss_hit. Skipping silently was masking missing
#    coverage on dev machines without the tool installed; require it unless
#    --quick or --no-lint was passed.
if [[ "$QUICK" -eq 1 || "$NO_LINT" -eq 1 ]]; then
    echo "--- skip miss_hit (quick/no-lint) ---"
elif command -v mh_style >/dev/null 2>&1 && command -v mh_lint >/dev/null 2>&1; then
    echo "--- mh_style ---"
    mh_style src/matlab
    echo "--- mh_lint ---"
    mh_lint src/matlab
else
    echo "ERROR: miss_hit is not installed (mh_style / mh_lint missing)." >&2
    echo "Install with: uv tool install miss_hit  (or: pipx install miss_hit)" >&2
    echo "Or rerun with --no-lint to skip MATLAB style checks." >&2
    exit 1
fi

# 2. MATLAB checkcode + smoke tests via runtests.
echo "--- MATLAB checkcode + tests ---"
MATLAB_LOG="$(mktemp -t local_ci_matlab.XXXXXX.log)"
trap 'rm -f "$MATLAB_LOG"' EXIT

# Capture matlab -batch output to file AND stream to stdout. PIPESTATUS[0]
# is the matlab exit code; tee never fails. Without this, license-shim or
# exit-hook absorption on macOS could swallow inner error()s and let CI
# pass green on a real failure.
set +e
"$MATLAB_BIN" -batch "
addpath(genpath('$EEGLAB_PATH'));
addpath(genpath(fullfile(pwd, 'src', 'matlab')));
addpath(genpath(fullfile(pwd, 'tests', 'matlab')));

files = dir(fullfile('src', 'matlab', '**', '*.m'));
if isempty(files)
    error('hbn:local_ci:no_sources', ...
        'No MATLAB sources found under src/matlab; refusing to pass.');
end
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
    error('hbn:local_ci:checkcode', 'checkcode found %d severe issues.', n);
end

testDir = fullfile(pwd, 'tests', 'matlab');
if ~isfolder(testDir)
    error('hbn:local_ci:no_tests', 'tests/matlab not found.');
end
phaseFilter = '$PHASE';
if isempty(phaseFilter)
    pattern = '*.m';
else
    pattern = sprintf('test_phase%s_*.m', phaseFilter);
end
testFiles = dir(fullfile(testDir, pattern));
if isempty(testFiles)
    error('hbn:local_ci:no_matching_tests', ...
        'No tests matching %s under %s', pattern, testDir);
end
fprintf('Running runtests on %d file(s) matching %s\n', numel(testFiles), pattern);
results = runtests(fullfile({testFiles.folder}, {testFiles.name}));
disp(results);
if any([results.Failed])
    error('hbn:local_ci:test_failures', 'MATLAB test failures.');
end
" 2>&1 | tee "$MATLAB_LOG"
matlab_status=${PIPESTATUS[0]}
set -e

if [[ "$matlab_status" -ne 0 ]]; then
    echo "ERROR: matlab -batch exited with $matlab_status" >&2
    exit "$matlab_status"
fi

echo "=== Local CI passed ==="
