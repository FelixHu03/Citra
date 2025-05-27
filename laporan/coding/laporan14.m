clear; clc;

% Felix 2327250059
I = im2double(imread('eight.tif'));
I_dft = fft2(I);
% figure, imshow(I), title('Original Image');
% figure, imshow(log(1 + abs(fftshift(I_dft))),[]), ...
% title('FT of original image');

% Felix 2327250059
[M, N] = size(I);
dist = distmatrix(M, N);

% Felix 2327250059
H = ones(M, N);
radius = 30;
ind = dist <= radius;
H(ind) = 0;

% Felix 2327250059
a = 1; b = 1;
Hd = double(a + (b .* H));

% Felix 2327250059
DFT_filt = Hd .* I_dft;
I2 = real(ifft2(DFT_filt));
% figure, imshow(log(1 + abs(fftshift(DFT_filt))),[]), ...
% title('Filtered FT');
% figure, imshow(I2), title('Filtered Image');

% Felix 2327250059
% figure, imshow(fftshift(Hd),[]), title('Filter as an image');
% figure, mesh(fftshift(Hd)), zlim([0 2]), title('Filter as a mesh');

% Felix 2327250059
sigma = 30;
H_gau=1- exp(-(dist .^ 2) / (2 * (sigma ^ 2)));

% Felix 2327250059
H_gau_hfe = a + (b .* H_gau);
% figure, mesh(fftshift(H_gau_hfe)), zlim([0 2]), ...
% title('Gaussian high-pass filter');

% Felix 2327250059
DFT_filt_gau = H_gau_hfe .* I_dft;
I3 = real(ifft2(DFT_filt_gau));
% figure, imshow(I), title('Original Image');
% figure, imshow(log(1 + abs(fftshift(I_dft))),[]), ...
% title('FT of original image');
% figure, imshow(log(1 + abs(fftshift(DFT_filt_gau))),[]), ...
% title('Filtered FT');
% figure, imshow(I3), title('Filtered Image');

% Felix 2327250059
cutoff = 30; order = 2;
H_but = 1 ./ (1 + (cutoff ./ dist) .^(2 * order));

% Felix 2327250059
H_but_hfe = a + (b .* H_but);
% figure, mesh(fftshift(H_but_hfe)), zlim([0 2]), ...
% title('Butterworth high-pass filter');

% Felix 2327250059
DFT_filt_but = H_but_hfe .* I_dft;
I4 = real(ifft2(DFT_filt_but));
figure, imshow(I), title('Original Image');
figure, imshow(log(1 + abs(fftshift(I_dft))),[]), ...
title('FT of original image');
figure, imshow(log(1 + abs(fftshift(DFT_filt_but))),[]), ...
title('Filtered FT');
figure, imshow(I4), title('Filtered Image');