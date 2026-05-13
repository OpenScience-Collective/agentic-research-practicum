function csvPath = write_qa_amica_csv(outDir, row)
%WRITE_QA_AMICA_CSV Append a QA row to qa_amica.csv.
%   Mirrors hbn.write_qa_channels_csv. Columns:
%     participant_id, status, n_components, final_ll, iterations,
%     reached_max_iter, median_rv, num_models, max_threads, duration_s,
%     error_message.
%
%   `status` is "ok" on success or "failed_<stage>" on per-subject
%   failure (e.g. "failed_amica:run_failed", "failed_dipfit:no_dipoles").
%   `reached_max_iter` is true when AMICA hit MaxIter; combined with a
%   non-converging final_ll trend that is a "did not converge" signal.

    arguments
        outDir (1, 1) string
        row struct
    end
    if ~isfolder(outDir); mkdir(outDir); end
    csvPath = fullfile(outDir, "qa_amica.csv");

    header = ["participant_id", "status", "n_components", "final_ll", ...
        "iterations", "reached_max_iter", "median_rv", "num_models", ...
        "max_threads", "duration_s", "error_message"];
    needsHeader = ~isfile(csvPath);

    fid = fopen(csvPath, "a");
    if fid < 0
        error("hbn:write_qa_amica_csv:open_failed", "could not open %s", csvPath);
    end
    cleanup = onCleanup(@() fclose(fid)); %#ok<NASGU>

    if needsHeader
        fprintf(fid, "%s\n", strjoin(header, ","));
    end

    cells = [ ...
        csv_escape(string(field_or_default(row, "participant_id", ""))), ...
        csv_escape(string(field_or_default(row, "status", "unknown"))), ...
        numeric_cell(field_or_default(row, "n_components", NaN)), ...
        numeric_cell(field_or_default(row, "final_ll", NaN)), ...
        numeric_cell(field_or_default(row, "iterations", NaN)), ...
        bool_cell(field_or_default(row, "reached_max_iter", false)), ...
        numeric_cell(field_or_default(row, "median_rv", NaN)), ...
        numeric_cell(field_or_default(row, "num_models", NaN)), ...
        numeric_cell(field_or_default(row, "max_threads", NaN)), ...
        numeric_cell(field_or_default(row, "duration_s", NaN)), ...
        csv_escape(string(field_or_default(row, "error_message", "")))];
    fprintf(fid, "%s\n", strjoin(cells, ","));
end

function v = field_or_default(s, name, default)
    if isfield(s, name)
        v = s.(name);
    else
        v = default;
    end
end

function c = numeric_cell(x)
    if ~isnumeric(x)
        error("hbn:write_qa_amica_csv:non_numeric", ...
            "numeric_cell expected numeric, got %s", class(x));
    end
    if isnan(x)
        c = "";
    elseif x == floor(x)
        c = sprintf("%d", x);
    else
        c = sprintf("%.4g", x);
    end
end

function c = bool_cell(x)
    if islogical(x) || isnumeric(x)
        if logical(x)
            c = "true";
        else
            c = "false";
        end
    else
        c = string(x);
    end
end

function out = csv_escape(s)
    s = string(s);
    needs = contains(s, ",") || contains(s, '"') || contains(s, newline);
    if needs
        out = """" + replace(s, """", """""") + """";
    else
        out = s;
    end
end
