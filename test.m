% close all
% clear
% 输入圆心 C(xc, yc)，圆上点 P(x1, y1) 和旋转角度 theta
xc = 0; % 圆心的 x 坐标
yc = 0; % 圆心的 y 坐标
r = 1;  % 圆的半径
figure;
% 假设圆上的点 P(x1, y1)，该点的角度为 60 度 (pi/3 弧度)
x1 = xc + r * cos(pi / 2); % 圆上一点的 x 坐标
y1 = yc + r * sin(pi / 2); % 圆上一点的 y 坐标

% 旋转角度 theta (以弧度表示)
theta = -pi / 4; % 旋转角度 45 度
% theta_vals = linspace(0, 2*pi, 5);  % 选择 20 个角度从 0 到 2pi
theta_vals = [0,1,2,3,4,5,6,7,8,9];
% 平移圆心到原点
x1_shifted = x1 - xc;
y1_shifted = y1 - yc;
for i = 1:length(theta_vals)
theta = -theta_vals(i);
% 使用旋转矩阵计算旋转后的坐标
x2_shifted = x1_shifted * cos(theta) - y1_shifted * sin(theta);
y2_shifted = x1_shifted * sin(theta) + y1_shifted * cos(theta);

% 平移回原来的位置
x2 = x2_shifted + xc;
y2 = y2_shifted + yc;

% 绘制圆
theta_circle = linspace(0, 2*pi, 100);
x_circle = xc + r * cos(theta_circle); % 圆的 x 坐标
y_circle = yc + r * sin(theta_circle); % 圆的 y 坐标

% 绘制图形

hold on;
plot(x_circle, y_circle, 'k--'); % 绘制圆
plot(x1, y1, 'ro', 'MarkerFaceColor','r'); % 绘制原点 P
plot(x2, y2, 'bo', 'MarkerFaceColor','b'); % 绘制旋转后的点 P'
line([xc x1], [yc y1], 'Color','r', 'LineStyle','--'); % 圆心到 P 的连线
line([xc x2], [yc y2], 'Color','b', 'LineStyle','--'); % 圆心到 P' 的连线
end
% 添加标题和标签
title('圆心不在原点的旋转');
xlabel('X轴');
ylabel('Y轴');
axis equal;
grid on;
legend('圆', '原点 P', '旋转后的点 P''', 'Location', 'best');
hold off;
