clear; clc;

% Felix 2327250059
I = repmat(uint8([0:255]),256,1);
% figure, subplot(1,2,1), subimage(I), title('Original Image');

% Felix 2327250059
I2 = grayslice(I,16);
% subplot(1,2,2), subimage(I2,colormap(winter(16))), ...
% title('Pseudo-colored with "winter" colormap')

% Felix 2327250059
levels = [0.25*255, 0.75*255, 0.9*255];
I3 = grayslice(I,levels);
% figure, imshow(I3,spring(4))

% Felix 2327250059
I = imread('mri.jpg');
figure, subplot(1,2,1), subimage(I), title('Original Image');

% Felix 2327250059
I2 = grayslice(I,16);
subplot(1,2,2), subimage(I2, colormap(jet(16))), ...
title('Pseudo-colored with "jet" colormap');
