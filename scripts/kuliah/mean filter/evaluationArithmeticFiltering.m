clear; clc; 

I  = imread('eight.tif');
In = imnoise(I,'gaussian',0.0,0.001);

for i=1:20
    s(i)      = 2*i+1; %s = (2*(i+1)-1);
    f         = fspecial('average', s(i));
    Ir(:,:,i) = imfilter(In, f, 'symmetri');
    SE        = sum(sum((double(I)-double(Ir(:,:,i))).^2));
    MSE       = SE/numel(I);
    RMSE      = sqrt(MSE);
    PSNR(i)   = 20*log10(255/RMSE);
    SNR(i)    = 10*log10(sum(sum(I))/SE);
end
[maxVal1, idx1] = max(PSNR);
[maxVal2, idx2] = max(SNR);
subplot(2,2,1),imshow(I),title('Original Image');
subplot(2,2,2),imshow(In),title('Noisy Image');
subplot(2,2,3),imshow(Ir(:,:,idx2)),...
    title(['Restored Image with kernel ', num2str(s(idx2)),' x ', num2str(s(idx2))]);
subplot(2,2,4), 
plot(s,PSNR,'r'), hold on, plot(s,-SNR, 'b'), grid on, ...
    xlabel('Kernel x by x'), ylabel('value'), ...
    legend('PSNR', 'Negative SNR'), title('Evaluation');
