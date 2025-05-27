% clear; clc;

% Felix 2327250059
I = imread('coins.png');
% figure, imshow(I), title('Original Image');

% Felix 2327250059
% figure, imhist(I), title('Histogram of Image');

% Felix 2327250059
T = 85; I_thresh = im2bw(I,( T / 255));
% figure, imshow(I_thresh), title('Threshold Image (heuristic)');

% Felix 2327250059
T2 = graythresh(I);
I_thresh2 = im2bw(I,T2);
% figure, imshow(I_thresh2), title('Threshold Image (graythresh)');

% clear; clc;

% Felix 2327250059
% I = imread('gradient_with_text.tif');
% figure, imshow(I), title('Original Image');

% Felix 2327250059
I_gthresh = im2bw(I,graythresh(I));
% figure, imshow(I_gthresh), title('Global Thresholding');
% figure, imhist(I), title('Histogram of Original');

% Felix 2327250059
% function y = adapt_thresh(x)

% Felix 2327250059
% y = im2bw(x,graythresh(x));
% Felix 2327250059
I_thresh = blkproc(I,[10 10], @adapt_thresh);

% Felix 2327250059
% figure
% subplot(1,2,1), imshow(I), title('Original Image');
% subplot(1,2,2), imshow(I_thresh), title('Adaptive Thresholding');


% Felix 2327250059
std_without_text = std2(I(1:10, 1:10));
std_with_text = std2(I(100:110, 100:110));

% Felix 2327250059
% if std2(x) < 1
% y = ones(size(x,1),size(x,2));
% else
% y = im2bw(x,graythresh(x));
% end