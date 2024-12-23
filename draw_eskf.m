close all;
clc

% data=load('006.txt');
% x=data(:,1);
% data = csvread('1128-baro.csv');

% 读取CSV文件

clear all
filename = '0103eskf.TXT';
fid = fopen(filename, 'r');
data = [];
errData = {};
while ~feof(fid)
    line = fgetl(fid);
    numbers = str2double(strsplit(line, ','));
    if numel(numbers) == 46
        data = [data; numbers];
    else errData = [errData; numbers];
    end
end
fclose(fid);
% data=subsetData;
y1=data(:,2)/1000;
y2=data(:,12)/1000;
y3=data(:,38)/1000;
y4=data(:,3)/1000;
y5=data(:,13)/1000;
y6=data(:,39)/1000;
y7=data(:,4)/1000;
y8=data(:,14)/1000;
y9=data(:,40)/1000;

y10=data(:,5)/1000;
y11=data(:,15)/1000;
y12=data(:,41)/1000;
y13=data(:,6)/1000;
y14=data(:,16)/1000;
y15=data(:,42)/1000;
y16=data(:,7)/1000;
y17=data(:,17)/1000;
y18=data(:,43)/1000;

y19=data(:,8)/1000*57.3;
y20=data(:,44)/1000*57.3;
y21=data(:,9)/1000*57.3;
y22=data(:,45)/1000*57.3;
y23=data(:,10)/1000*57.3;
y24=data(:,46)/1000*57.3;

y25=data(:,18)/100;
y26=data(:,19)/100;
y27=-data(:,21)/1000;
x = 1:length(y1);

plot(x,y1,'r',x,y2,'g',x,y3,'b');
legend('rtk-pos-X', 'gps-pos-X', 'baro-pos-X');
figure
% hold
plot(x,y4,'r',x,y5,'g',x,y6,'b');
legend('rtk-pos-Y', 'gps-pos-Y', 'baro-pos-Y');
figure
plot(x,y7,'r',x,y9,'b',x,y27,'g');
legend('rtk-pos-Z', 'baro-pos-Z','alti');

figure
plot(x,y10,'r',x,y11,'g',x,y12,'b');
legend('rtk-vel-X', 'gps-vel-X', 'baro-vel-X');
figure
plot(x,y13,'r',x,y14,'g',x,y15,'b-');
legend('rtk-vel-Y', 'gps-vel-Y', 'baro-vel-Y');
figure
plot(x,y16,'r',x,y18,'b-');
legend('rtk-vel-Z', 'baro-vel-Z');

figure
subplot(3,1,1);
plot(x,y19,'r',x,y20,'g');
legend('rtk-roll', 'baro-roll');
subplot(3,1,2);
plot(x,y21,'r',x,y22,'g');
legend('rtk-pitch', 'baro-pitch');
subplot(3,1,3);
plot(x,y23,'r',x,y24,'g');
legend('rtk-yaw', 'baro-yaw');

figure;
plot(x,y25,'r',x,y26,'g');
legend('gpsPosAccuracy', 'gpsSpdAccuracy');
% plot(x,y1,'r',x,y2,'g',x,y7,'b--')
% legend('eskf', 'gps', 'baro');
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
% title('Baro');
% xlabel('time');
% ylabel('Height/m');
% % 添加图例
% legend('eskf-x', 'gps-x','eskf-y', 'gps-y');
