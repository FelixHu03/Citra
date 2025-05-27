clear; clc;

% Felix 2327250059
I = imread('onion.png');
% figure, subplot(2,4,1), imshow(I), title('Original Image');
% subplot(2,4,2), imshow(I(:,:,1)), title('R component');
% subplot(2,4,3), imshow(I(:,:,2)), title('G component');
% subplot(2,4,4), imshow(I(:,:,3)), title('B component');

% Felix 2327250059
Ihsv = rgb2hsv(I);
% subplot(2,4,6), imshow(Ihsv(:,:,1)), title('Hue')
% subplot(2,4,7), imshow(Ihsv(:,:,2)), title('Saturation');
% subplot(2,4,8), imshow(Ihsv(:,:,3)), title('Value');

% Felix 2327250059
Igray = rgb2gray(I);
% figure, subplot(2,2,1), imshow(Igray), title('Grayscale');
% subplot(2,2,2), imshow(Ihsv(:,:,3)), title('Value component');
% subplot(2,2,3), imhist(Igray), title('Grayscale');
% subplot(2,2,4), imhist(Ihsv(:,:,3)), title('Value component');

% Felix 2327250059
fn = fspecial('average');
I2r = imfilter(I(:,:,1), fn);
I2g = imfilter(I(:,:,2), fn);
I2b = imfilter(I(:,:,3), fn);
I2(:,:,1) = I2r;
I2(:,:,2) = I2g;
I2(:,:,3) = I2b;
% figure, subplot(1,2,1), imshow(I), title('Original Image');
% subplot(1,2,2), imshow(I2), title('Averaged Image');

% Felix 2327250059
Ihsv2h = imfilter(Ihsv(:,:,1), fn);
Ihsv2s = imfilter(Ihsv(:,:,2), fn);
Ihsv2v = imfilter(Ihsv(:,:,3), fn);
Ihsv2(:,:,1) = Ihsv2h;
Ihsv2(:,:,2) = Ihsv2s;
Ihsv2(:,:,3) = Ihsv2v;

% Felix 2327250059
% figure, subplot(2,3,1), imshow(Ihsv(:,:,1)), ...
% title('Original Hue');
% subplot(2,3,2), imshow(Ihsv(:,:,2)), ...
% title('Original Saturation');
% subplot(2,3,3), imshow(Ihsv(:,:,3)), ...
% title('Original Value');
% subplot(2,3,4), imshow(Ihsv2(:,:,1)), ...
% title('Filtered Hue');
% subplot(2,3,5), imshow(Ihsv2(:,:,2)), ...
% title('Filtered Saturation');
% subplot(2,3,6), imshow(Ihsv2(:,:,3)), ...
% title('Filtered Value');
% figure, subplot(1,2,1), imshow(I), title('Original Image');
% subplot(1,2,2), imshow(hsv2rgb(Ihsv2)), ...
% title('HSV with all components filtered');


% Felix 2327250059
Ihsv3(:,:,[1 2]) = Ihsv(:,:,[1 2]);
Ihsv3(:,:,3) = Ihsv2v;
% figure, subplot(1,2,1), imshow(I), title('Original Image');
% subplot(1,2,2), imshow(hsv2rgb(Ihsv3)), ...
% title('HSV with only value component filtered');

% Felix 2327250059
fn2 = fspecial('laplacian',0);
Ihsv4v = imfilter(Ihsv(:,:,3), fn2);
Ihsv4(:,:,[1 2]) = Ihsv(:,:,[1 2]);
Ihsv4(:,:,3) = imsubtract(Ihsv(:,:,3),Ihsv4v);
figure, subplot(1,2,1), imshow(I), title('Original Image');
subplot(1,2,2), imshow(hsv2rgb(Ihsv4)), ...
title('HSV sharpene');

