clear; clc;

% Felix 2327250059
I = imread("eight.tif");
Id = im2double(I);
% I_dft = fft2(Id);
% figure , imshow(Id), title('Original Image');
% figure,  imshow(log(1 + abs(fftshift(I_dft))),[]),...
%     title( 'FT oforiginal image');

% Felix 2327250059
[M, N] = size(I);
dist = distmatrix(M,N);
% figure , mesh(fftshift(dist)), title('Distance Matriks')
% % Felix 2327250059
H = zeros(M, N);
% Felix 2327250059
radius = 35;
ind = dist<= radius; %index
H(ind) = 1;
Hd = double(H);

% felix 2327250059
% figure, imshow(fftshift(H)), title("ideal low-pass filter")

I_dft = fft2(I);
% Felix 2327250059
DFT_filt = Hd.* I_dft;

I2 = real(ifft2(DFT_filt));

% Felix 23272500059
sigma = 30;
H_gau = exp(-(dist .^ 2) / (2 * (sigma ^ 2)));
% figure, imshow(Id), title('Original Image');
% figure, imshow(log(1 + abs(fftshift(I_dft))),[]), ...
% title('DFT of original image');
% figure, mesh(fftshift(dist)), title('Distance Matrix');
% figure, imshow(fftshift(H_gau)), title('Gaussian low-pass');

% Felix 23272500059
DFT_filt_gau = H_gau .* I_dft;
I3 = real(ifft2(DFT_filt_gau));
% figure, imshow(log(1 + abs(fftshift(DFT_filt_gau))),[]), ...
% title('Filtered FT');
% figure, imshow(I3), title('Filtered Image');


% Felix 2327250059
% figure, imshow(log(1+ abs(fftshift(DFT_filt))),[]),...
%     title('Filtered FT')
% figure, imshow(I2), title('Filltered Image');
% Felix 2327250059
% fddemo

% Felix 2327250059
D0 =35 ; n = 3;
H_but = 1 ./(1+ (dist ./ D0) .^(2 * n));
% figure, imshow(Id), title('original image');
% figure, imshow(log(1 + abs(fftshift(I_dft))), []),...
%     title('FT of original image')
% figure , mesh(fftshift(dist)), title('Distance Matriks')
% figure, imshow(fftshift(H_but)), title("Butterworthl ow-pass")



% Felix 2327250059
DFT_filt_but= H_but .*I_dft;
I4 = real(ifft(DFT_filt_but));
% figure, imshow(log(1 + abs(fftshift(DFT_filt_but))),[]), ...
% title('Filtered FT');
% figure, imshow(I4), title('Filtered Image');


% Felix 2327250059
figure, mesh(fftshift(Hd)), title('Ideal low-pass filter');
figure, mesh(fftshift(H_gau)), title('Gaussian low-pass filter');
figure, mesh(fftshift(H_but)), title('Butterworth low-pass filter');