clear; clc;

I  = imread('image_test.jpg');

%Load Seed
load('mySeed')
rng(s);
li = randperm(length(I(:)));
ISalt = I;
ISalt(li(1:(end/10)))= 255;  %10% image corrupted by 1 intensity

li = randperm(length(I(:)));
IPepper = I;
IPepper(li(1:(end/10)))=0; %10% image corrupted by 0 intensity

I_fix1 = nlfilter(im2double(ISalt), [3 3], @c_harmonic, -5);
I_fix2 = nlfilter(im2double(IPepper), [3 3], @c_harmonic, 1);

subplot(2, 3, 1), imshow(I);
subplot(2, 3, 2), imshow(ISalt);
subplot(2, 3, 3), imshow(IPepper);

subplot(2, 3, 5), imshow(I_fix1);
subplot(2, 3, 6), imshow(I_fix2);


