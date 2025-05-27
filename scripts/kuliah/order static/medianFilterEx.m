clear; clc;

I = imread('coins.png');
% I_noise = imnoise(I, 'salt & pepper');
I_noise = imnoise(I, 'gaussian');

I_filt = medfilt2(I_noise, [3 3]);

subplot(1, 3, 1), imshow(I), title('Original Image');
subplot(1, 3, 2), imshow(I_noise), title('Noisy Image');
subplot(1, 3, 3), imshow(I_filt), title('Filtered Image');



