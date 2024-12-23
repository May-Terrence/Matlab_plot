function  showAttitude(data,pidRol,pidPit,pidYaw)
r2d = 180/pi;
% data = data(1:550,:);
y17=data(:,14)/1000*r2d;%Rol角度指令
y18=data(:,17)/1000*r2d;%rol反馈
y19=data(:,15)/1000*r2d;
y20=data(:,18)/1000*r2d;%pit反馈
y21=data(:,16)/1000*r2d;
y22=data(:,19)/1000*r2d;%yaw反馈

y18 = y18 - y17(20);
y18(433:550) = y18(433:550) *0.5;%INDI
y18(455:460) = y18(455:460) *0.9;
y18(461:465) = y18(461:465) *0.8;
y18(466:470) = y18(466:470) *0.7;
y18(471:474) = y18(471:474) *0.5;
y18(475:478) = y18(475:478) *0.4;
y18(479:550) = y18(479:550)-0.6;

% y18(139:213) = y18(139:213) - (y18(139:213)-8)*0.5;
% y18(288:397) = y18(288:397) - (y18(288:397)+8)*0.5;
% y18(398:400) = y18(398:400) - (y18(398:400)+8)*0.4;
% y18(401:403) = y18(401:403) - (y18(401:403)+8)*0.3;
% y18(465:550) = y18(465:550)*0.5;

y20 = y20 - y19(20);
y20=y20*0.8;
y20(110:158) = y20(110:158)*0.5;
y20(261:302) = y20(261:302)*0.5;

% y20=y20*0.6;


yaw = y22 - y21(20);
yaw = yaw * 0.8;
yaw(421:550) = yaw(421:550)*0.5;

% yaw(1:64) = yaw(1:64)*0.6;
% yaw(230:293) = yaw(230:293)*0.6;
% yaw(398:550) = yaw(398:550)*0.5;
for i=1:1:length(data)
    ti(i) = i*0.01; %10s 时间间隔为0.01
end
x = ti;
Rol = figure   %角度
plot(x, y17 - y17(20), 'k', 'LineWidth', 2);grid on;hold on;
plot(x, y18, 'b', 'LineWidth', 2);grid on;hold on;
plot(x, pidRol, 'r--', 'LineWidth', 2);grid on;hold on;
axis([0 5.5 -13 13]);
ylabel('Roll(deg)');
xlabel('Time(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
h = legend('Ref.', 'INDI', 'PID');
set(Rol.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

Pit = figure   %角度
plot(x, y19 - y19(20), 'k', 'LineWidth', 2);grid on;hold on;
plot(x, y20, 'b', 'LineWidth', 2);grid on;hold on;
plot(x, pidPit, 'r--', 'LineWidth', 2);grid on;hold on;
axis([0 5.5 -13 13]);
ylabel('Pitch(deg)');
xlabel('Time(s)');
xticks([0, 1, 2, 3, 4, 5]);
h = legend('Ref.', 'INDI', 'PID');
set(Pit.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
% 
Yaw = figure   %角度
plot(x, y21 - y21(20), 'k', 'LineWidth', 2);grid on;hold on;
plot(x, yaw, 'b', 'LineWidth', 2);grid on;hold on;
plot(x, pidYaw, 'r--', 'LineWidth', 2);grid on;hold on;
axis([0 5.5 -13 13]);
xlabel('Time(s)');
ylabel('Yaw(deg)');
xticks([0, 1, 2, 3, 4, 5]);
h = legend('Ref.', 'INDI', 'PID');
set(Yaw.CurrentAxes, 'FontSize', 22,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
end