function root = test_bids_root
%TEST_BIDS_ROOT Resolve the BIDS root for the test suite.
%
%   Resolution order:
%     1. HBN_BIDS_ROOT environment variable, if set and a folder
%     2. The committed mini fixture at tests/fixtures/bids_mini
%     3. The local full dataset at /Volumes/S1/Datasets/HBN/L100/R3_L100_bdf
%
%   Errors with hbn:test_bids_root:no_data if none of the above resolves
%   to an existing folder, so a test failing in CI surfaces a precise
%   reason rather than disguising itself as a phase1 error.

    candidates = string.empty;

    envRoot = string(getenv('HBN_BIDS_ROOT'));
    if envRoot ~= ""
        candidates(end + 1) = envRoot;
    end

    thisFile = mfilename('fullpath');
    repoRoot = fileparts(fileparts(fileparts(thisFile)));
    candidates(end + 1) = fullfile(repoRoot, "tests", "fixtures", "bids_mini");

    candidates(end + 1) = "/Volumes/S1/Datasets/HBN/L100/R3_L100_bdf";

    for c = candidates
        if isfolder(c); root = c; return; end
    end

    error("hbn:test_bids_root:no_data", ...
        "No BIDS root found. Tried HBN_BIDS_ROOT (%s), %s, %s.", ...
        envRoot, candidates(end - 1), candidates(end));
end
