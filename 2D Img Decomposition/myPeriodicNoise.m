clear; clc;

Fs = 256;
dt = 1/Fs;
N  = 1*Fs;
t  = (0:N-1)*dt;

[xt, yt] = meshgrid(t);

noise = sin(2*pi*(0*xt+20*yt));

% noise = 10*sin(2*pi*(0*xt+20*yt)) + ...
%         10*sin(2*pi*(20*xt+0*yt)) + ...
%         10*sin(2*pi*(10*xt+10*yt))+ ...
%         10*sin(2*pi*(10*xt-10*yt))+ ...
%         0;

img = imread('cameraman.tif');
imgn= double(img) + 1*noise;
imgn= imgn./max(max(imgn));
    
Noise = fft2(noise);
Imgn  = fft2(imgn);

subplot(2, 2, 1), imshow(noise,[]);
subplot(2, 2, 2), imshow(fftshift(log(1+abs(Noise))),[]);
subplot(2, 2, 3), imshow(imgn);
subplot(2, 2, 4), imshow(fftshift(log(1+abs(Imgn))),[]);
