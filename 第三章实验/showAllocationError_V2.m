clear
%仿真分配误差对比：伪逆下的einv和ef；1s扰动
%仿真姿态对比：0.5s扰动
close all
r2d = 180/pi;
load('D:\Flycontrol\MATLAB\plot\第三章实验\sim_PCAvsPINV_euler.mat')
% load('D:\Flycontrol\MATLAB\plot\第三章实验\实飞_PCA_Pinv.mat')


%%
Rol = figure   %Roll角度

ax1 = subplot(3, 1, 1);
plot(x, Rolld - Rolld(20), 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Roll, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidRol, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 8, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
ylabel('\fontname{宋体}滚转角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2]);
set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}优先级', '\fontname{宋体}伪逆');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',3,'location','northoutside','Box','off');
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(3, 1, 2);
plot(x, Pitchd - Pitchd(20), 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Pitch, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidPit, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 5*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -5 5]);
% axis([0 2 -15 15]);
ylabel('\fontname{宋体}俯仰角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(3, 1, 3);
plot(x, Yawd - Yawd(20), 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Yaw, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 8, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
ylabel('\fontname{宋体}偏航角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);

set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\优先级对比伪逆的姿态保持仿真实验结果_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\优先级对比伪逆的姿态保持飞行试验结果_V2.pdf';
PlotToFileColorPDF(Rol,fimename,14,10);





%%
overErrorRoll = figure   %overall erroe Roll
ax1 = subplot(1, 3, 1);
plot(x, invRoll, 'm', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCARoll, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 20*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -20 20]);
% axis([0 2 -10 10]);
ylabel('\fontname{宋体}滚转分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
% h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(h,'NumColumns',1,'location','southeast');%northwest
h = legend('$e_{pinv}$', '$e_{i}+e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',3,'location','northoutside','Box','off');
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(1, 3, 2);
plot(x, invPitch, 'm', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCAPitch, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 6*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -6 6]);
% axis([0 2 -10 10]);
ylabel('\fontname{宋体}俯仰分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(1, 3, 3);
plot(x, invYaw, 'm', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCAYaw, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 15*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
% axis([0 2 -10 10]);
ylabel('\fontname{宋体}偏航分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % 第三个子图

fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\优先级对比伪逆的分配误差仿真实验结果_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\优先级对比伪逆的分配误差飞行试验结果_V2.pdf';
PlotToFileColorPDF(overErrorRoll,fimename,14,10);



%%
PCAErrorRoll = figure   %PCA erroe Roll
ax1 = subplot(1, 3, 1);
plot(x, EiRoll, 'Color','[0 0.800 0]', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfRoll, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 20*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -20 20]);
% axis([0 2 -6 6]);
ylabel('\fontname{宋体}滚转分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',3,'location','northoutside','Box','off');
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(1, 3, 2);
% PCAErrorPitch = figure   %PCA erroe Pitch
plot(x, EiPitch, 'Color','[0 0.800 0]', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfPitch, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 6*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -6 6]);
ylabel('\fontname{宋体}俯仰分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(1, 3, 3);
% PCAErrorYaw = figure   %PCA erroe Yaw
plot(x, EiYaw, 'Color','[0 0.800 0]', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 15*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
% axis([0 2 -6 6]);
ylabel('\fontname{宋体}偏航分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % 第三个子图


fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\优先级各分量的分配误差仿真实验结果_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\优先级各分量的分配误差飞行试验结果_V2.pdf';
PlotToFileColorPDF(PCAErrorRoll,fimename,14,10);
% end