% ����B�������ߵĿ��Ƶ�ͽڵ�ʸ��
control_points = [0, 1, 2, 3, 4; 0, 2, -1, 3, 1];
knots = [0, 0, 0, 1, 2, 3, 3, 3];

% ѡ�����ֵ����Ϊÿ������ֵ����ʱ���
param_values = linspace(0, 3, 100); % ѡ����ȵĲ���ֵ
time_stamps = linspace(0, 10, numel(param_values)); % ����ʱ����Ϣ

% �������ߵ㣬����ʱ����Ϣ�����ߵ����
curve_points_with_time = bsplineCurveWithTime(control_points, knots, param_values, time_stamps);

% ���ƴ���ʱ����Ϣ��B��������
figure;
plot3(curve_points_with_time(1, :), curve_points_with_time(2, :), time_stamps, 'b.-', 'MarkerSize', 10);
title('B-spline Curve with Time Information');
xlabel('X');
ylabel('Y');
zlabel('Time');
grid on;

function curve_points_with_time = bsplineCurveWithTime(control_points, knots, param_values, time_stamps)
    n = size(control_points, 2) - 1; % ���Ƶ�����
    p = numel(knots) - n - 1; % B�������ߵĴ���

    curve_points_with_time = zeros(3, numel(param_values));

    for i = 1:numel(param_values)
        curve_points_with_time(:, i) = [bsplineCurve(control_points, knots, param_values(i), p); time_stamps(i)];
    end
end

function point = bsplineCurve(control_points, knots, t, p)
    % ʹ��de Boor�㷨����B���������ϵĵ�
    % control_points: ���Ƶ����
    % knots: �ڵ�ʸ��
    % t: ����ֵ
    % p: ���ߴ���

    span = findSpan(knots, t, p);

    % ���������ֵ
    basis_values = basisFunctions(span, t, p, knots);

    % �������ߵ�
    point = zeros(2, 1);
    for i = 0:p
        point = point + basis_values(i + 1) * control_points(:, span - p + i);
    end
end

function span = findSpan(knots, t, p)
    % ���Ҳ���ֵt���ڵ�����
    n = numel(knots) - 1 - p;
    if t == knots(n + 1)
        span = n;
        return;
    end

    low = p;
    high = n + 1;
    mid = floor((low + high) / 2);

    while t < knots(mid) || t >= knots(mid + 1)
        if t < knots(mid)
            high = mid;
        else
            low = mid;
        end
        mid = floor((low + high) / 2);
    end

    span = mid;
end

function basis_values = basisFunctions(span, t, p, knots)
    % ����B������������ֵ
    basis_values = zeros(p + 1, 1);
    basis_values(1) = 1;

    left = zeros(p + 1, 1);
    right = zeros(p + 1, 1);

    for j = 1:p
        left(j + 1) = t - knots(span + 1 - j);
        right(j + 1) = knots(span + j + 1) - t;

        saved = 0;
        for r = 0:j - 1
            temp = basis_values(r + 1) / (right(r + 2) + left(j - r + 1));
            basis_values(r + 1) = saved + right(r + 2) * temp;
            saved = left(j - r + 1) * temp;
        end
        basis_values(j + 1) = saved;
    end
end
