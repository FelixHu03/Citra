clear; clc;
% Felix 2327250059
I = imread('cameraman.tif');
% Id = im2double(I);
% ft = fft2(Id);

% Felix 2327250059
% max(ft(:));
% min(ft(:));

% felix 2327250059
% ft_shift = fftshift(ft);
% imshow(ft_shift)

% Felix 2327250059
% figure, subplot(1,2,1), imshow(abs(ft_shift), []),...
%     title('direct remap')
% Felix 2327250059
% imshow(abs(ft_shift));

% felix 2327250059
% subplot(1,2,2), imshow(log(1+abs(ft_shift)), []), ...
%   title('log remap');

% Felix 2232250059
[M, N] = size(I);
D = distmatrix(M,N);
% imshow(D,[])

% Felix 2327250059
D_shift = fftshift(D);
figure, mesh(D_shift)