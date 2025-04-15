% Felix (2327250059)
I = imread('tire.tif');
I2 = imadd(I, 75);
I2_1 = imadd(I, 75);

b = I2 == I2_1;

%figure
%subplot(1,2,1), imshow(I, []), title('Original Image');
%subplot(1,2,2), imshow(I2,[]), title('Brighter Image');

min_I = min(I(:));
max_I = max(I(:));

%Felix 2327250059
Ia = imread('rice.png');
Ib = imread('cameraman.tif');
Ic = imadd(Ia,Ib);
%figure
%imshow(Ic);
clear; clc;
%Felix 2327250059
I = imread('cameraman.tif');
J = imread('cameraman2.tif');
%figure
%subplot(1,2,1), imshow(I), title('Original Image');
%subplot(1,2,2), imshow(J), title('Altered Image');

%Felix 2327250059
diffim = imsubtract(I, J);
%figure
%subplot(2,2,1),imshow(diffim), title('Subtracted Image')
%Felix 2327250059
diffim2 = imabsdiff(I,J);
%subplot(2,2,1),imshow(diffim2), title('Abs DIff Image')
% Felix 2327250059
%figure
%subplot(2,2,1),imshow(diffim, []), title('Subtracted Image Scaled')
%subplot(2,2,2),imshow(diffim2, []), title('Abs DIff Image Scaled')

%Felix 2327250059
K = imread('burungGaruda.jpg');
%imsubtract(I, K);

clear; clc;

%Felix 2327250059
I = imread('moon.tif');
I2 = imadd(I, 50);
I3 = immultiply(I,1.2);
%figure
%subplot(1,3,1), imshow(I), title('Original Image');
%subplot(1,3,2), imshow(I2), title('Normal Brightening');
%subplot(1,3,3), imshow(I3), title('Dynemic Scaling');

clear; clc;

%Felix 2327250059
I = im2double(imread('earth1.tif'));
J = im2double(imread('earth2.tif'));
K = immultiply(I,J);
%figure
%subplot(1,3,1), imshow(I), title('Planet Image');
%subplot(1,3,2), imshow(J), title('Gradient');
%subplot(1,3,3), imshow(K), title('3D Planet');
clear; clc;
%Felix 2327250059
I = imread("moon.tif");
I2 = imdivide(I,2);
% figure
% subplot(1,2,1), imshow(I), title('Original Image');
% subplot(1,2,2), imshow(I2), title('DarkerImage w/ Devision');
% Felix 2327250059
I3 = immultiply(I, 0.5);
% figure
% subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I2), title('Darker Image w/ Devision');
% subplot(2,2,3), imshow(I3), title('Darker Image w/ Multiplication');
% Felix 2327250059
i = imread('assets/images/burungGaruda.jpg');
i2 = immultiply(i,0.5);
i3 = imdivide(i,2);
i4 = immultiply(i,0.25);
i5 = imdivide(i,4);
% figure
% subplot(3,3,2), imshow(i), title('original'); 
% subplot(3,3,4), imshow(i2), title('darker image with immultiply'); 
% subplot(3,3,6), imshow(i3), title('darker image with imdivide');
% subplot(3,3,7), imshow(i4), title('darker image with immultiply'); 
% subplot(3,3,9), imshow(i5), title('darker image with imdivide');

clear; clc;
% Felix 2327250059
notext = imread('gradient.tif');
text = imread("gradient_with_text.tif");
% figure, imshow(text), title('Original Image');
% Felix 2327250059
level = graythresh(text);
bw = im2bw(text, level);
% figure,imshow(bw)

% Felix 2327250059
% fixed = imdivide(text, notext);
% subplot(1,3,1), imshow(text), title('Original Image');
% subplot(1,3,2), imshow(notext), title('Background only');
% subplot(1,3,3), imshow(fixed, []), title('divided Image');

% Felix 2327250059
notext2 = imread('test.png');
text2 = imread("testbg.png");
notext2 = imresize(notext2, size(text2(:,:,1)));
fixed2 = imdivide(text2,notext2);
subplot(1,3,1), imshow(text2), title('Original Image');
subplot(1,3,2), imshow(notext2), title('Background only');
subplot(1,3,3), imshow(fixed2, []), title('divided Image');