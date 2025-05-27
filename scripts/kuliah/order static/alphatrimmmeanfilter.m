I = imread('cameraman.tif');
Id = im2double(I);
In = imnoise(Id,'salt & pepper');
In2 = imnoise(In,'gaussian');

I_filt = nlfilter(In2,[5 5],@atmean,6);
figure
subplot(1,3,1), imshow(I), title('Original Image');
subplot(1,3,2), imshow(In2), title('S&P and Gaussian Noise');
subplot(1,3,3), imshow(I_filt), title('Alpha Trimmed Mean');