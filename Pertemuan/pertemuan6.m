clear; clc;

img = imread('cameraman.tif');
% Transform image into low contrast
% by rescale the intensity

imgLow = imadjust(img, [0 1], [0.2 0.8]);

subplot(2, 2 ,1), imshow(img), title('original image')
subplot(2,2,2), imshow(imgLow), title('low contras image')
subplot(2,2,3), imhist(img)
subplot(2,2,4), imhist(imgLow)

[frequency, bins] = imhist(img);
[frequency2, bins2] = imhist(imgLow);