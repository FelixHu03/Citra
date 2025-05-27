clear; clc;
img = imread('cameraman.tif');
img = im2double(img);

[M, N] = size(img);
D = distmatrix(M,N);
 
ft  = fft2(img);
i = 3;
% idx = (D >= sqrt(1*((i-1)^2))) & (D< sqrt(1*(i^2)));
idx = (D >= i-2) & (D< i);
H = zeros(M, N);
H1= zeros(M,N);
H(idx) = 1; 
% H1(idx1)=1;
% 
% subplot(1, 2, 1), imshow(fftshift(H));
% subplot(1, 2, 2), imshow(fftshift(H1));

[row col] = find(H == 1); 
sum = zeros(size(img));
for j=1:size(row,1)
    H1 = zeros(size(H));
    H1(row(j),col(j)) = 1;
    figure(1),
    subplot(2, 8, j), imshow(ifft2(H1.*ft),[]);
    figure(2),
    sum = sum + H1.*ft;
    imshow(ifft2(sum),[]);
end