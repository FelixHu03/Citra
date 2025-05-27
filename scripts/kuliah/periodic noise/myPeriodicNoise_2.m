clear; clc;

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
end

img = imread('cameraman.tif');
imgn= double(img) + 2*noise;
imgn= imgn./max(max(imgn));
    
Noise = fft2(noise);
Imgn  = fft2(imgn);

subplot(2, 2, 1), imshow(noise,[]);
subplot(2, 2, 2), imshow(imdilate(fftshift(log(1+abs(Noise))),ones(4)),[]);
subplot(2, 2, 3), imshow(imgn);
subplot(2, 2, 4), imshow(imdilate(fftshift(log(1+abs(Imgn))),ones(3)),[]);
