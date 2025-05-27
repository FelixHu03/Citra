clear; clc;
%Original Image
img = imread('cameraman.tif');

%Periodic Noise
Fs = 128;
dt = 1/Fs;
N  = 2*Fs;
t  = (0:N-1)*dt;
[xt, yt] = meshgrid(t);

tht = [0 45 90 135];
r = 20;
noise = zeros(256);
for i=1:numel(tht)
    theta = (tht(i)/180)*pi;
    fx = round(r*cos(theta));
    fy = round(r*sin(theta));
    noise = noise + 10*sin(2*pi*(fx*xt+fy*yt));
    subplot(2, 2, i); imshow(noise);
end

%Noisy Image
imgn = double(img) + 2*noise;
imgn = imgn./max(max(imgn));
imgn = im2uint8(imgn);

D = distmatrix(256, 256);
D0 = 40;
W  = 10;

%Ideal Band Reject Filter
h1      = ones(size(D));
idx     = (D >= D0 - W/2) & (D <= D0 + W/2);
h1(idx) = 0;

%Butterworth Band Reject Filter
n  = 20;
D02= 40;
W2 = 85;
h2 = 1./(1 + ((D*W2)./(D.^2 + D02^2)).^(2*n));
% h2 = h2./max(max(h2));

%Butterworth Band Reject Filter
h3 = 1 - exp(-0.5*((D.^2 - D0^2)./(D*W)).^2);

%Fourier Transform
Fimg   = fft2(img);
Fnoise = fft2(noise);
Fimgn  = fft2(imgn);

figure;
subplot(1, 3, 1); imshow(fftshift(log(1+abs(Fimg))),[]);
subplot(1, 3, 2); imshow(fftshift(log(1+abs(Fnoise))),[]);
subplot(1, 3, 3); imshow(fftshift(log(1+abs(Fimgn))),[]);

%Ideal Band Reject Filtering
Ft1 = h1.*Fimgn;
%Butterworh Band Reject Filtering
Ft2 = h2.*Fimgn;
%Gaussian Band Reject Filtering
Ft3 = h3.*Fimgn;

%Image Filtering
imgF1 = ifft2(Ft1);
imgF1 = imgF1./max(max(imgF1));
imgF1 = im2uint8(imgF1);

imgF2 = ifft2(Ft2);
imgF2 = imgF2./max(max(imgF2));
imgF2 = im2uint8(imgF2);

imgF3 = ifft2(Ft3);
imgF3 = imgF3./max(max(imgF3));
imgF3 = im2uint8(imgF3);

figure;
subplot(3, 3, 1), imshow(fftshift(h1)), title('Ideal Band Reject Filter');
subplot(3, 3, 2), imshow(fftshift(h2)), title('Butterworth Band Reject Filter');
subplot(3, 3, 3), imshow(fftshift(h3)), title('Gaussian Band Reject Filter');

subplot(3, 3, 4), imshow(fftshift(log(1+abs(Ft1))),[]), title('Ideal Band Reject Filtering');
subplot(3, 3, 5), imshow(fftshift(log(1+abs(Ft2))),[]), title('Butterworth Band Reject Filtering');
subplot(3, 3, 6), imshow(fftshift(log(1+abs(Ft3))),[]), title('Gaussian Band Reject Filtering');

subplot(3, 3, 7), imshow(imgF1), title('Ideal Band Reject Result');
subplot(3, 3, 8), imshow(imgF2), title('Butterworth Band Reject Result');
subplot(3, 3, 9), imshow(imgF3), title('Gaussian Band Reject Result');