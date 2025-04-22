% function  showAllocationError(data,pidRol,pidPit,pidYaw)
%仿真分配误差对比：伪逆下的einv和ef；1s扰动
%仿真姿态对比：0.5s扰动
% close all
r2d = 180/pi;

% Rolld=data(:,14)/1000*r2d;%Rol角度指令
% Roll=data(:,17)/1000*r2d;%rol反馈
% Pitchd=data(:,15)/1000*r2d;
% Pitch=data(:,18)/1000*r2d;%pit反馈
% Yawd=data(:,16)/1000*r2d;
% Yaw=data(:,19)/1000*r2d;%Yaw反馈
% 
% Roll = Roll - Rolld(20);
% Roll(88:200) = Roll(88:200)*0.8;
% Roll(169:200) = Roll(169:200)*0.7;
% 
% Pitch = Pitch - Pitchd(20);
% Pitch(95:200) = Roll(95:200)*0.9;
% Pitch(169:200) = Roll(169:200)*0.7;
% 
% Yaw = Yaw - Yawd(20);
% Yaw(102:200) = Yaw(102:200)*0.6;
% Yaw(147:200) = Yaw(147:200)*0.7;
% 
% invRoll = -data(:,58)/1000*r2d;
% invRoll(1:114) = 0;
% PCARoll = (data(:,52)+data(:,55))/1000*r2d;
% 
% invPitch = -data(:,59)/1000*r2d;
% invPitch = invPitch-4.5;
% invPitch(1:106) = 0;
% invPitch(111:153) = invPitch(111:153);
% PCAPitch = (data(:,53)+data(:,56))/1000*r2d;
% 
% invYaw = -data(:,60)/1000*r2d;
% invYaw = invYaw+3.552;
% invYaw(1:103) = 0;
% PCAYaw = (data(:,54)+data(:,57))/1000*r2d;
% 
% 
% 
% EiRoll = data(:,52)/1000*r2d;
% EfRoll = data(:,55)/1000*r2d;
% 
% EiPitch = data(:,53)/1000*r2d;
% EfPitch = data(:,56)/1000*r2d;
% 
% EiYaw = data(:,54)/1000*r2d;
% EfYaw = data(:,57)/1000*r2d;

% for i=1:1:length(data)
%     ti(i) = i*0.01; %10s 时间间隔为0.01
% end
% x = ti;

% x = time;
% Rol = figure   %Roll角度
% 
% subplot(1, 3, 1);
% plot(x, Rolld - Rolld(20), 'k', 'LineWidth', 0.75);grid on;hold on;
% plot(x, Roll, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidRol, 'r--', 'LineWidth', 0.75);grid on;hold on;
% xline(1, 'c--','LineWidth', 0.75);text(0.35, 8, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -15 15]);
% % ylabel('Roll(deg)', 'FontName', 'Times New Roman');
% % xlabel('Time(s)', 'FontName', 'Times New Roman');
% ylabel('\fontname{宋体}滚转角\fontname{Times New Roman}(°)');
% xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% set(gca, 'XTick', [0, 0.5, 1, 1.5, 2]);
% set(gca, 'XTickMode', 'manual');
% % xticks([0, 1, 2, 3, 4]);
% % yticks([-1, 0, 1]);
% % h = legend('Ref.', 'PCA', 'inv');
% h = legend('\fontname{宋体}参考值', '\fontname{宋体}优先级', '\fontname{宋体}伪逆');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southwest','Box','off');
% set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% 
% % Pit = figure   %Pitch角度
% subplot(1, 3, 2);
% plot(x, Pitchd - Pitchd(20), 'k', 'LineWidth', 0.75);grid on;hold on;
% plot(x, Pitch, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidPit, 'r--', 'LineWidth', 0.75);grid on;hold on;
% xline(1, 'c--','LineWidth', 0.75);text(0.35, 15*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% % axis([0 2 -5 5]);
% axis([0 2 -15 15]);
% % ylabel('Pitch(deg)');
% % xlabel('Time(s)');
% ylabel('\fontname{宋体}俯仰角\fontname{Times New Roman}(°)');
% xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 0.5, 1, 1.5, 2]);
% % h = legend('Ref.', 'PCA', 'inv');
% h = legend('\fontname{宋体}参考值', '\fontname{宋体}优先级', '\fontname{宋体}伪逆');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southwest','Box','off');
% % set(h,'NumColumns',1,'location','southeast');%northwest
% % set(Pit.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% 
% 
% % Yaw = figure   %Yaw角度
% subplot(1, 3, 3);
% plot(x, Yawd - Yawd(20), 'k', 'LineWidth', 0.75);grid on;hold on;
% plot(x, Yaw, 'b', 'LineWidth', 0.75);grid on;hold on;
% plot(x, pidYaw, 'r--', 'LineWidth', 0.75);grid on;hold on;
% xline(1, 'c--','LineWidth', 0.75);text(0.35, 8, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -15 15]);
% % xlabel('Time(s)');
% % ylabel('Yaw(deg)');
% ylabel('\fontname{宋体}偏航角\fontname{Times New Roman}(°)');
% xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
% xticks([0, 0.5, 1, 1.5, 2]);
% h = legend('\fontname{宋体}参考值', '\fontname{宋体}优先级', '\fontname{宋体}伪逆');
% h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',1,'location','southwest','Box','off');
% % h = legend('Ref.', 'PCA', 'inv');
% % set(h,'NumColumns',1,'location','southwest');%northwest
% % set(Yaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% 
% fig = gcf;
% fig.Units = 'centimeters';
% fig.Position = [0 0 19 5.5]; 
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\优先级对比伪逆的姿态保持飞行实验结果.pdf';
% PlotToFileColorPDF(Rol,fimename,19,5.5);


overErrorRoll = figure   %overall erroe Roll
subplot(1, 3, 1);
plot(x, invRoll, 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCARoll, 'b', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.35, 10*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -20 20]);
axis([0 2 -10 10]);
% xlabel('Time(s)');
% ylabel('Error(deg)');
ylabel('\fontname{宋体}滚转分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
% h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(h,'NumColumns',1,'location','southeast');%northwest
h = legend('$e_{pinv}$', '$e_{i}+e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
h.ItemTokenSize(1) = 12;
set(h,'NumColumns',1,'location','southwest','Box','off');
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

% overErrorPitch = figure   %overall erroe Pitch
subplot(1, 3, 2);
plot(x, invPitch, 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCAPitch, 'b', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.35, 10*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -6 6]);
axis([0 2 -10 10]);
% xlabel('Time(s)');
% ylabel('Error(deg)');
ylabel('\fontname{宋体}俯仰分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
% h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(h,'NumColumns',1,'location','southeast');%northwest
% set(overErrorPitch.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h = legend('$e_{pinv}$', '$e_{i}+e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
h.ItemTokenSize(1) = 12;
set(h,'NumColumns',1,'location','southwest','Box','off');
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

% overErrorYaw = figure   %overall erroe Yaw
subplot(1, 3, 3);
plot(x, invYaw, 'k--', 'LineWidth', 0.75);grid on;hold on;
plot(x, PCAYaw, 'b', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.35, 10*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -15 15]);
axis([0 2 -10 10]);
% xlabel('Time(s)');
% ylabel('Error(deg)');
ylabel('\fontname{宋体}偏航分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
% h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(overErrorYaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% h = legend('\fontname{宋体}伪逆', '\fontname{宋体}优先级');
h = legend('$e_{pinv}$', '$e_{i}+e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
h.ItemTokenSize(1) = 12;
set(h,'NumColumns',1,'location','southwest','Box','off');
set(overErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')



fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 19 5.5]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\优先级对比伪逆的分配误差飞行实验结果.pdf';
PlotToFileColorPDF(overErrorRoll,fimename,19,5.5);


PCAErrorRoll = figure   %PCA erroe Roll
subplot(1, 3, 1);
plot(x, EiRoll, 'g', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfRoll, 'r--', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.35, 6*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -20 20]);
axis([0 2 -6 6]);
% xlabel('Time(s)');
% ylabel('Error(deg)');
ylabel('\fontname{宋体}滚转分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h.ItemTokenSize(1) = 12;
set(h,'NumColumns',1,'location','southwest','Box','off');
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

subplot(1, 3, 2);
% PCAErrorPitch = figure   %PCA erroe Pitch
plot(x, EiPitch, 'g', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfPitch, 'r--', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.35, 48/15, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
axis([0 2 -6 6]);
% xlabel('Time(s)');
% ylabel('Error(deg)');
ylabel('\fontname{宋体}俯仰分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(PCAErrorPitch.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h.ItemTokenSize(1) = 12;
set(h,'NumColumns',1,'location','southwest','Box','off');
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

subplot(1, 3, 3);
% PCAErrorYaw = figure   %PCA erroe Yaw
plot(x, EiYaw, 'g', 'LineWidth', 0.75);grid on;hold on;
plot(x, EfYaw, 'r--', 'LineWidth', 0.75);grid on;hold on;
xline(1, 'c--','LineWidth', 0.75);text(0.35, 6*0.533, '\fontname{宋体}扰动 →', 'Color', 'red', 'FontSize', 10);
% axis([0 2 -15 15]);
axis([0 2 -6 6]);
% xlabel('Time(s)');
% ylabel('Error(deg)');
ylabel('\fontname{宋体}偏航分配误差\fontname{Times New Roman}(N·m)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% set(PCAErrorYaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h.ItemTokenSize(1) = 12;
set(h,'NumColumns',1,'location','southwest','Box','off');
set(PCAErrorRoll.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 19 5.5]; 
fimename = 'D:\Flycontrol\SCUT_thesis\Fig\优先级各分量的分配误差飞行实验结果.pdf';
PlotToFileColorPDF(PCAErrorRoll,fimename,19,5.5);
% end