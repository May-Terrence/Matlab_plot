clear
%����������Աȣ�α���µ�einv��ef��1s�Ŷ�
%������̬�Աȣ�0.5s�Ŷ�
close all
r2d = 180/pi;
load('D:\Flycontrol\MATLAB\plot\������ʵ��\sim_PCAvsPINV_euler.mat')
% load('D:\Flycontrol\MATLAB\plot\������ʵ��\ʵ��_PCA_Pinv.mat')


%%
Rol = figure   %Roll�Ƕ�

ax1 = subplot(3, 1, 1);
plot(x, Rolld - Rolld(20), 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Roll, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidRol, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 8, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
ylabel('\fontname{����}��ת��\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2]);
set(gca, 'XTickMode', 'manual');
h = legend('\fontname{����}�ο�ֵ', '\fontname{����}���ȼ�', '\fontname{����}α��');
h.ItemTokenSize(1) = 20;
set(h,'NumColumns',3,'location','northoutside','Box','off');
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax2 = subplot(3, 1, 2);
plot(x, Pitchd - Pitchd(20), 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Pitch, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidPit, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 5*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -5 5]);
% axis([0 2 -15 15]);
ylabel('\fontname{����}������\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(3, 1, 3);
plot(x, Yawd - Yawd(20), 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, Yaw, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 8, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
ylabel('\fontname{����}ƫ����\fontname{Times New Roman}(��)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);

set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % ��һ����ͼ
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % �ڶ�����ͼ
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % ��������ͼ
fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\���ȼ��Ա�α�����̬���ַ���ʵ����_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\���ȼ��Ա�α�����̬���ַ���������_V2.pdf';
PlotToFileColorPDF(Rol,fimename,14,10);





%%
overErrorRoll = figure   %overall erroe Roll
ax1 = subplot(1, 3, 1);
plot(x, invRoll, 'm', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCARoll, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 20*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -20 20]);
% axis([0 2 -10 10]);
ylabel('\fontname{����}��ת�������\fontname{Times New Roman}(N��m)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
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
xline(1, 'c--','LineWidth', 0.75);text(0.75, 6*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -6 6]);
% axis([0 2 -10 10]);
ylabel('\fontname{����}�����������\fontname{Times New Roman}(N��m)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(1, 3, 3);
plot(x, invYaw, 'm', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCAYaw, 'Color','[0 0 0.990]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 15*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
% axis([0 2 -10 10]);
ylabel('\fontname{����}ƫ���������\fontname{Times New Roman}(N��m)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % ��һ����ͼ
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % �ڶ�����ͼ
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % ��������ͼ

fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\���ȼ��Ա�α��ķ���������ʵ����_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\���ȼ��Ա�α��ķ���������������_V2.pdf';
PlotToFileColorPDF(overErrorRoll,fimename,14,10);



%%
PCAErrorRoll = figure   %PCA erroe Roll
ax1 = subplot(1, 3, 1);
plot(x, EiRoll, 'Color','[0 0.800 0]', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfRoll, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 20*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -20 20]);
% axis([0 2 -6 6]);
ylabel('\fontname{����}��ת�������\fontname{Times New Roman}(N��m)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
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
xline(1, 'c--','LineWidth', 0.75);text(0.75, 6*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -6 6]);
ylabel('\fontname{����}�����������\fontname{Times New Roman}(N��m)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

ax3 = subplot(1, 3, 3);
% PCAErrorYaw = figure   %PCA erroe Yaw
plot(x, EiYaw, 'Color','[0 0.800 0]', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfYaw, 'Color','[0.800 0 0]', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.75, 15*0.533, '\fontname{����}�Ŷ� ��', 'Color', 'red', 'FontSize', 10);
axis([0 2 -15 15]);
% axis([0 2 -6 6]);
ylabel('\fontname{����}ƫ���������\fontname{Times New Roman}(N��m)');
xlabel('\fontname{����}ʱ��\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

set(ax1, 'Position', [0.1, 0.73, 0.8, 0.20]); % ��һ����ͼ
set(ax2, 'Position', [0.1, 0.42, 0.8, 0.20]); % �ڶ�����ͼ
set(ax3, 'Position', [0.1, 0.11, 0.8, 0.20]); % ��������ͼ


fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 14 10]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\���ȼ��������ķ���������ʵ����_V2.pdf';
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\���ȼ��������ķ���������������_V2.pdf';
PlotToFileColorPDF(PCAErrorRoll,fimename,14,10);
% end