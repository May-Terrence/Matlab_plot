close all
r2d = 180/pi;

Rol = figure;   %角度
ax1 = subplot(3, 1, 1);
plot(x, xCom, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, xFb, 'r--', 'LineWidth', 0.75);grid on;hold on;
axis([0 120 -3 42]);
ylabel('\fontname{Times New Roman}X\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 10;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','northeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


ax2 = subplot(3, 1, 2);
plot(x, yCom, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, yFb, 'r--', 'LineWidth', 0.75);grid on;hold on;
axis([0 120 -60 -10]);
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

% Yaw = figure   %角度
ax3 = subplot(3, 1, 3);
plot(x, zCom, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, zFb, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidZ, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 10 -10.05 -9.98]);
axis([0 120 -5.3 -4.7]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{Times New Roman}Z\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.18]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.18]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.18]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 15 8.8]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\点对点轨迹飞行实验位置跟踪结果.pdf';
PlotToFileColorPDF(Rol,fimename,15,8.8);

trajectory = figure;
plot(xCom, yCom, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(xFb, yFb, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidX, 'r--', 'LineWidth', 0.75);grid on;hold on;
axis([-3 44 -57 -10]);
% axis([0 5.5 -11 11]);
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{Times New Roman}X\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 10;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',2,'location','northeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(trajectory.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 7 7.5]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\点对点轨迹飞行实验二维平面轨迹结果.pdf';
PlotToFileColorPDF(trajectory,fimename,7,7.5);



Vel = figure;   
ax1 = subplot(3, 1, 1);
plot(x, vD_bx, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelxCom, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelxFb, 'r', 'LineWidth', 0.75);grid on;hold on;
plot(x, vD_bx_fb, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidRol, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
% axis([0 5.5 -11 11]);
ylabel('\fontname{Times New Roman}X\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 10;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','southwest','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(3, 1, 2);
plot(x, vD_by, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelyCom, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, VelyFb, 'r', 'LineWidth', 0.75);grid on;hold on;
plot(x, vD_by_fb, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidPit, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
% axis([0 5.5 -2 2]);
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

ax3 = subplot(3, 1, 3);
plot(x, VelzCom, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, VelzFb, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidYaw, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
axis([0 120 -0.2 0.2]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{Times New Roman}Z\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);

set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.18]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.18]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.18]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 15 8.8]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\点对点轨迹飞行实验速度跟踪结果.pdf';
PlotToFileColorPDF(Vel,fimename,15,8.8);

Ruler = figure;   
ax1 = subplot(3, 1, 1);
plot(x, roll_command, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, roll_feedback, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidRol, 'r--', 'LineWidth', 0.75);grid on;hold on;
axis([0 120 -7 7]);
% axis([0 5.5 -11 11]);
ylabel('\fontname{宋体}滚转角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', '\fontname{宋体}实际值');
h.ItemTokenSize(1) = 10;
set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',2,'location','southeast','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Ruler.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(3, 1, 2);
% Pit = figure   %角度
plot(x, pitch_command, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, pitch_feedback, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidPit, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
% axis([0 5.5 -2 2]);
ylabel('\fontname{宋体}俯仰角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Ruler.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

ax3 = subplot(3, 1, 3);
plot(x, yaw_command, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, yaw_feedback, 'r--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidYaw, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 120 -0.2 0.2]);
% axis([0 5.5 -2 2]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{宋体}偏航角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);

set(Ruler.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.18]); % 第一个子图
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.18]); % 第二个子图
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.18]); % 第三个子图
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 15 8.8]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\点对点轨迹飞行实验姿态跟踪结果.pdf';
PlotToFileColorPDF(Ruler,fimename,15,8.8);