clear
close all
r2d = 180/pi;
load('D:\Flycontrol\MATLAB\plot\第四章实验\实飞_square_V3.mat')

%%
Rol = figure;   %角度
ax1 = subplot(3, 1, 1);
plot(x, xCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, xFb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
axis([0 108 -3 42]);
ylabel('\fontname{Times New Roman}X\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','northeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


ax2 = subplot(3, 1, 2);
plot(x, yCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, yFb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
axis([0 108 -60 -10]);
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

ax3 = subplot(3, 1, 3);
plot(x, zCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, zFb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidZ, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 10 -10.05 -9.98]);
axis([0 108 -5.3 -4.7]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{Times New Roman}Z\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.19]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.19]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.19]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 16 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\点对点轨迹飞行试验位置跟踪结果.pdf';
PlotToFileColorPDF(Rol,fimename,16,10);


%%
trajectory = figure;
plot(xCom, yCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(xFb, yFb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidX, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
axis([-4 45 -58 -11]);
% axis([0 5.5 -11 11]);
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{Times New Roman}X\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',2,'location','northeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(trajectory.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 9 9.5]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\点对点轨迹飞行试验二维平面轨迹结果.pdf';
PlotToFileColorPDF(trajectory,fimename,9,9.5);


%%
Vel = figure;   
ax1 = subplot(3, 1, 1);
plot(x, vD_bx, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelxCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelxFb, 'r', 'LineWidth', 0.75);grid on;hold on;
plot(x, vD_bx_fb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidRol, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
xlim([0 108])
ylabel('\fontname{Times New Roman}X\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','southwest','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(3, 1, 2);
plot(x, vD_by, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelyCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelyFb, 'r', 'LineWidth', 0.75);grid on;hold on;
plot(x, vD_by_fb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidPit, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
xlim([0 108])
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

ax3 = subplot(3, 1, 3);
plot(x, VelzCom, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, VelzFb, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
axis([0 108 -0.2 0.2]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{Times New Roman}Z\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);

set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.19]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.19]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.19]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 16 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\点对点轨迹飞行试验速度跟踪结果.pdf';
PlotToFileColorPDF(Vel,fimename,16,10);


%%
Ruler = figure;   
ax1 = subplot(3, 1, 1);
plot(x, roll_command, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, roll_feedback, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidRol, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
axis([0 108 -7 7]);
% axis([0 5.5 -11 11]);
ylabel('\fontname{宋体}滚转角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',2,'location','southeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Ruler.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(3, 1, 2);
% Pit = figure   %角度
plot(x, pitch_command, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pitch_feedback, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidPit, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
xlim([0 108])
ylabel('\fontname{宋体}俯仰角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Ruler.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

ax3 = subplot(3, 1, 3);
plot(x, yaw_command, '--','Color','[0 0 0.9900]', 'LineWidth', 0.75);grid on;hold on;
plot(x, yaw_feedback, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 120 -0.2 0.2]);
xlim([0 108])
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{宋体}偏航角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);

set(Ruler.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.19]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.19]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.19]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 16 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\点对点轨迹飞行试验姿态跟踪结果.pdf';
PlotToFileColorPDF(Ruler,fimename,16,10);