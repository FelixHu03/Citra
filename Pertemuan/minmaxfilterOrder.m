clear;clc;
I = imread('mri.jpg');
% aritmating main, median main
totl_I = numel(I);
rng(123);
I2  = randperm(totl_I);
I_salt =I;
I_papper =I;

I_salt(I2(1: floor(totl_I * 0.35))) = 255; % 35
I_papper(I2(1: floor(totl_I * 0.15))) = 0; % 15

% median
I_median_S = medfilt2(I_salt, [3 3]);
I_median_P = medfilt2(I_papper);

% aritmatik
f1      = fspecial('average', [3 3]);
I_arit_s = imfilter(I_salt, f1, 'symmetri');
I_arit_P = imfilter(I_papper, f1, 'symmetri');


subplot(2, 6, 1), imshow(I_salt), title('Salt Noise');
subplot(2, 6, 2), imshow(I_papper), title('Papper Noise');

subplot(2, 6, 3), imshow(I_median_S), title('median Salt');
subplot(2,6, 9)
SE1   = sum(sum((I-I_median_S).^2));
MSE1  = SE1/numel(I);
RMSE1 = sqrt(MSE1);
PSNR1 = 20*log10(255/RMSE1);
SNR1  = 10*log10(sum(sum(I))/SE1);
text(0.0,1,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR1)]), axis off;

subplot(2, 6, 4), imshow(I_median_P), title('median papper');
subplot(2,6, 10)
SE2   = sum(sum((I-I_median_P).^2));
MSE2  = SE2/numel(I);
RMSE2 = sqrt(MSE2);
PSNR2 = 20*log10(255/RMSE1);
SNR2  = 10*log10(sum(sum(I))/SE2);
text(0.0,0.2,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR2)]), axis off;

subplot(2, 6, 5), imshow(I_arit_s), title('average Salt');

subplot(2, 6, 6), imshow(I_arit_P), title('average papper');
