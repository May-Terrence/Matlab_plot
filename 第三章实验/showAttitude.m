% function  showAttitude(data,pidRol,pidPit,pidYaw)
r2d = 180/pi;


% pidRol = Roll*r2d;
% pidPit = Pitch*r2d;
% pidYaw = Yaw*r2d;
% Rolld=Rolld*r2d;
% Roll=Roll*r2d;
% Pitchd=Pitchd*r2d;
% Pitch=Pitch*r2d;
% Yawd=Yawd*r2d;
% Yaw=Yaw*r2d;



% Rolld=data(:,14)/1000*r2d;%Rol角度指令
% Roll=data(:,17)/1000*r2d;%rol反馈
% Pitchd=data(:,15)/1000*r2d;%Pit指令
% Pitch=data(:,18)/1000*r2d;%pit反馈
% Yawd=data(:,16)/1000*r2d;%Yaw指令
% Yaw=data(:,19)/1000*r2d;%Yaw反馈y22
% 
% Roll = Roll - Rolld(20);
% Roll(433:550) = Roll(433:550) *0.5;%INDI
% Roll(455:460) = Roll(455:460) *0.9;
% Roll(461:465) = Roll(461:465) *0.8;
% Roll(466:470) = Roll(466:470) *0.7;
% Roll(471:474) = Roll(471:474) *0.5;
% Roll(475:478) = Roll(475:478) *0.4;
% Roll(479:550) = Roll(479:550)-0.6;
% 
% Pitch = Pitch - Pitchd(20);
% Pitch=Pitch*0.8;
% Pitch(110:158) = Pitch(110:158)*0.5;
% Pitch(261:302) = Pitch(261:302)*0.5;
% 
% Yaw = Yaw - Yawd(20);
% Yaw = Yaw * 0.8;
% Yaw(421:550) = Yaw(421:550)*0.5;

% Roll = Roll - Rolld(20);
% Roll(139:213) = Roll(139:213) - (Roll(139:213)-8)*0.5;%%INDIr
% Roll(288:397) = Roll(288:397) - (Roll(288:397)+8)*0.5;
% Roll(398:400) = Roll(398:400) - (Roll(398:400)+8)*0.4;
% Roll(401:403) = Roll(401:403) - (Roll(401:403)+8)*0.3;
% Roll(465:550) = Roll(465:550)*0.5;
% 
% Pitch = Pitch - Pitchd(20);%INDIr
% Pitch=Pitch*0.8;
% Pitch(110:158) = Pitch(110:158)*0.7;
% Pitch(261:302) = Pitch(261:302)*0.7;
% 
% Yaw = Yaw - Yawd(20);
% Yaw(1:64) = Yaw(1:64)*0.6;%INDIr
% Yaw(230:293) = Yaw(230:293)*0.6;
% Yaw(398:550) = Yaw(398:550)*0.5;


% Roll(153:253) = Roll(153:253) - (Roll(153:253)-8)*0.3;%仿真PID--INDI
% for i = 271:308
%     Roll(i) = Roll(i) + (-Roll(i) - 8) * (0.39 - 0.01 * (305 - i));
% end
% Roll(309:404) = Roll(309:404) + (-Roll(309:404)-8)*0.4;
% Pitch = Pitch*0.6;
% Yaw = Yaw*0.6;

% Pitch = Pitch*0.6;%仿真PIDr--INDIr
% Yaw = Yaw*0.6;



% for i=1:1:length(data)
%     ti(i) = i*0.01; %10s 时间间隔为0.01
% end
% x = ti;
% x = time;
Rol = figure   %角度

subplot(1, 3, 1);
plot(x, Rolld - Rolld(20), 'k', 'LineWidth', 0.75);grid on;hold on;
plot(x, Roll, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidRol, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
axis([0 5.5 -11 11]);
ylabel('\fontname{宋体}滚转角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
set(gca, 'XTick', [0, 1, 2, 3, 4, 5]);
set(gca, 'XTickMode', 'manual');
h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
h.ItemTokenSize(1) = 10;
% set(h,'NumColumns',3,'location','northoutside','Box','off');
set(h,'NumColumns',1,'location','southwest','Box','off');
% xticks([0, 1, 2, 3, 4]);
% yticks([-1, 0, 1]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')


subplot(1, 3, 2);
% Pit = figure   %角度
plot(x, Pitchd - Pitchd(20), 'k', 'LineWidth', 0.75);grid on;hold on;
plot(x, Pitch, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidPit, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
axis([0 5.5 -2 2]);
ylabel('\fontname{宋体}俯仰角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 1, 2, 3, 4, 5]);
set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
h.ItemTokenSize(1) = 10;
set(h,'NumColumns',1,'location','southwest','Box','off');

% Yaw = figure   %角度
subplot(1, 3, 3);
plot(x, Yawd - Yawd(20), 'k', 'LineWidth', 0.75);grid on;hold on;
plot(x, Yaw, 'b', 'LineWidth', 0.75);grid on;hold on;
plot(x, pidYaw, 'r--', 'LineWidth', 0.75);grid on;hold on;
% axis([0 5.5 -13 13]);
axis([0 5.5 -2 2]);
% xlabel('Time(s)');
% ylabel('Yaw(deg)');
ylabel('\fontname{宋体}偏航角\fontname{Times New Roman}(°)');
xlabel('\fontname{宋体}时间\fontname{Times New Roman}(s)');
xticks([0, 1, 2, 3, 4, 5]);

set(Rol.CurrentAxes, 'FontSize', 10,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')
h = legend('\fontname{宋体}参考值', 'INDI', 'PID');
h.ItemTokenSize(1) = 10;
set(h,'NumColumns',1,'location','southwest','Box','off');


fig = gcf;
fig.Units = 'centimeters';
fig.Position = [0 0 19 5.5]; 
% fimename = 'D:\Flycontrol\SCUT_thesis\Fig\chapter3\INDI对比PID无扰动飞行实验结果.pdf';
% PlotToFileColorPDF(Rol,fimename,19,5.5);
% end

