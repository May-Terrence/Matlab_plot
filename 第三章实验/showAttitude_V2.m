clear
% close all
r2d = 180/pi;

% load('D:\Flycontrol\MATLAB\plot\������ʵ��\ʵ��-INDI-PID.mat')
% load('D:\Flycontrol\MATLAB\plot\������ʵ��\ʵ��-INDIr-PIDr.mat')
% load('D:\Flycontrol\MATLAB\plot\������ʵ��\simulation_INDIvsPID.mat')
% load('D:\Flycontrol\MATLAB\plot\������ʵ��\simulation_INDIrvsPIDr.mat')
load('sim_PID_without_disturbb.mat')%zhong
% load('sim_PID_with_disturb.mat')%zhong
one = cc(1,:);
two = cc(2,:);
three = cc(3,:);
four = cc(4,:);
pidRol = Roll*r2d;
pidPit = Pitch*r2d;
pidYaw = Yaw*r2d;
load('sim_INDI_without_disturb.mat')
% load('sim_INDI_with_disturb.mat')
x = linspace(0.01,5.5,550);
Roll = Roll*r2d;
Pitch = Pitch*r2d;
Yaw = Yaw*r2d;
Rolld = Rolld*r2d;
Pitchd = Pitchd*r2d;
Yawd = Yawd*r2d;
%%
Rol = figure   %�Ƕ�

ax1 = subplot(3, 1, 1);
plot(x, Rolld - Rolld(20),  'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Roll, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidRol, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
axis([0 5.5 -11 11]);
ylabel('\fontname{����}��ת��\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
h = legend('\fontname{����}�ο�ֵ', 'INDI', 'PID');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',3,'location','northoutside','Box','off');
% set(h,'NumColumns',1,'location','southwest','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


ax2 = subplot(3, 1, 2);
% Pit = figure   %�Ƕ�
plot(x, Pitchd - Pitchd(20),  'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Pitch, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidPit, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -8 8]);
axis([0 5.5 -1 1]);
ylabel('\fontname{����}������\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{����}�ο�ֵ', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southwest','Box','off');

% Yaw = figure   %�Ƕ�
ax3 = subplot(3, 1, 3);
plot(x, Yawd - Yawd(20),  'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Yaw, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -8 10]);
% axis([0 5.5 -8 15]);
axis([0 5.5 -1 1]);
% axis([0 5.5 -2 2]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{����}ƫ����\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 1, 2, 3, 4, 5]);

set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{����}�ο�ֵ', 'INDI', 'PID');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southwest','Box','off');

set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % ��һ����ͼ
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % �ڶ�����ͼ
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % ��������ͼ
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\INDI�Ա�PID���Ŷ�����ʵ����_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\INDI�Ա�PID���Ŷ�����������_V2.pdf';
% PlotToFileColorPDF(Rol,fimename,14,10);
% end


%%


x = linspace(0.01,5.5,550);
Rol = figure   %�Ƕ�
ax1 = subplot(4, 1, 1);
plot(x, cc(1,:), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, one, '--','Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xlim([0 5.5])
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
ylabel('\fontname{����}1�Ŷ�ת��\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');

h = legend( '\fontname{Times New Roman}INDI', '\fontname{Times New Roman}PID');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',2,'location','northoutside','Box','off');
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


ax2 = subplot(4, 1, 2);
plot(x, cc(2,:), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, two,'--','Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xlim([0 5.5])
ylabel('\fontname{����}2�Ŷ�ת��\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(4, 1, 3);
plot(x, cc(3,:), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, three,'--', 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xlim([0 5.5])
ylabel('\fontname{����}3�Ŷ�ת��\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax4 = subplot(4, 1, 4);
plot(x, cc(4,:), 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, four,'--', 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;

xlim([0 5.5])
ylabel('\fontname{����}4�Ŷ�ת��\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

set(ax1, 'Position', [0.1, 0.75, 0.8, 0.18]); % ��һ����ͼ
set(ax2, 'Position', [0.1, 0.52, 0.8, 0.18]); % �ڶ�����ͼ
set(ax3, 'Position', [0.1, 0.29, 0.8, 0.18]); % ��������ͼ
set(ax4, 'Position', [0.1, 0.06, 0.8, 0.18]); % ��������ͼ

fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 16 20]; 