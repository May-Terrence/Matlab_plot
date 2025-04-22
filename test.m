% close all
% clear
% ����Բ�� C(xc, yc)��Բ�ϵ� P(x1, y1) ����ת�Ƕ� theta
xc = 0; % Բ�ĵ� x ����
yc = 0; % Բ�ĵ� y ����
r = 1;  % Բ�İ뾶
figure;
% ����Բ�ϵĵ� P(x1, y1)���õ�ĽǶ�Ϊ 60 �� (pi/3 ����)
x1 = xc + r * cos(pi / 2); % Բ��һ��� x ����
y1 = yc + r * sin(pi / 2); % Բ��һ��� y ����

% ��ת�Ƕ� theta (�Ի��ȱ�ʾ)
theta = -pi / 4; % ��ת�Ƕ� 45 ��
% theta_vals = linspace(0, 2*pi, 5);  % ѡ�� 20 ���Ƕȴ� 0 �� 2pi
theta_vals = [0,1,2,3,4,5,6,7,8,9];
% ƽ��Բ�ĵ�ԭ��
x1_shifted = x1 - xc;
y1_shifted = y1 - yc;
for i = 1:length(theta_vals)
theta = -theta_vals(i);
% ʹ����ת���������ת�������
x2_shifted = x1_shifted * cos(theta) - y1_shifted * sin(theta);
y2_shifted = x1_shifted * sin(theta) + y1_shifted * cos(theta);

% ƽ�ƻ�ԭ����λ��
x2 = x2_shifted + xc;
y2 = y2_shifted + yc;

% ����Բ
theta_circle = linspace(0, 2*pi, 100);
x_circle = xc + r * cos(theta_circle); % Բ�� x ����
y_circle = yc + r * sin(theta_circle); % Բ�� y ����

% ����ͼ��

hold on;
plot(x_circle, y_circle, 'k--'); % ����Բ
plot(x1, y1, 'ro', 'MarkerFaceColor','r'); % ����ԭ�� P
plot(x2, y2, 'bo', 'MarkerFaceColor','b'); % ������ת��ĵ� P'
line([xc x1], [yc y1], 'Color','r', 'LineStyle','--'); % Բ�ĵ� P ������
line([xc x2], [yc y2], 'Color','b', 'LineStyle','--'); % Բ�ĵ� P' ������
end
% ��ӱ���ͱ�ǩ
title('Բ�Ĳ���ԭ�����ת');
xlabel('X��');
ylabel('Y��');
axis equal;
grid on;
legend('Բ', 'ԭ�� P', '��ת��ĵ� P''', 'Location', 'best');
hold off;
