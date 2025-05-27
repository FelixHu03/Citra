clear ;clc;
% Felix 2327250059
I = imread('cameraman.tif');
% figure,
% subplot(1,2,1), imshow(I), title('Original Image');

% Felix 23275250059
fn = fspecial('average');

% Felix 2327250059
I_new = imfilter(I,fn);
% subplot(1,2,2), imshow(I_new), title('Filtered Image');

% Felix 2327250059
fn2 = [1 2 1 ; 2 4 2 ; 1 2 1];
fn2 = fn2 * (1/16);

% Felix 2327250059
I_new2 = imfilter(I,fn2);
% figure,
% subplot(1,2,1), imshow(I_new), title('Uniform Average');
% subplot(1,2,2), imshow(I_new2), title('Non-uniform Average')


% Felix 2327250059
fn_gau = fspecial('gaussian', 9,1.5);
% figure, bar3(fn_gau), ...
%     title('gausian filter as a 3D graph')

% Felix 2327250059
I_new3 = imfilter(I, fn_gau);
figure
subplot(1,3,1), imshow(I),title('Original Image')
subplot(1,3,2), imshow(I_new2),title('Average Image')
subplot(1,3,3), imshow(I_new3),title('Gaussian Image')
