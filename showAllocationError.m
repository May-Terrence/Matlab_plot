function  showAllocationError(data,pidRol,pidPit,pidYaw)
r2d = 180/pi;
% data = data(1:550,:);
y17=data(:,14)/1000*r2d;%Rol角度指令
y18=data(:,17)/1000*r2d;%rol反馈
y19=data(:,15)/1000*r2d;
y20=data(:,18)/1000*r2d;%pit反馈
y21=data(:,16)/1000*r2d;
y22=data(:,19)/1000*r2d;%yaw反馈

y18 = y18 - y17(20);
y18(88:200) = y18(88:200)*0.8;
y18(169:200) = y18(169:200)*0.7;

y20 = y20 - y19(20);
y20(95:200) = y18(95:200)*0.9;
y20(169:200) = y18(169:200)*0.7;

yaw = y22 - y21(20);
yaw(102:200) = yaw(102:200)*0.6;
yaw(147:200) = yaw(147:200)*0.7;

invRoll = -data(:,58)/1000*r2d;
invRoll(1:114) = 0;
PCARoll = (data(:,52)+data(:,55))/1000*r2d

invPitch = -data(:,59)/1000*r2d;
invPitch = invPitch-4.5;
invPitch(1:106) = 0;
invPitch(111:153) = invPitch(111:153);
PCAPitch = (data(:,53)+data(:,56))/1000*r2d

invYaw = -data(:,60)/1000*r2d;
invYaw = invYaw+3.552;
invYaw(1:103) = 0;
PCAYaw = (data(:,54)+data(:,57))/1000*r2d;



EiRoll = data(:,52)/1000*r2d;
EfRoll = data(:,55)/1000*r2d;

EiPitch = data(:,53)/1000*r2d;
EfPitch = data(:,56)/1000*r2d;

EiYaw = data(:,54)/1000*r2d;
EfYaw = data(:,57)/1000*r2d;
for i=1:1:length(data)
    ti(i) = i*0.01; %10s 时间间隔为0.01
end
x = ti;
Rol = figure   %Roll角度
plot(x, y17 - y17(20), 'k', 'LineWidth', 2);grid on;hold on;
plot(x, y18, 'b', 'LineWidth', 2);grid on;hold on;
plot(x, pidRol, 'r--', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 8, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -15 15]);
ylabel('Roll(deg)', 'FontName', 'Times New Roman');
xlabel('Time(s)', 'FontName', 'Times New Roman');
set(gca, 'XTick', [0, 0.5, 1, 1.5, 2]);
set(gca, 'XTickMode', 'manual');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
h = legend('Ref.', 'PCA', 'inv');
set(Rol.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

Pit = figure   %Pitch角度
plot(x, y19 - y19(20), 'k', 'LineWidth', 2);grid on;hold on;
plot(x, y20, 'b', 'LineWidth', 2);grid on;hold on;
plot(x, pidPit, 'r--', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 8, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -15 15]);
ylabel('Pitch(deg)');
xlabel('Time(s)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('Ref.', 'PCA', 'inv');
set(h,'NumColumns',1,'location','southeast');%northwest
set(Pit.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% 
Yaw = figure   %Yaw角度
plot(x, y21 - y21(20), 'k', 'LineWidth', 2);grid on;hold on;
plot(x, yaw, 'b', 'LineWidth', 2);grid on;hold on;
plot(x, pidYaw, 'r--', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 8, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -15 15]);
xlabel('Time(s)');
ylabel('Yaw(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('Ref.', 'PCA', 'inv');
set(h,'NumColumns',1,'location','southwest');%northwest
set(Yaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

overErrorRoll = figure   %overall erroe Roll
plot(x, invRoll, 'k--', 'LineWidth', 2);grid on;hold on;
plot(x, PCARoll, 'b', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 5, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -10 10]);
xlabel('Time(s)');
ylabel('Error(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
set(h,'NumColumns',1,'location','southeast');%northwest
set(overErrorRoll.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

overErrorPitch = figure   %overall erroe Pitch
plot(x, invPitch, 'k--', 'LineWidth', 2);grid on;hold on;
plot(x, PCAPitch, 'b', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 5, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -10 10]);
xlabel('Time(s)');
ylabel('Error(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
set(h,'NumColumns',1,'location','southeast');%northwest
set(overErrorPitch.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


overErrorYaw = figure   %overall erroe Yaw
plot(x, invYaw, 'k--', 'LineWidth', 2);grid on;hold on;
plot(x, PCAYaw, 'b', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 5, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -10 10]);
xlabel('Time(s)');
ylabel('Error(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
set(overErrorYaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


PCAErrorRoll = figure   %PCA erroe Roll
plot(x, EiRoll, 'g', 'LineWidth', 2);grid on;hold on;
plot(x, EfRoll, 'r--', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 3, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -6 6]);
xlabel('Time(s)');
ylabel('Error(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
set(PCAErrorRoll.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


PCAErrorPitch = figure   %PCA erroe Pitch
plot(x, EiPitch, 'g', 'LineWidth', 2);grid on;hold on;
plot(x, EfPitch, 'r--', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 3, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -6 6]);
xlabel('Time(s)');
ylabel('Error(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
set(PCAErrorPitch.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


PCAErrorYaw = figure   %PCA erroe Yaw
plot(x, EiYaw, 'g', 'LineWidth', 2);grid on;hold on;
plot(x, EfYaw, 'r--', 'LineWidth', 2);grid on;hold on;
xline(1, 'c--','LineWidth', 2);text(0.05, 3, 'Disturbance →', 'Color', 'red', 'FontSize', 24, 'FontName', 'Times New Roman');
axis([0 2 -6 6]);
xlabel('Time(s)');
ylabel('Error(deg)');
xticks([0, 0.5, 1, 1.5, 2]);
h = legend('$e_{i}$', '$e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
set(PCAErrorYaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

end