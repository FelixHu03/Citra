clear;clc
I = imread('cameraman.tif');
In = imnoise(I,'gaussian',0.2,0.01);
I = im2double(I);
I_fix1 = nlfilter(im2double(In), [3 3], @geometric);


subplot(2, 3, 1), imshow(I), title('original');
subplot(2, 3, 2), imshow(In), title('gaussian');
subplot(2, 3, 3), imshow(I_fix1), title('fix');