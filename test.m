% % ��ȡԭʼ Excel �ļ�
% % data = xlsread('1206baro.xlsx');
% 
% % ��ȡǰ 5000 ������
% % subsetData = data(1:5000, 1:46);
% 
% % ����ȡ�����ݱ��浽�µ� Excel �ļ�
% % xlsxs(subsetData, '12066.xlsx');
% % byang(5)
% % x = 0:0.1:2*pi;
% % y = sin(x);
% % 
% % plot(x, y);
% % xlabel('<font face="TeX">\theta_{angle}</font>', 'Interpreter', 'html');
% % ylabel('<font face="TeX">\sin(\theta)</font>', 'Interpreter', 'html');
% % x = 0:0.1:2*pi;
% % y = sin(x);
% % figure(55);
% % plot(x, y);hold on;
% % plot(x, y);
% % h = legend('inv', '$e_{i} + e_{f}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% % 
% % xlabel('$\theta_{\mathrm{angle}}$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% % ylabel('$\sin(\theta)$', 'Interpreter', 'latex','FontName', 'Times New Roman');
% clear all
% close all
% x = -2:0.1:2;
% y = sin(x);
% 
% plot(x, y);
% hold on;
% xline(0, 'r--');text(0.1, 0.5, 'Disturbance ��', 'Color', 'red', 'FontSize', 20, 'FontName', 'Times New Roman');
% 
% 
% �������󲢳�ʼ������ֵ
obj = PersistentValues(10);

% ��ʾ��ʼ����ֵ
obj.showVariable();

% �޸ı���ֵ
obj.modifyVariable(20);

% �ٴ���ʾ����ֵ
obj.showVariable();

