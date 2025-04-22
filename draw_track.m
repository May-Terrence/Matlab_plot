close all;
clc
% clear

% 获取当前脚本或函数所在文件夹的路径
currentFolder = fileparts(which(mfilename));

% 添加当前文件夹及其子文件夹到 MATLAB 的搜索路径
addpath(genpath(currentFolder));

G = 9.788;
r2d = 180/pi;

% filename = 'INDIr.TXT';
% fid = fopen(filename, 'r');
% data = [];
% errData = {};
% while ~feof(fid)
%     line = fgetl(fid);
%     numbers = str2double(strsplit(line, ','));
%     if numel(numbers) == 60
%         data = [data; numbers];
%     else errData = [errData; numbers];
%     end
% end
% fclose(fid);

% data = data(101:650,:);%PID
% data = data(99:648,:);%PIDr
% pidRol=(data(:,17)-data(20,14))/1000*r2d;
% pidPit=(data(:,18)-data(20,15))/1000*r2d;
% pidYaw=(data(:,19)-data(20,16))/1000*r2d;
% data = data(101:650,:);%INDIr
% data = data(1:550,:);%INDI


% showAttitude(data,pidRol,pidPit,pidYaw);

% data = data(111:310,:);
% pidRol=(data(:,17)-data(20,14))/1000*r2d;%F92
% pidPit=(data(:,18)-data(20,15))/1000*r2d;
% pidYaw=(data(:,19)-data(20,16))/1000*r2d;
% showAllocationError(data,pidRol,pidPit,pidYaw);%F91

% data = data(2158:4875,:);
roll_command = data(:,14)/1000*r2d;%角度
roll_feedback = data(:,17)/1000*r2d;
pitch_command = data(:,15)/1000*r2d;
pitch_feedback = data(:,18)/1000*r2d;
yaw_command = data(:,16)/1000*r2d;
yaw_feedback = data(:,19)/1000*r2d;

VelxCom = data(:,2)/1000;%速度
VelxFb = data(:,5)/1000;
VelyCom = data(:,3)/1000;
VelyFb = data(:,6)/1000;
VelzCom = data(:,4)/1000;
VelzFb = data(:,7)/1000;

xCom = data(:,8)/1000;%位置
xFb = data(:,11)/1000;
yCom = data(:,9)/1000;
yFb = data(:,12)/1000;
zCom = data(:,10)/1000;
zFb = data(:,13)/1000;
% 
% omega_raw_0 = data(:,23)/1000*r2d;
% omega_raw_1 = data(:,24)/1000*r2d;
% omega_raw_2 = data(:,25)/1000*r2d;
% 
% omega_filter_0 = data(:,45)/1000*r2d;
% omega_filter_1 = data(:,46)/1000*r2d;
% omega_filter_2 = data(:,47)/1000*r2d;
% 
% angacc_raw_0 = data(:,52)/1000*r2d;
% angacc_raw_1 = data(:,53)/1000*r2d;
% angacc_raw_2 = data(:,54)/1000*r2d;
% 
% angacc_filter_0 = data(:,55)/1000*r2d;
% angacc_filter_1 = data(:,56)/1000*r2d;
% angacc_filter_2 = data(:,57)/1000*r2d;
% 
% % INDIinputX=data(:,39)/1000*r2d;%ti,tf
% % INDIinputY=data(:,40)/1000*r2d;
% % INDIinputZ=data(:,41)/1000*r2d;
% % FBinputX=data(:,49)/1000*r2d;
% % FBinputY=data(:,50)/1000*r2d;
% % FBinputZ=data(:,51)/1000*r2d;
% % 
% % laserHeight = data(:,52)/1000;%height/velx/vely
% % laserHeightFil = data(:,53)/1000;
% % flowVelx = data(:,54)/1000;
% % flowVely = data(:,55)/1000;
% % flowVelxFil = data(:,56)/1000;
% % flowVelyFil = data(:,57)/1000;
ti = [];
for i=1:1:length(data)
% for i=1:1:7500
    ti(i) = i*0.01; %10s 时间间隔为0.01
end
x = ti;
% % Fil = 0;
% % Filt.CNT = 0;
% % Filt.CCR = 40;
% % for j=1:1:length(flowVelx)
% %     [Fil, Filt] = SlideFilt(Fil,flowVelx(j),1,Filt,1);
% %     flowFil(j) = Fil;
% % end
% % flowVelxFil - flowFil'
% 
% % figure(1)
% % plot(x,y1,'r--',x,y2,'g--',x,y3,'b',x,y4,'m');
% % hold
% % plot(x,y5,'k',x,y6,'k.',x,y7,'m--')
% 
% % legend('control_mode', 'FlightStatus', 'dubins','dis-XY','goalDis','traveledAng','goalAng');
% % plot(x,y8,'r--',x,y9,'g',x,y10,'b');
% % legend('jerk', 'angvel1', 'pitch');
% 
% % figure(2)
% % subplot(3,1,1);
% % plot(x,y11,'r',x,y12,'g');
% % title('roll角速度')
% % legend('pqr_command-0', 'pqr-0');
% % subplot(3,1,2);
% % plot(x,y13,'r',x,y14,'g');
% % title('pitch角速度')
% % legend('pqr_command-1', 'pqr-1');
% % subplot(3,1,3);
% % plot(x,y15,'r',x,y16,'g');
% % title('yaw角速度')
% % legend('pqr_command-2', 'pqr-2');
% % 
figure
subplot(3,1,1);
plot(x,roll_command,'r',x,roll_feedback,'g');
% axis([0 30 -13 13]);
grid on;
title('roll角度')
legend('Ref', 'Real');
subplot(3,1,2);
plot(x,pitch_command,'r',x,pitch_feedback,'g');
% axis([0 30 -13 13]);
grid on;
title('pitch角度')
legend('Ref', 'Real');
subplot(3,1,3);
plot(x,yaw_command,'r',x,yaw_feedback, 'g');
% axis([0 30 -13 13]);
grid on;
title('yaw角度')
legend('Ref', 'Real');
% set(fig3.CurrentAxes, 'FontSize', 7,'FontName','Times New Roman','LabelFontSizeMultiplier', 1,'TitleFontSizeMultiplier',1,'LineWidth',0.5,'Xcolor','black','Ycolor','black','Zcolor','black')

% 
figure(4)
subplot(3,1,1);
plot(x,VelxCom,'r',x,VelxFb,'g');
% axis([0 25 -1 1]);
title('X-vel')
legend('Xvel_command', 'Xvel');
subplot(3,1,2);
plot(x,VelyCom,'r',x,VelyFb,'g');
% axis([0 25 -1 1]);
title('Y-vel')
legend('Yvel_command', 'Yvel');
subplot(3,1,3);
plot(x,VelzCom,'r',x,VelzFb,'g');
% axis([0 25 -1 1]);
title('Z-vel')
legend('Zvel_command', 'Zvel');

figure(5)
subplot(3,1,1);
plot(x,xCom,'r',x,xFb,'g');
% axis([0 25 -2 2]);
title('X位置')
legend('X_command', 'X');
subplot(3,1,2);
plot(x,yCom,'r',x,yFb,'g');
% axis([0 25 -2 2]);
title('Y位置')
legend('Y_command', 'Y');
subplot(3,1,3);
plot(x,zCom,'r',x,zFb,'g');
% axis([0 25 -2 2]);
title('Z位置')
legend('Z_command', 'Z');
% 
figure
plot(xFb,yFb,'r');hold on;
% % 
% % x0 = -9.6183; 
% % y0 = -9.1746;
% % r = 7.81;  
% % theta = 0:0.01:7;  
% % xCom = x0 + r*cos(theta);  
% % yCom = y0 + r*sin(theta);  
% 
plot(xCom, yCom, 'b');  
% axis equal
% axis([-20 0 -20 0]);
% figure(6)
% subplot(3,1,1);
% plot(x,omega_raw_0,'r',x,omega_filter_0,'g');
% % axis([0 25 -2 2]);
% title('X角速度')
% % legend('raw', 'filter');
% subplot(3,1,2);
% plot(x,omega_raw_1,'r',x,omega_filter_1,'g');
% % axis([0 25 -2 2]);
% title('Y角速度')
% % legend('Y_command', 'Y');
% subplot(3,1,3);
% plot(x,omega_raw_2,'r',x,omega_filter_2,'g');
% % axis([0 25 -2 2]);
% 
% 
% title('Z角速度')
% legend('raw', 'filter');
% 
% figure(7)
% subplot(3,1,1);
% plot(x,angacc_raw_0,'r',x,angacc_filter_0,'g');
% % axis([0 25 -2 2]);
% title('X角加速度')
% % legend('X_command', 'X');
% subplot(3,1,2);
% plot(x,angacc_raw_1,'r',x,angacc_filter_1,'g');
% % axis([0 25 -2 2]);
% title('Y角加速度')
% % legend('Y_command', 'Y');
% subplot(3,1,3);
% plot(x,angacc_raw_2,'r',x,angacc_filter_2,'g');
% % axis([0 25 -2 2]);
% title('Z角加速度')
% legend('raw', 'filter');
% Ex = xFb-xCom;
% Ex = Ex.^2;
% Ex = sum(Ex)/length(Ex)
% Ey = yFb-yCom;
% Ey = Ey.^2;
% Ey = sum(Ey)/length(Ey)
% Ez = zFb-zCom;
% Ez = Ez.^2;
% Ez = sum(Ez)/length(Ez)
% 
% figure(6)   
% subplot(3,1,1);
% z1= y35./(y35+y38);
% plot(x,z1,'r',x,y38,'g');axis([0 6.5 0 1]);
% title('Ti,Tf')
% legend('Ti-x', 'Tf-x');
% subplot(3,1,2);
% plot(x,y36/(y36+y39),'r',x,y39,'g');axis([0 6.5 0 1]);
% 
% title('Ti,Tf')
% legend('Ti-y', 'Tf-y');
% subplot(3,1,3);
% plot(x,y37/(y37+y40),'r',x,y40,'g');axis([0 6.5 0 1]);
% 
% title('Ti,Tf')
% legend('Ti-z', 'Tf-z');
% 
% figure(7)   
% subplot(3,1,1);
% plot(x,y47*r2d,'r',x,y50*r2d,'g');%axis([0 2 -13 13]);
% title('Einv,Ei+Ef')
% legend('inv-x', 'Ei+Ef-x');
% subplot(3,1,2);
% plot(x,y48*r2d,'r',x,y51*r2d,'g');%axis([0 2 -13 13]);
% title('Einv,Ei+Ef')
% legend('inv-y', 'Ei+Ef-y');
% subplot(3,1,3);
% plot(x,y49*r2d,'r',x,y52*r2d,'g');%axis([0 2 -13 13]);
% title('Einv,Ei+Ef')
% legend('inv-z', 'Ei+Ef-z');figure(8)   
% subplot(3,1,1);
% plot(x,zCom,'m--',x,laserHeightFil,'g',x,zFb,'b--');%axis([0 2 -4 4]);
% title('Height')
% legend('Com', 'Fil','RTK');
% subplot(3,1,2);
% plot(x,flowVelx','m--',x,flowVelxFil,'g',x,VelxFb,'b--');%axis([0 2 -4 4]);
% title('Velx')
% legend('Raw', 'Fil','RTK');
% subplot(3,1,3);
% plot(x,x-x,'m--',x,flowVelyFil,'g',x,VelyFb,'b--');%axis([0 2 -4 4]);
% title('Vely')
% legend('Raw', 'Fil','RTK');



% legend('vel');
% xlabel('time');
% ylabel('Height/m');
% figure
% plot(x,y8,'r*',x,y9,'g',x,y10,'b--')
% legend('eskf', 'gps', 'baro');
% xlabel('time');
% ylabel('vel/m/s');
% figure
% plot(x,y3,'b',x,y4,'m',x,y5,'r--',x,y6,'g--')
% % plot(x,y1)
% 
% xlabel('time');
% ylabel('Height/m');
% % 添加图例
% legend('eskf-x', 'gps-x','eskf-y', 'gps-y');


% data241219 = [omega_raw_0, omega_raw_1, omega_raw_2, ...
%     omega_filter_0, omega_filter_1, omega_filter_2,...
%     angacc_raw_0, angacc_raw_1, angacc_raw_2,...
%     angacc_filter_0, angacc_filter_1, angacc_filter_2];
% data241219 = round(data241219, 4);
% writematrix(data241219, '241219data.txt');
% save('241219square.mat', 'data')
% data(1364,:) = [];