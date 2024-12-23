% function [  ] = B_Spline( x,y )
%����ǯλB�������
close all;
clear all;
clc;
P = [0, 5, 8, 11,15, 20;
    0, 4, 3, 3,5, 0];
x = P(1,:);
y = P(2,:);
% x=[0.5,3,5,6,4,2];
% y=[0.5,0,2,4,5,4];
% x=[0,1,2,3,4,5];
% y=[0,1,1,1,1,1];
plot(x,y,'o');
hold on;
% 
x=[x(1),x(1),x(1),x(2:end),x(end),x(end)];%����ʼ��ͽ�β������ظ�����ͬһ�������ظ�����3�Σ���Ϻ�����߱ض������õ�
y=[y(1),y(1),y(1),y(2:end),y(end),y(end)];

u=linspace(0,1,10);%����u��ȡֵ��ΧΪ[0,1],5�ȷּ���ʾ��ȡ����ԭʼ��֮�����������ϵ�5���㡣
% final_x=x(1);
% final_y=y(1);
final_x=[];
final_y=[];
xd1=[];
yd1=[];
xd2=[];
yd2=[];
r1=[];
r=[];
for i=1:(length(x)-3)%ͨ��B�����������̼�����Ϻ����ߵ���ɢ��
    px=(1-3.*u+3.*u.^2-u.^3).*x(i) + (4-6.*u.^2+3.*u.^3).*x(i+1) + (1+3.*u+3.*u.^2-3.*u.^3).*x(i+2) + u.^3.*x(i+3);
    py=(1-3.*u+3.*u.^2-u.^3).*y(i) + (4-6.*u.^2+3.*u.^3).*y(i+1) + (1+3.*u+3.*u.^2-3.*u.^3).*y(i+2) + u.^3.*y(i+3);
    px=px/6;
    py=py/6;
    final_x=[final_x,px];
    final_y=[final_y,py];
%     plot(px,py);
%     hold on;
    
    px1=(-1+2.*u-u.^2).*x(i) + (-4.*u+3.*u.^2).*x(i+1) + (1+2.*u-3.*u.^2).*x(i+2) + u.^2.*x(i+3);%B�����������̵�һ�׵�
    py1=(-1+2.*u-u.^2).*y(i) + (-4.*u+3.*u.^2).*y(i+1) + (1+2.*u-3.*u.^2).*y(i+2) + u.^2.*y(i+3);
    px1=px1/2
    py1=py1/2
    xd1=[xd1,px1];
    yd1=[yd1,py1];
    px2=(1-u).*x(i) + (-2+3.*u).*x(i+1) + (1-3.*u).*x(i+2) + (u).*x(i+3);
    py2=(1-u).*y(i) + (-2+3.*u).*y(i+1) + (1-3.*u).*y(i+2) + (u).*y(i+3);
    xd2=[xd2,px2];
    yd2=[yd2,py2];
%     tmpr1=abs(px1.*py2 + px2.*py1)./(px1.^2 + py1.^2).^1.5
%     tmpr=1./(abs(px1.*py2 + px2.*py1)./(px1.^2 + py1.^2).^1.5)
%     r1=[r1,tmpr1];
%     r=[r,tmpr];
    
%     for j=1:length(px)%����Ϻ�������ÿ����Ĵ���
%         k=-px1(j)/py1(j);0
%         lx=px(j)-0.1:0.1:px(j)+0.1;
%         ly=k.*(lx-px(j))+py(j);
%         plot(lx,ly);
%         hold on;
%     end
end

    plot(final_x,final_y);
    hold on;
    figure(2);
    plot(final_x,yd1);
    hold on;
    figure(3);
    plot(final_x,yd2);
    hold on;

% for i=1:(length(x))
%     plot(x(i),y(i));
%     hold on;
% end
% end
