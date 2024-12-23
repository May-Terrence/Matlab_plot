% % 读取原始 Excel 文件
% % data = xlsread('1206baro.xlsx');
% 
% % 提取前 5000 行数据
% % subsetData = data(1:5000, 1:46);
% 
% % 将提取的数据保存到新的 Excel 文件
% % xlsxs(subsetData, '12066.xlsx');
% % byang(5)
% % x = 0:0.1:2*pi;
% % y = sin(x);
% % 
% % plot(x, y);
% % xlabel('<font face="TeX">\theta_{angle}</font>', 'Interpreter', 'html');
% % ylabel('<font face="TeX">\sin(\theta)</font>', 'Interpreter', 'html');
% % x = 0:0.1:2*pi;
% % y = sin(x);
% % figure(55);
% % plot(x, y);hold on;
% % plot(x, y);
% % h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% % 
% % xlabel('$\theta_{\mathrm{angle}}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% % ylabel('$\sin(\theta)$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% clear all
% close all
% x = -2:0.1:2;
% y = sin(x);
% 
% plot(x, y);
% hold on;
% xline(0, 'r--');text(0.1, 0.5, 'Disturbance →', 'Color', 'red', 'FontSize', 20, 'FontName', 'Times New Roman');
% 
% 
% 创建对象并初始化变量值
obj = PersistentValues(10);

% 显示初始变量值
obj.showVariable();

% 修改变量值
obj.modifyVariable(20);

% 再次显示变量值
obj.showVariable();

