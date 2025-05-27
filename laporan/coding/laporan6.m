clear; clc;

% Felix 2327250059
I = imread('circuit.tif');
% figure, subplot(2,2,1), imshow(I), title('Image')
% subplot(2,2,2), imhist(I, 256), axis tight, title('Histogram')
% % Felix 2327250059
% subplot(2,2,3),imhist(I, 64), axis tight, title('Histogram with 64 bins')
% subplot(2,2,4),imhist(I, 32), axis tight, title('Histogram with 32 bins')
% Felix 2327250059
c = imhist(I,32);
% Felix 2327250059
c_norm= c / numel(I);
% Felix 2327250059
sum(c_norm) == 1;
% Felix 2327250059
abs(sum(c_norm) - 1) == 0;
% % Felix 2327250059
% figure, subplot(1,2,1), bar_1 = bar(c);
% set(gca, 'XLim',[0,32], 'YLim', [0 max(c)]);
% 
% % Felix 2327250059
% set(gca,'XTick', [0:8:32], 'YTick', ...
%     [linspace(0,7000,8) max(c)])
% % Felix 2327250059
% set(bar_1, 'FaCeColor', 'r'),title('Bar Chart')
% % Felix 2327250059
% set(bar_1, 'BarWidth', 0.5),title('Bar Chart')

% Felix 2327250059
% subplot(1,2,2), bar_2 = bar(c_norm);
% set(gca,'XTick', [0:8:32], 'YTick', ...
%     [linspace(0,7000,8) max(c)])
% xlim([0 32]), ylim([0 max(c_norm)])
% title('Noralized Bar Chart')
% set(bar_2, 'FaceColor', 'g')
% set(bar_2, 'BarWidth', 0.5)


% Felix 2327250059
% figure, 
% subplot(1,2,1), stem(c,'fill', 'MarkerFaceColor', 'red'),...
%     axis tight, title('stem chart');
% subplot(1,2,2), stem(c_norm,'fill', 'MarkerFaceColor', 'red'),...
%     axis tight, title('normalized stem chart');
% Felix 2327250059
% x = 1:32;
% figure, 
% subplot(1,2,1), stem(x,c,'b-.'),...
%     axis tight, title('line chart')
% xlim([0,32]), ylim([0 max(c)])
% xticks(0:8:32),yticks([linspace(0, 7000, 8), max(c)]);
% 
% subplot(1,2,2), stem(x,c_norm,'r--'),...
%     axis tight, title('Normalized Line Chart');
% xlim([0,32]), ylim([0 max(c_norm)])
% xticks(0:8:32),yticks(linspace(0, max(c_norm), 7)); 

% Felix 232725059
% Felix 2327250059
x = 1:32;
figure, 
subplot(1,2,1), plot(x,c,'b-.', 'LineWidth',2),...
    axis tight, title('line chart')
xlim([0,32]), ylim([0 max(c)])
xticks(0:8:32),yticks([linspace(0, 7000, 8), max(c)]);

subplot(1,2,2), plot(x,c_norm,'r--','LineWidth',5),...
    axis tight, title('Normalized Line Chart');
xlim([0,32]), ylim([0 max(c_norm)])
xticks(0:8:32),yticks(linspace(0, max(c_norm), 7)); 
