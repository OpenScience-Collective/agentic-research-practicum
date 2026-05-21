function csvPath = write_qa_iclabel_csv(outDir, row)
%WRITE_QA_ICLABEL_CSV Append a QA row to qa_iclabel.csv.
%   Columns: participant_id, status, n_components, brain_count,
%   muscle_count, eye_count, heart_count, line_noise_count,
%   channel_noise_count, other_count, brain_threshold,
%   iclabel_version, duration_s, error_message.
%
%   status = "ok" when brain_count >= MinBrainIcs,
%            "ok_low_brain" when below floor,
%            "failed_<stage>" on per-subject failure.

    arguments
        outDir (1, 1) string
        row struct
    end
    if ~isfolder(outDir); mkdir(outDir); end
    csvPath = fullfile(outDir, "qa_iclabel.csv");

    header = ["participant_id", "status", "n_components", "brain_count", ...
        "muscle_count", "eye_count", "heart_count", "line_noise_count", ...
        "channel_noise_count", "other_count", "brain_threshold", ...
        "iclabel_version", "duration_s", "error_message"];
    needsHeader = ~isfile(csvPath);

    fid = fopen(csvPath, "a");
    if fid < 0
        error("hbn:write_qa_iclabel_csv:open_failed", "could not open %s", csvPath);
    end
    cleanup = onCleanup(@() fclose(fid)); %#ok<NASGU>

    if needsHeader
        fprintf(fid, "%s\n", strjoin(header, ","));
    end

    cells = [ ...
        csv_escape(string(field_or_default(row, "participant_id", ""))), ...
        csv_escape(string(field_or_default(row, "status", "unknown"))), ...
        numeric_cell(field_or_default(row, "n_components", NaN)), ...
        numeric_cell(field_or_default(row, "brain_count", NaN)), ...
        numeric_cell(field_or_default(row, "muscle_count", NaN)), ...
        numeric_cell(field_or_default(row, "eye_count", NaN)), ...
        numeric_cell(field_or_default(row, "heart_count", NaN)), ...
        numeric_cell(field_or_default(row, "line_noise_count", NaN)), ...
        numeric_cell(field_or_default(row, "channel_noise_count", NaN)), ...
        numeric_cell(field_or_default(row, "other_count", NaN)), ...
        numeric_cell(field_or_default(row, "brain_threshold", NaN)), ...
        csv_escape(string(field_or_default(row, "iclabel_version", ""))), ...
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
        error("hbn:write_qa_iclabel_csv:non_numeric", ...
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

function out = csv_escape(s)
    s = string(s);
    needs = contains(s, ",") || contains(s, '"') || contains(s, newline);
    if needs
        out = """" + replace(s, """", """""") + """";
    else
        out = s;
    end
end
