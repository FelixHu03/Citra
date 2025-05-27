clear; clc;

% Felix 2327250059
I = imread("eight.tif");
Id = im2double(I);
I_dft = fft2(Id);
% figure , imshow(Id), title('Original Image');
% figure,  imshow(log(1 + abs(fftshift(I_dft))),[]),...
%     title( 'FT oforiginal image');

% Felix 2327250059
[M, N] = size(I);
dist = distmatrix(M,N);
% figure , mesh(fftshift(dist)), title('Distance Matriks')
% Felix 2327250059
H = ones(M, N);
% Felix 2327250059
radius = 50;
ind = dist<= radius; %index
H(ind) = 0;
a = 1; b = 1;
Hd = double(a+(b.*H));

% felix 2327250059
% figure, imshow(fftshift(H)), title("ideal low-pass filter")

% Felix 2327250059
DFT_filt = Hd.* I_dft;
I2 = real(ifft2(DFT_filt)); %get real number

% % Felix 2327250059
% figure, imshow(log(1+ abs(fftshift(DFT_filt))),[]),...
%     title('Filtered FT')
% figure, imshow(I2), title('Filltered Image');

figure,
subplot(3, 3, 1), imshow(Id), title('Original Image'); 
subplot(3, 3, 2), imshow(log(1 + abs (fftshift (I_dft))), []); title('FT of original image');
subplot(3, 3, 3), mesh(fftshift (dist)), title('Distance Matrix');
subplot(3, 3, 4), imshow((fftshift(H))); title('Ideal low-pass filter');
subplot(3, 3, 5), imshow(log(1+abs(fftshift(DFT_filt))), []); title('Filtered FT');
% subplot(3, 3, 6), imshow(fftshift(Hd),[])
subplot(3,3,6), imshow(I2)