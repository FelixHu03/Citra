% clear; clc;
% 
% g =[ 1 2 3;
% 4 4 2;
% 3 3 2];
% 
% imfilter(g, fspecial('average', [3 3]));

clear; clc;

% I  = imread('eight.tif');
I = imread('mri.jpg');
In = imnoise(I,'gaussian',0.1,0.01);

f1      = fspecial('average');
I_blur1 = imfilter(In, f1, 'symmetri');

f2 = fspecial('average', [5 5]);
I_blur2 = imfilter(In, f2, 'symmetri');

f3 = fspecial('average', [7 7]);
I_blur3 = imfilter(In, f3, 'symmetri');

f4 = fspecial('average', [9 9]);
I_blur4 = imfilter(In, f4, 'symmetri');

figure('units','normalized','outerposition',[0 0 1 1]);
% subplot(2, 5, 1), imshow(I), title('Original Image');
% subplot(2, 5, 2), imhist(I), title('Hist. Original');
% 
% subplot(2, 5, 6), imshow(In), title('Noisy Image Img');
% subplot(2, 5, 7), imhist(In), title('Hist. Noisy Img');

subplot(2, 5, 1), imshow(I_blur1), title('Averaging with 3x3 kernel');
% subplot(2, 5, 2), imhist(I_blur1), title('Hist. Avg. filter 3x3');
subplot(2,5,2)
SE1   = sum(sum((I-I_blur1).^2));
MSE1  = SE1/numel(I);
RMSE1 = sqrt(MSE1);
PSNR1 = 20*log10(255/RMSE1);
SNR1  = 10*log10(sum(sum(I))/SE1);
% text(0.0,1.0,['Mean Square Error (MSE): ', num2str(MSE1)]), axis off;
% text(0.0,0.9,['Root Mean Square Error (RMSE): ', num2str(RMSE1)]), axis off;
text(0.0,0.8,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR1)]), axis off;
% text(0.0,0.7,['Signal to Noise Ratio(SNR): ', num2str(SNR1)]), axis off;


subplot(2, 5, 4), imshow(I_blur2), title('Averaging with 5x5 kernel');
% subplot(2, 5, 4), imhist(I_blur2), title('Hist. Avg. filter 5x5');
subplot(2,5,5),
SE2   = sum(sum((I_blur1-I_blur2).^2));
MSE2  = SE2/numel(I_blur1);
RMSE2 = sqrt(MSE2);
PSNR2 = 20*log10(255/RMSE2);
SNR2 = 10*log10(sum(sum(I_blur2))/SE2);

% text(0.0,1.0,['Mean Square Error (MSE): ', num2str(MSE1)]), axis off;
% text(0.0,0.9,['Root Mean Square Error (RMSE): ', num2str(RMSE1)]), axis off;
text(0.0,0.8,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR2)]), axis off;
% text(0.0,0.7,['Signal to Noise Ratio(SNR): ', num2str(SNR1)]), axis off;


subplot(2, 5, 6), imshow(I_blur3), title('Averaging with 7x7 kernel');
% subplot(2, 5, 4), imhist(I_blur2), title('Hist. Avg. filter 5x5');
subplot(2,5,7),
SE3   = sum(sum((I_blur2-I_blur3).^2));
MSE3  = SE3/numel(I_blur3);
RMSE3 = sqrt(MSE3);
PSNR3 = 20*log10(255/RMSE3);
SNR3 = 10*log10(sum(sum(I_blur3))/SE3);
text(0.0,0.8,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR3)]), axis off;



subplot(2, 5, 9), imshow(I_blur4), title('Averaging with 9x9 kernel');
% subplot(2, 5, 4), imhist(I_blur2), title('Hist. Avg. filter 5x5');
subplot(2,5,10),
SE4   = sum(sum((I_blur3-I_blur4).^2));
MSE4  = SE4/numel(I_blur4);
RMSE4 = sqrt(MSE4);
PSNR4 = 20*log10(255/RMSE4);
SNR4 = 10*log10(sum(sum(I_blur4))/SE4);
text(0.0,0.8,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR4)]), axis off;

% 
% subplot(2, 5, 5); 
% I = double(I);
% In = double(In);
% I_blur1 = double(I_blur1);
% I_blur2 = double(I_blur2);
% 
% SE1   = sum(sum((I-I_blur1).^2));
% MSE1  = SE1/numel(I);
% RMSE1 = sqrt(MSE1);
% PSNR1 = 20*log10(255/RMSE1);
% SNR1  = 10*log10(sum(sum(I))/SE1);
% text(0.0,1.0,['Mean Square Error (MSE): ', num2str(MSE1)]), axis off;
% text(0.0,0.9,['Root Mean Square Error (RMSE): ', num2str(RMSE1)]), axis off;
% text(0.0,0.8,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR1)]), axis off;
% text(0.0,0.7,['Signal to Noise Ratio(SNR): ', num2str(SNR1)]), axis off;
% 
% subplot(2, 5, 10); 
% SE2   = sum(sum((I-I_blur2).^2));
% MSE2  = SE2/numel(I);
% RMSE2 = sqrt(MSE2);
% PSNR2 = 20*log10(255/RMSE2);
% SNR2  = 10*log10(sum(sum(I))/SE2);
% text(0.0,1.0,['Mean Square Error (MSE): ', num2str(MSE2)]), axis off;
% text(0.0,0.9,['Root Mean Square Error (RMSE): ', num2str(RMSE2)]), axis off;
% text(0.0,0.8,['Peak Signal to Noise Ratio (PSNR): ', num2str(PSNR2)]), axis off;
% text(0.0,0.7,['Signal to Noise Ratio(SNR): ', num2str(SNR2)]), axis off;