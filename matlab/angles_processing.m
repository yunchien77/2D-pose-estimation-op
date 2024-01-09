clear all;
close all;

%%

data = readtable('angles_data_pro_19.csv', 'HeaderLines', 1);

% 提取數值資料列（假設資料在第一列）
numeric_data = data{:, 1};

% 繪製折線圖，假設你有一個時間或索引列作為 x 值
x_data = 1:numel(numeric_data); 

smoothed_loess = smoothdata(numeric_data, "loess");
figure(); plot(x_data, smoothed_loess); hold on; plot(x_data, numeric_data); title('loess');