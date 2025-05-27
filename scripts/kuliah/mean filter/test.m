clear; clc;

I  = imread('image_test.jpg');

%Load Seed
load('mySeed')
rng(s);
In = imnoise(I,'gaussian',0.1,0.001);

Iart = uint8(nlfilter(In, [3 3], @atmean, 0));
Igeo = uint8(nlfilter(double(In), [3 3], @geometric));

subplot(2, 4, 1), imshow(I);
subplot(2, 4, 2), imshow(In);
subplot(2, 4, 3), imshow(Iart);
subplot(2, 4, 4), imshow(Igeo);

subplot(2, 4, 5), imhist(I);
subplot(2, 4, 6), imhist(In);
subplot(2, 4, 7), imhist(Iart);
subplot(2, 4, 8), imhist(Igeo);


