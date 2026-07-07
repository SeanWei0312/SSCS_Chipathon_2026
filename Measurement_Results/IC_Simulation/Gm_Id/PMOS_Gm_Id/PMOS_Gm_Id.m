clear; clc; close all;

baseDir = "/Users/sean/Documents/GitHub/ECG_Acquisition_IC/Measurement_Results/IC_Simulation/Gm_Id/PMOS_Gm_Id";
outCsv  = fullfile(baseDir, "pmos_gmid_all_results.csv");

targetVSD  = 1.65;
targetGmId = [6 8 10 12 15 18 20];

files = dir(fullfile(baseDir, "pmos_L*_W10u.txt"));

if isempty(files)
    error("No pmos_L*_W10u.txt files found in: %s", baseDir);
end

allData = table();

for k = 1:numel(files)

    filePath = fullfile(files(k).folder, files(k).name);

    L_um = parseLengthUm(files(k).name);
    W_um = parseWidthUm(files(k).name);

    raw = readNgspiceWrdata(filePath);

    if size(raw,2) >= 5
        raw = raw(:, end-3:end);
    elseif size(raw,2) ~= 4
        error("Unexpected column count in %s", files(k).name);
    end

    VSG = raw(:,1);
    VSD = raw(:,2);
    ID  = abs(raw(:,3));

    [vsgList, ~, ig] = unique(VSG);
    [vsdList, ~, idv] = unique(VSD);

    IDgrid = accumarray([ig idv], ID, [numel(vsgList) numel(vsdList)], @mean, NaN);

    gmGrid  = nan(size(IDgrid));
    gdsGrid = nan(size(IDgrid));

    for j = 1:numel(vsdList)
        gmGrid(:,j) = gradient(IDgrid(:,j), vsgList);
    end

    for i = 1:numel(vsgList)
        gdsGrid(i,:) = gradient(IDgrid(i,:), vsdList);
    end

    [VSGmesh, VSDmesh] = ndgrid(vsgList, vsdList);

    IDv  = IDgrid(:);
    gmv  = gmGrid(:);
    gdsv = gdsGrid(:);

    gm_Id  = gmv ./ IDv;
    gm_gds = gmv ./ gdsv;
    gain_dB = 20*log10(abs(gm_gds));

    ID_per_W_uA_per_um  = IDv ./ W_um * 1e6;
    gm_per_W_uS_per_um  = gmv ./ W_um * 1e6;
    gds_per_W_uS_per_um = gdsv ./ W_um * 1e6;

    mainBranch = false(size(IDgrid));

    for j = 1:numel(vsdList)

        gmIdCol = gmGrid(:,j) ./ IDgrid(:,j);

        good = isfinite(gmIdCol) & isfinite(IDgrid(:,j)) & IDgrid(:,j) > 0;

        if any(good)
            idxGood = find(good);
            [~, idxLocalMax] = max(gmIdCol(good));
            idxStart = idxGood(idxLocalMax);

            mainBranch(idxStart:end, j) = true;
        end
    end

    T = table();
    T.L_um = repmat(L_um, numel(IDv), 1);
    T.W_um = repmat(W_um, numel(IDv), 1);
    T.VSG_V = VSGmesh(:);
    T.VSD_V = VSDmesh(:);
    T.ID_A = IDv;
    T.ID_per_W_uA_per_um = ID_per_W_uA_per_um;
    T.gm_S = gmv;
    T.gm_per_W_uS_per_um = gm_per_W_uS_per_um;
    T.gds_S = gdsv;
    T.gds_per_W_uS_per_um = gds_per_W_uS_per_um;
    T.gm_Id_1_per_V = gm_Id;
    T.gm_gds = gm_gds;
    T.intrinsic_gain_dB = gain_dB;
    T.main_branch = mainBranch(:);

    allData = [allData; T];

end

allData = sortrows(allData, ["L_um", "VSD_V", "VSG_V"]);
writetable(allData, outCsv);

fprintf("\nSaved CSV:\n%s\n", outCsv);
fprintf("Total points saved: %d\n", height(allData));

vsdList = unique(allData.VSD_V);
[~, idxVSD] = min(abs(vsdList - targetVSD));
useVSD = vsdList(idxVSD);

fprintf("\nUsing VSD = %.3f V\n", useVSD);

slice = allData(abs(allData.VSD_V - useVSD) < 1e-12, :);
Ls = unique(slice.L_um);

designTable = table();

for i = 1:numel(Ls)

    Lnow = Ls(i);

    D = slice(slice.L_um == Lnow & slice.main_branch == true, :);

    D = D(isfinite(D.gm_Id_1_per_V) & ...
          isfinite(D.gm_gds) & ...
          isfinite(D.ID_per_W_uA_per_um) & ...
          D.ID_A > 0 & ...
          D.gm_S > 0 & ...
          D.gds_S > 0, :);

    D = sortrows(D, "gm_Id_1_per_V");

    [xUnique, idxUnique] = unique(D.gm_Id_1_per_V, "stable");
    D = D(idxUnique, :);

    for g = targetGmId

        if ~isempty(D) && g >= min(xUnique) && g <= max(xUnique)

            row = table();
            row.L_um = Lnow;
            row.VSD_V = useVSD;
            row.target_gm_Id_1_per_V = g;
            row.VSG_V = interp1(D.gm_Id_1_per_V, D.VSG_V, g, "linear");
            row.ID_per_W_uA_per_um = interp1(D.gm_Id_1_per_V, D.ID_per_W_uA_per_um, g, "linear");
            row.gm_per_W_uS_per_um = interp1(D.gm_Id_1_per_V, D.gm_per_W_uS_per_um, g, "linear");
            row.gm_gds = interp1(D.gm_Id_1_per_V, abs(D.gm_gds), g, "linear");
            row.intrinsic_gain_dB = interp1(D.gm_Id_1_per_V, D.intrinsic_gain_dB, g, "linear");

            designTable = [designTable; row];

        end
    end
end

fprintf("\nImportant PMOS gm/Id sizing data:\n");
disp(designTable);

figure;
hold on; grid on; box on;
leg = strings(0);
for i = 1:numel(Ls)
    D = slice(slice.L_um == Ls(i) & slice.main_branch == true, :);
    D = D(isfinite(D.gm_Id_1_per_V) & ...
          isfinite(D.ID_per_W_uA_per_um) & ...
          D.ID_A > 0 & D.gm_S > 0, :);
    D = sortrows(D, "ID_per_W_uA_per_um");

    if ~isempty(D)
        semilogx(D.ID_per_W_uA_per_um, D.gm_Id_1_per_V, "LineWidth", 1.5);
        leg(end+1) = "L = " + string(Ls(i)) + " \mum";
    end
end
xlabel("|I_D|/W  (\muA/\mum)");
ylabel("g_m/|I_D|  (1/V)");
title(sprintf("PMOS gm/Id vs Current Density, VSD = %.3f V", useVSD));
legend(leg, "Location", "best");

figure;
hold on; grid on; box on;
leg = strings(0);
for i = 1:numel(Ls)
    D = slice(slice.L_um == Ls(i) & slice.main_branch == true, :);
    D = D(isfinite(D.gm_Id_1_per_V) & ...
          isfinite(D.gm_gds) & ...
          D.ID_A > 0 & D.gm_S > 0 & D.gds_S > 0, :);
    D = sortrows(D, "gm_Id_1_per_V");

    if ~isempty(D)
        plot(D.gm_Id_1_per_V, abs(D.gm_gds), "LineWidth", 1.5);
        leg(end+1) = "L = " + string(Ls(i)) + " \mum";
    end
end
xlabel("g_m/|I_D|  (1/V)");
ylabel("g_m/g_{ds}");
title(sprintf("PMOS Intrinsic Gain vs gm/Id, VSD = %.3f V", useVSD));
legend(leg, "Location", "best");

figure;
hold on; grid on; box on;
leg = strings(0);
for i = 1:numel(Ls)
    D = slice(slice.L_um == Ls(i) & slice.main_branch == true, :);
    D = D(isfinite(D.gm_Id_1_per_V) & ...
          isfinite(D.intrinsic_gain_dB) & ...
          D.ID_A > 0 & D.gm_S > 0 & D.gds_S > 0, :);
    D = sortrows(D, "gm_Id_1_per_V");

    if ~isempty(D)
        plot(D.gm_Id_1_per_V, D.intrinsic_gain_dB, "LineWidth", 1.5);
        leg(end+1) = "L = " + string(Ls(i)) + " \mum";
    end
end
xlabel("g_m/|I_D|  (1/V)");
ylabel("Intrinsic gain (dB)");
title(sprintf("PMOS Intrinsic Gain in dB, VSD = %.3f V", useVSD));
legend(leg, "Location", "best");

figure;
hold on; grid on; box on;
leg = strings(0);
for i = 1:numel(Ls)
    D = slice(slice.L_um == Ls(i), :);
    D = D(isfinite(D.VSG_V) & ...
          isfinite(D.ID_per_W_uA_per_um) & ...
          D.ID_A > 0, :);
    D = sortrows(D, "VSG_V");

    if ~isempty(D)
        semilogy(D.VSG_V, D.ID_per_W_uA_per_um, "LineWidth", 1.5);
        leg(end+1) = "L = " + string(Ls(i)) + " \mum";
    end
end
xlabel("VSG (V)");
ylabel("|I_D|/W  (\muA/\mum)");
title(sprintf("PMOS Current Density vs VSG, VSD = %.3f V", useVSD));
legend(leg, "Location", "best");

figure;
hold on; grid on; box on;
leg = strings(0);
for i = 1:numel(Ls)
    D = slice(slice.L_um == Ls(i), :);
    D = D(isfinite(D.VSG_V) & ...
          isfinite(D.gm_Id_1_per_V) & ...
          D.ID_A > 0 & D.gm_S > 0, :);
    D = sortrows(D, "VSG_V");

    if ~isempty(D)
        plot(D.VSG_V, D.gm_Id_1_per_V, "LineWidth", 1.5);
        leg(end+1) = "L = " + string(Ls(i)) + " \mum";
    end
end
xlabel("VSG (V)");
ylabel("g_m/|I_D|  (1/V)");
title(sprintf("PMOS gm/Id vs VSG, VSD = %.3f V", useVSD));
legend(leg, "Location", "best");


function raw = readNgspiceWrdata(filePath)

    lines = readlines(filePath);
    raw = [];

    for i = 1:numel(lines)

        s = strtrim(lines(i));

        if s == ""
            continue;
        end

        nums = sscanf(s, "%f").';

        if isempty(nums)
            continue;
        end

        raw = [raw; nums];

    end
end


function L_um = parseLengthUm(fileName)

    tok = regexp(fileName, "L([0-9p]+)u", "tokens", "once");

    if isempty(tok)
        error("Cannot parse L from filename: %s", fileName);
    end

    L_um = str2double(strrep(tok{1}, "p", "."));

end


function W_um = parseWidthUm(fileName)

    tok = regexp(fileName, "W([0-9p]+)u", "tokens", "once");

    if isempty(tok)
        error("Cannot parse W from filename: %s", fileName);
    end

    W_um = str2double(strrep(tok{1}, "p", "."));

end