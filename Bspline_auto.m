% 导入B样条曲线的控制点和节点矢量
control_points = [0, 1, 2, 3, 4; 0, 2, -1, 3, 1];
knots = [0, 0, 0, 1, 2, 3, 3, 3];

% 选择参数值，并为每个参数值分配时间戳
param_values = linspace(0, 3, 100); % 选择均匀的参数值
time_stamps = linspace(0, 10, numel(param_values)); % 关联时间信息

% 计算曲线点，并将时间信息与曲线点关联
curve_points_with_time = bsplineCurveWithTime(control_points, knots, param_values, time_stamps);

% 绘制带有时间信息的B样条曲线
figure;
plot3(curve_points_with_time(1, :), curve_points_with_time(2, :), time_stamps, 'b.-', 'MarkerSize', 10);
title('B-spline Curve with Time Information');
xlabel('X');
ylabel('Y');
zlabel('Time');
grid on;

function curve_points_with_time = bsplineCurveWithTime(control_points, knots, param_values, time_stamps)
    n = size(control_points, 2) - 1; % 控制点数量
    p = numel(knots) - n - 1; % B样条曲线的次数

    curve_points_with_time = zeros(3, numel(param_values));

    for i = 1:numel(param_values)
        curve_points_with_time(:, i) = [bsplineCurve(control_points, knots, param_values(i), p); time_stamps(i)];
    end
end

function point = bsplineCurve(control_points, knots, t, p)
    % 使用de Boor算法计算B样条曲线上的点
    % control_points: 控制点矩阵
    % knots: 节点矢量
    % t: 参数值
    % p: 曲线次数

    span = findSpan(knots, t, p);

    % 计算基函数值
    basis_values = basisFunctions(span, t, p, knots);

    % 计算曲线点
    point = zeros(2, 1);
    for i = 0:p
        point = point + basis_values(i + 1) * control_points(:, span - p + i);
    end
end

function span = findSpan(knots, t, p)
    % 查找参数值t所在的区间
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
    % 计算B样条基函数的值
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
