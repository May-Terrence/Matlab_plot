clear
close all
r2d = 180/pi;
load('D:\Flycontrol\MATLAB\plot\第四章实验\sim_V_wind.mat')



x = time;
Rol = figure   %角度
% plot(x, Rolld - Rolld(20), 'k', 'LineWidth', 0.75);grid on;hold on;
plot(x, V_wind, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidRol, 'r--', 'LineWidth', 0.75);grid on;hold on;
axis([0 5.5 3 8]);
% axis([0 5.5 -11 11]);
ylabel('\fontname{宋体}环境风速\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
% h = legend('\fontname{宋体}环境风速', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',3,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','northeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')



fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 4]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\模拟环境风速扰动结果.pdf';
PlotToFileColorPDF(Rol,fimename,14,4);
% end

