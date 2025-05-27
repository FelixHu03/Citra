clear; clc;

Fs = 100;
dt = 1/Fs;
N  = 1*Fs;
t  = (0:N-1)*dt;
T  = (N-1)*dt;

[xt, yt] = meshgrid(0:dt:T);

ft = sin(2*pi*10*xt +2*pi*5*yt);
% s  = sin(2*pi*1*t);

subplot(1, 2, 1); imshow(ft, []);
subplot(1, 2, 2); surf(xt, flipud(yt), ft), xlabel('x'), ylabel('y');
% subplot(1, 3, 3); plot(t, s);