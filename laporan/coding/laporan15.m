% clear ; clc;
% 
% % % Felix 2327250059
% % I = imread('eight.tif');
% % In = imnoise(I,'gaussian',0,0.001);
% % % figure, 
% % % subplot(2,2,1), imshow(I), title('Original Image');
% % % subplot(2,2,2), imshow(In), title('Noisy Image');
% % 
% % % Felix 2327250059
% % f1 = fspecial('average');
% % I_blur1 = imfilter(In,f1);
% % % subplot(2,2,3), imshow(I_blur1), ...
% % % title('Averaging with default kernel size');
% % 
% % % Felix 2327250059
% % f2 = fspecial('average',[5 5]);
% % I_blur2 = imfilter(In,f2);
% % % subplot(2,2,4), imshow(I_blur2), ...
% % % title('Averaging with 5x5 kernel');
% % 
% % 
% % 
% % % Felix 2327250059
% % % I_salt = im2double(imread('eight_salt.tif'));
% % % I_pepper = im2double(imread('eight_pepper.tif'));
% % % figure
% % % subplot(2,3,1), imshow(I), title('Original Image');
% % % subplot(2,3,2), imshow(I_salt), title('Salt Noise');
% % % subplot(2,3,3), imshow(I_pepper), title('Pepper Noise');
% % 
% % % Felix 232725059
% % I_fix1 = nlfilter(I_salt,[3 3],@c_harmonic,-1);
% % % subplot(2,3,5), imshow(I_fix1), title('Salt Removed, r = -1');
% % 
% % % Felix 2327250059
% % I_fix2 = nlfilter(I_pepper,[3 3],@c_harmonic,1);
% % % subplot(2,3,6), imshow(I_fix2), title('Pepper Removed, r = 1');
% % 
% % % Felix 2327250059
% % I_bad = nlfilter(I_pepper,[3 3],@c_harmonic,-1);
% % % subplot(2,3,4), imshow(I_bad), title('Using wrong sign for r');
% % 
% % 
% % % Felix 2327250059
% % I_fix4 = nlfilter(I_salt,[3 3],@harmonic);
% % % figure
% % % subplot(2,3,1), imshow(I), title('Original Image');
% % % subplot(2,3,2), imshow(I_salt), title('Salt Noise');
% % % subplot(2,3,3), imshow(I_pepper), title('Pepper Noise');
% % % subplot(2,3,5), imshow(I_fix4), title('Harmonic Filtered (salt)');
% % 
% % % Felix 2327250059
% % I_bad2 = nlfilter(I_pepper,[3 3],@harmonic);
% % % subplot(2,3,6), imshow(I_bad2), title('Harmonic Filtered (pepper)');
% % 
% % % Felix 2327250059
% % In_d = im2double(In);
% % I_fix5 = nlfilter(In_d,[5 5],@harmonic);
% % % figure
% % % subplot(1,3,1), imshow(I), title('Original Image');
% % % subplot(1,3,2), imshow(In_d), title('Image w/ Gaussian Noise');
% % % subplot(1,3,3), imshow(I_fix5), title('Filtered w/ Harmonic Mean');
% % 
% % % Felix 2327250059
% % I_fix6 = nlfilter(In_d,[3 3],@geometric);
% % I_sp = nlfilter(I_salt, [3 3], @geometric);
% % figure
% % subplot(1,3,1), imshow(I), title('Original Image');
% % subplot(1,3,2), imshow(In_d), title('Gaussian Noise');
% % subplot(1,3,3), imshow(I_fix6), title('Geometric Mean Filtered');
% 
% % Felix 2327250059
% % I = imread('coins.png');
% % I_snp = imnoise(I,'salt & pepper');
% % % figure
% % % subplot(1,3,1), imshow(I), title('Original Image');
% % % subplot(1,3,2), imshow(I_snp), title('Salt & Pepper Noise');
% % 
% % % Felix 232725059
% % I_filt = medfilt2(I_snp,[3 3]);
% % % subplot(1,3,3), imshow(I_filt), title('Filtered Image');
% % 
% % % Felix 2327250059
% % I_g = imnoise(I,'gaussian');
% % I_filt2 = medfilt2(I_g,[3 3]);
% % figure
% % subplot(1,3,1), imshow(I), title('Original Image');
% % subplot(1,3,2), imshow(I_g), title('Gaussian Noise');
% % subplot(1,3,3), imshow(I_filt2), title('Filtered');
% 
% clc; clear;
% % Felix 227250059
% I_s = imread('eight_salt.tif');
% I_p = imread("eight_pepper.tif");
% % Felix 227250059
% I2 = ordfilt2(I_p, 5, ones(3,3));
% % figure
% % subplot(1,2,1), imshow(I_s), title('Salt Noise');
% % subplot(1,2,2), imshow(I2), title('Min Filter');
% 
% % Felix 2327250059
% I_p = imread('eight_pepper.tif');
% I3 = ordfilt2(I_p, 9, ones(3,3));
% % figure
% % subplot(1,2,1), imshow(I_p), title('Pepper Noise');
% % subplot(1,2,2), imshow(I3), title('Max Filter');
% 
% % Felix 2327250059
% I = imread('coins.png');
% I_gray = rgb2gray(I);       
% I_g = imnoise(I_gray,'gaussian',0,0.001);
% midpoint = @(x) 0.5 * (max(x(:)) + min(x(:)));
% I_filt = nlfilter(I_g,[3 3],midpoint);

% figure
% subplot(1,2,1), imshow(I_g), title('Gaussian Noise');
% subplot(1,2,2), imshow(I_filt), title('Midpoint Filter');

clc; clear;
% Felix 2327250059
I = imread('cameraman.tif');
Id = im2double(I);
In = imnoise(Id,'salt & pepper');
In2 = imnoise(In,'gaussian');

% Felix 2327250059
I_filt = nlfilter(In2,[5 5],@atmean,6);
figure
subplot(1,3,1), imshow(I), title('Original Image');
subplot(1,3,2), imshow(In2), title('S&P and Gaussian Noise');
subplot(1,3,3), imshow(I_filt), title('Alpha Trimmed Mean');


