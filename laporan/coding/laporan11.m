clear; clc;

% Felix 2327250059
I = imread('moon.tif');
Id = im2double(I);
% figure
% subplot(2,2,1), imshow(Id), title('Original Image');

% Felix 2327250059
f = fspecial('laplacian',0);
I_filt = imfilter(Id, f);
% subplot(2,2,2), imshow(I_filt), title('Laplacianof original')
% Felix 2327250059
% subplot(2,2,3),imshow(I_filt, []),title('Scaled Laplacian')

% Felix 2327250059
I_sharp= imsubtract(Id,I_filt);
% subplot(2,2,4), imshow(I_sharp), title('Sharpened Image')

% Felix 2327250059
f2 = [0 -1 0; -1 5 -1; 0 -1 0];
I_sharp2 = imfilter(Id,f2);
% figure,
% subplot(1,2,1), imshow(Id), title(' Original Image')
% subplot(1,2,2), imshow(I_sharp2), title(' Composite Laplacian')

clear ;clc;

% Felix 2327250059
I = imread('moon.tif');
f_blur= fspecial('average',5);
I_blur = imfilter(I, f_blur);
% figure
% subplot(1,3,1),imshow(I), title('Original Image');
% subplot(1,3,2), imshow(I_blur), title('Blurred Image')

% Felix 2327250059
I_blur_adj = imadjust(I_blur, stretchlim(I_blur), [0 0.4]);

% Felix 2327250059
I_sharp = imsubtract(I,I_blur_adj);

% Felix 2327250059
I_sharp_adj = imadjust(I_sharp);
% subplot(1,3,3), imshow(I_sharp_adj), title('sharp Image')


% Felix 2327250059
I_sharpening = imsubtract(I, I_blur);

% Felix 2327250059
I_sharp2= imadd(I, I_sharpening);
% figure,
% subplot(1,2,1), imshow(I), title('Original Image');
% subplot(1,2,2), imshow(I_sharp2), title('sharp Image')

f_unsharp = -1 * fspecial('average', 3);
f_unsharp(2,2) = f_unsharp(2,2) + 2; 

% Felix 2327250059
I_sharp3 = imfilter(I, f_unsharp);
figure,
% subplot(1,2,1),imshow(I), title('Original Image');
% subplot(1,2,2),imshow(I_sharp3), title('Sharp Image');
 % Felix 2327250059
 f_hb = [0 -1 0; -1 5 -1; 0 -1 0];
 I_sharp4 = imfilter(I, f_hb);
 figure,
 subplot(1,2,1), imshow(I), title('original image');
 subplot(1,2,2), imshow(I_sharp4), title('sharp image')

% Felix 2327250059
f_hb2 = [0 -1 0; -1 7 -1; 0 -1 0];
I_sharp5 = imfilter(I, f_hb2);
I_mult = immultiply(I, 3);
figure, 
subplot(1,3,1), imshow(I), title('Original Image');
subplot(1,3,2), imshow(I_sharp5), title('High Boost, A = 3');
subplot(1,3,3), imshow(I_mult), title('Multiplied by 3');
