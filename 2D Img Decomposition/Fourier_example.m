clear; clc;
 
f = imread('cameraman.tif');

F = fft2(f);
F = fftshift(F);
F = log(1+abs(F));

subplot(1, 4, 1); imshow(f);
subplot(1, 4, 2); imshow(F, []);
subplot(1, 4, 3); surf(abs(F));

