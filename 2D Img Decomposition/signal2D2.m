clear; clc;

Fs = 100;
dt = 1/Fs;
N  = 1*Fs;
t  = (0:N-1)*dt;
T  = N*dt;

%[xt, yt] = meshgrid(0:dt:T);
[xt, yt] = meshgrid(t);

ft = sin(2*pi*10*xt +2*pi*10*yt);

subplot(2, 2, 1); imshow(ft, []); title('image of periodic function');

subplot(2, 2, 2); surf(xt, flipud(yt), ft); 
colormap gray; %in image y coordinate is upside-down
xlabel('x-axis'); ylabel('y-axis'); 
title('3D graphic of periodic function');

subplot(2, 2, 3); imshow(fftshift(log(1+abs(fft2(ft)))),[]);
title('frequency domain - fourier transform');
subplot(2, 2, 4); imshow(fftshift((ifft2(fft2(ft)))),[]);
title('invers fourier transform');