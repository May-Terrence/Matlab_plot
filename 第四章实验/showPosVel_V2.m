% function  showAttitude(data,pidRol,pidPit,pidYaw)
clear
close all
r2d = 180/pi;
% load('D:\Flycontrol\MATLAB\plot\第四章实验\sim_跟踪.mat')
load('D:\Flycontrol\MATLAB\plot\第四章实验\sim_抗风.mat')

% for i=1:1:length(data)
%     ti(i) = i*0.01; %10s 时间间隔为0.01
% end
% x = ti;
x = time;
Rol = figure;   %角度
ax1 = subplot(3, 1, 1);
plot(x, Xd,  'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, X, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidX,  'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
ylabel('\fontname{Times New Roman}X\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',3,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','northwest','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


ax2 = subplot(3, 1, 2);
% Pit = figure   %角度
plot(x, Yd,  'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Y, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidY,  'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
axis([0 10 -0.02 0.02]);
ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向位置\fontname{Times New Roman}(m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southeast','Box','off');

% Yaw = figure   %角度
ax3 = subplot(3, 1, 3);
plot(x, Zd,  'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Z, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidZ,  'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 10 -10.05 -9.95]);
axis([0 10 -10.4 -9.9]);
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
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\INDI位置控制定点悬停抗风实验仿真结果.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter4\INDI位置控制轨迹跟踪实验仿真结果.pdf';
% PlotToFileColorPDF(Rol,fimename,16,10);



% 
% Vel = figure;   %角度
% subplot(3, 1, 1);
% plot(x, v_xd,  'k--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, V_n(:, 1), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
% % plot(x, pidRol,  'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% % axis([0 5.5 -13 13]);
% % axis([0 5.5 -11 11]);
% ylabel('\fontname{Times New Roman}X\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
% xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% % set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
% % set(gca, 'XTickMode', 'manual');
% h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% % set(h,'NumColumns',2,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','southwest','Box','off');
% % xticks([0, 1, 2, 3, 4]);
% % yticks([-1, 0, 1]);
% set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% 
% subplot(3, 1, 2);
% % Pit = figure   %角度
% plot(x, v_yd,  'k--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, V_n(:, 2), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
% % plot(x, pidPit,  'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% % axis([0 5.5 -13 13]);
% % axis([0 5.5 -2 2]);
% ylabel('\fontname{Times New Roman}Y\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
% xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% % xticks([0, 1, 2, 3, 4, 5]);
% set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% % h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% % h.ItemTokenSize(1) = 10;
% % set(h,'NumColumns',1,'location','southeast','Box','off');
% 
% subplot(3, 1, 3);
% plot(x, v_zd,  'k--', 'LineWidth', 0.75);grid on;hold on;
% plot(x, V_n(:, 3), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
% % plot(x, pidYaw,  'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% % axis([0 5.5 -13 13]);
% % axis([0 5.5 -2 2]);
% % xlabel('Time(s)');
% % ylabel('Yaw(deg)');
% ylabel('\fontname{Times New Roman}Z\fontname{宋体}方向速度\fontname{Times New Roman}(m/s)');
% xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% % xticks([0, 1, 2, 3, 4, 5]);
% 
% set(Vel.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% % h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
% % h.ItemTokenSize(1) = 10;
% % set(h,'NumColumns',1,'location','southeast','Box','off');
% 
% 
% fig = gcf;
% fig.Units = 'centimeters';
% fig.Position = [0 0 15 10]; 
% end

