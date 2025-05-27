clear;clc;

I = imread('cameraman.tif');
Id = im2double(I);
ft = fft2(Id);

max(ft(:))
min(ft(:))

ft_shift = fftshift(ft);
idx = [0 1 2 -3 -2 -1];
fftshift(idx)