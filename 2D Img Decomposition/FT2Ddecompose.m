clear; clc;

f = imread('cameraman.tif');
F = fft2(f);
[x, y] = meshgrid(-127:128);
z = (x == 2) & (y == 1);
z = fftshift(z);
f1 = ifft2(F.*z);
% imshow(fftshift(log(1+abs(F.*z))));
imshow(ifft2(F.*z), []);

