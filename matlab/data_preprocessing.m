close all;
clear all;

%% 匯入數據

% 讀取 CSV 文件並跳過第一行
data = readtable('keypoints_12to14_proMax_19.csv', 'HeaderLines', 1);

% 提取數值資料列
% x9_data = data{:, 1};
% y9_data = data{:, 2};
% c9_data = data(:, 3);
% 
% x10_data = data{:, 4};
% y10_data = data{:, 5};
% c10_data = data(:, 6);
% 
% x11_data = data{:, 7};
% y11_data = data{:, 8};
% c11_data = data(:, 9);
%
x12_data = data{:, 1};
y12_data = data{:, 2};
c12_data = data(:, 3);

x13_data = data{:, 4};
y13_data = data{:, 5};
c13_data = data(:, 6);

x14_data = data{:, 7};
y14_data = data{:, 8};
c14_data = data(:, 9);

%% 數據過濾

% 若可信度小於 0.2
% filtered_indices_9 = find(c9_data{:,:} < 0.2);
% filtered_indices_10 = find(c10_data{:,:} < 0.2);
% filtered_indices_11 = find(c11_data{:,:} < 0.2);
% filtered_9to11 = union(union(filtered_indices_9, filtered_indices_10), filtered_indices_11);

%filtered_indices_12 = find(c12_data{:,:} < 0.2);
filtered_indices_13 = find(c13_data{:,:} > 0.3);
%filtered_indices_14 = find(c14_data{:,:} < 0.2);
%filtered_12to14 = union(union(filtered_indices_12, filtered_indices_13), filtered_indices_14);

% 根據條件獲取符合條件的行索引值
% x9_filtered = x9_data(filtered_9to11, :);
% y9_filtered = y9_data(filtered_9to11, :);
% 
% x10_filtered = x10_data(filtered_9to11, :);
% y10_filtered = y10_data(filtered_9to11, :);
% 
% x11_filtered = x11_data(filtered_9to11, :);
% y11_filtered = y11_data(filtered_9to11, :);
%
% x12_filtered = x12_data(filtered_12to14, :);
% y12_filtered = y12_data(filtered_12to14, :);
% 
% x13_filtered = x13_data(filtered_12to14, :);
% y13_filtered = y13_data(filtered_12to14, :);
% 
% x14_filtered = x14_data(filtered_12to14, :);
% y14_filtered = y14_data(filtered_12to14, :);

x12_filtered = x12_data(filtered_indices_13, :);
y12_filtered = y12_data(filtered_indices_13, :);

x13_filtered = x13_data(filtered_indices_13, :);
y13_filtered = y13_data(filtered_indices_13, :);

x14_filtered = x14_data(filtered_indices_13, :);
y14_filtered = y14_data(filtered_indices_13, :);

%% 計算角度(for keypoints 12, 13, 14)

% 計算向量 u、v
u = [x12_filtered - x13_filtered, y12_filtered - y13_filtered];
v = [x14_filtered - x13_filtered, y14_filtered - y13_filtered];
% u = [x12_data - x13_data, y12_data - y13_data];
% v = [x14_data - x13_data, y14_data - y13_data];


% 計算兩向量內積
inner_product = zeros(size(u, 1), 1); % 初始化一個 208x1 的列向量

for i = 1:size(u, 1)
    inner_product(i) = dot(u(i,:), v(i,:)); % 計算每一行向量的內積
end

% 計算兩向量長度乘積
length_product = sqrt(sum(u.^2, 2)) .* sqrt(sum(v.^2, 2));
%length_product = vecnorm(u, 2, 2) .* vecnorm(v, 2, 2);


% 計算兩向量的餘弦值
cos_angle = inner_product ./ length_product;

% 反三角函數求兩向量夾角
% 弧度
angle = acos(cos_angle);
% 角度
angle_degrees = rad2deg(angle);

x_data = 1:numel(angle_degrees); 
%% 輸出波形

figure;
plot(x_data, angle_degrees);
xlabel('Samples');
ylabel('Angles');
title('Angle change waveform');

%% 平滑處理
%smoothed_sgolay = smoothdata(angle_degrees, "sgolay");
smoothed_loess = smoothdata(angle_degrees, "loess");
%smoothed_data = sgolayfilt(angle_degrees, 3, 11);
figure; 
plot(x_data, angle_degrees, 'LineWidth', 0.8); 
hold on; 
plot(x_data, smoothed_loess, 'LineWidth', 1.8); 
title('loess');
xlabel('Samples'); ylabel('Angles');
legend('original', 'smoothing');
