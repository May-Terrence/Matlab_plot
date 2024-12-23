
%����n���� �Ľ�����b����
% axis([0,100,0,100])     %���廭����С
close all
clc
Vmax=1.5;
P = [0, 5, 8, 11,15, 20;
    0, 4, 3, 3,5, 0];
P = [0,5, 10,15;
    0, 2, 2, 0];
px = P(1,:)
py = P(2,:)
plot(px,py,'ro');
hold on;
px=[px(1),px(1),px(1),px(2:end),px(end),px(end)];%����ʼ��ͽ�β������ظ�����ͬһ�������ظ�����3�Σ���Ϻ�����߱ض������õ�
py=[py(1),py(1),py(1),py(2:end),py(end),py(end)];
n = size(P,2)-1;
M4=[1,4,1,0;-3,0,3,0;3,-6,3,0;-1,3,-3,1];
xx=[];
yy=[];%�����洢B������x,yֵ
xxd1=[];
yyd1=[];
xxd2=[];
yyd2=[];
for i=1:length(px)-3
    %ÿһ��i��Ӧ��һ������
    x_temp = [];
    y_temp = [];
    xd1_temp = [];
    yd1_temp = [];
    xd2_temp = [];
    yd2_temp = [];
    for u = 0:0.01:1%ĳһ�����ߵ��յ�����һ�����ߵ����
        x_item = (1/6)*[1,u,u^2,u^3]*M4*[px(i);px(i+1);px(i+2);px(i+3)];
        y_item = (1/6)*[1,u,u^2,u^3]*M4*[py(i);py(i+1);py(i+2);py(i+3)];
        x_temp=[x_temp,x_item];
        y_temp=[y_temp,y_item];%���浱ǰu��Ӧ��x,yֵ
        
        xd1_item = (1/6)*[0,1,2*u,3*u^2]*M4*[px(i);px(i+1);px(i+2);px(i+3)];
        yd1_item = (1/6)*[0,1,2*u,3*u^2]*M4*[py(i);py(i+1);py(i+2);py(i+3)];
        xd1_temp=[xd1_temp,xd1_item];
        yd1_temp=[yd1_temp,yd1_item];%���浱ǰu��Ӧ��x,yֵ
        
        xd2_item = (1/6)*[0,0,2,6*u]*M4*[px(i);px(i+1);px(i+2);px(i+3)];
        yd2_item = (1/6)*[0,0,2,6*u]*M4*[py(i);py(i+1);py(i+2);py(i+3)];
        xd2_temp=[xd2_temp,xd2_item];
        yd2_temp=[yd2_temp,yd2_item];%���浱ǰu��Ӧ��x,yֵ
    end
    %�������������
    %ÿ�����߶�Ӧ��xx,yy��һ��
    xx = [xx;x_temp];
    yy = [yy;y_temp];
    xxd1 = [xxd1;xd1_temp];
    yyd1 = [yyd1;yd1_temp];
    xxd2 = [xxd2;xd2_temp];
    yyd2 = [yyd2;yd2_temp];
end

[i,j] = size(xx);

for k = 1:i %iΪ����
    u = linspace(k-1, k, j);
%         plot(u,yy(k,:));%����ÿһ������
%        hold on
%      plot(u,xx(k,:));%����ÿһ������
%      hold on
      plot(xx(k,:),yy(k,:));%����ÿһ������
      hold on
end
figure(2)
for k = 1:i %iΪ����
    u = linspace(k-1, k, j);
%     u=u*10;
      plot(xxd1(k,:),yyd1(k,:));%����ÿһ������
      hold on
     plot(u,yyd1(k,:));%����ÿһ������
     hold on
     plot(u,xxd1(k,:));%����ÿһ������
     hold on
end
figure(3)
for k = 1:i %iΪ����
    u = linspace(k-1, k, j);
      plot(u,yyd2(k,:));%����ÿһ������
      hold on
end
figure(4)
hold on
angtotal=[];
for k=1:i

    for m=2:j
        dify=(yy(k,m)-yy(k,m-1));
        if (dify<1e-9 && dify>-1e-9)
            dify = 0;
        end
        ang = dify/(xx(k,m)-xx(k,m-1));
        plot(xx(k,m-1),ang,'r.');
%         plot(xx(k,m),yy(k,m),'.');
        hold on
        angtotal =[angtotal,ang];
    end
    if (k~=i )
        dify=(yy(k+1,2)-yy(k+1,1));
        if (dify<1e-9 && dify>-1e-9)
            dify = 0;
        end
        ang = dify/(xx(k+1,2)-xx(k+1,1));
        angtotal =[angtotal,ang];
        plot(xx(k,m),ang,'r.');
        hold on
    else
        plot(xx(k,m),ang,'r.');
        angtotal =[angtotal,ang];
        hold on
    end
end
figure(5)
% j=j-1;
angveltotal=[];
for k=1:i
    for m=2:j
        difang = angtotal((k-1)*j+m)-angtotal((k-1)*j+m-1);
        if (difang<1e-9 && difang>-1e-9)
            difang = 0;
        end
        angvel = difang/(xx(k,m)-xx(k,m-1));
        plot(xx(k,m-1),angvel,'r.');
        hold on
       angveltotal=[angveltotal,angvel];
    end
    if (k~=i )
        difang = angtotal(k*j+2)-angtotal(k*j+1);
        if (difang<1e-9 && difang>-1e-9)
            difang = 0;
        end
        angvel = difang/(xx(k+1,2)-xx(k+1,1));
        plot(xx(k,m),angvel,'r.');
        hold on
       angveltotal=[angveltotal,angvel];
    else
        plot(xx(k,m),angvel,'r.');
        hold on
        angveltotal=[angveltotal,angvel];
    end
end