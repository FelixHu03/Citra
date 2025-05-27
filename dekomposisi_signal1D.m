clear; clc;

Fs = 20;        %jumlah sampel dalam satu x(periode)x
dt = 1/Fs;       %jarak antar sampel dalam satu periode
T  = 1;          %frame
N  = T/dt;       %total jumlah sampel
t  = (0:N-1)*dt; %waktu pengambilan sampel
% xt = 0.5*sin(2*pi*1*t);
% 
 % xt = [4 0.4045 -3.5245 0.1545 3.7061 -0.5 -4.2939 0.1545 4.4755 0.4045 ...
       % -4 -0.4045 3.5245 -0.1545 -3.7061 0.5 4.2939 -0.1545 -4.4755 -0.4045];
% xt = 2 + 2*cos(2*pi*1*t)+ 4*sin(2*pi*1*t) - 2*sin(6*pi*1*t);
xt = 1 + 4*cos(2*pi*3*1*t) + 5/7*sin(2*pi*4*1*t) + 3*sin(2*pi*6*1*t) + 10*sin(2*pi*1*t) + 8*cos(2*pi*15*1*t);

% xt = 0.5*cos(2*pi*3*t-0.5*pi) + 4*cos(2*pi*5*t);
% xt = 2+2*cos(2*pi*1*t) + 4*sin(2*pi*1*t) - 2*sin(2*pi*3*t);
% xt = 1+1/4*sin(2*pi*1*t + 0.3) + 1/8*cos(2*pi*3*t + 0.3);

subplot(3, 3, [1 3]), plot(t,xt), hold on, stem(t, xt);
title('Signal'), axis tight, xlabel('Time (s)'), ylabel('Amplitude'), grid on;

Xt = fft(xt);       %transformasi fourier
magnitude           = abs(Xt/N);
magnitude1          = magnitude(1:N/2+1);
magnitude1(2:end-1) = 2*magnitude1(2:end-1);
phase               = atan(imag((Xt(1:N/2+1)))./real((Xt(1:N/2+1))))*180/pi;

Fmax = Fs/2;
SL   = N/2;
df   = Fmax/SL;
f1   = (0:SL)*df;
    
subplot(3, 3, 4), stem(f1, magnitude1), title('Single-side Magnitude'), ...
    xlabel('Frequency (Hz)'), ylabel('Amplitude'), grid on;
subplot(3, 3, 5), stem(f1, phase), title('Single-side Phase'), ...
    xlabel('Frequency (Hz)'), ylabel('\theta_0'), grid on;

magnitude2              = zeros(size(magnitude));
magnitude2(1:N/2-1)     = magnitude(N/2+2:end);
magnitude2(N/2:N)       = magnitude(1:N/2+1);
f2                      = (-(N/2-1):(N/2))*df;

subplot(3, 3, 6), stem(f2, magnitude2), title('Double-side Magnitude'), ...
    xlabel('Frequency (Hz)'), ylabel('Amplitude'), grid on;

eps = 0.0001;
idx = find(magnitude > eps);

Xt1 = Xt;
Xt1(1)          = 0;
Xt1(idx(2))     = 0;
Xt1(idx(end))   = 0;
xt1 = ifft(Xt1);
subplot(3, 3, 7), plot(t, xt1), title(['Decomposed Signal: F=', num2str(f1(idx(2))), ' Hz']), ...
    xlabel('Time (s)'), ylabel('Amplitude'), grid on;

Xt2 = Xt;
Xt2(1)            = 0;
Xt2(idx(3))       = 0;
Xt2(idx(end-1))   = 0;
xt2 = ifft(Xt2);
subplot(3, 3, 7);
if numel(idx) >= 2
    plot(t, real(xt1));
    title(['Decomposed Signal: F = ', num2str(f1(idx(2))), ' Hz']);
else
    plot(t, real(xt1));
    title('Decomposed Signal: Komponen tidak cukup');
end
xlabel('Time (s)'), ylabel('Amplitude'), grid on;


xt_est =  magnitude(1) + xt1 + xt2;
subplot(3, 3, 9), plot(t, xt_est), title('Signal'), ...
    xlabel('Time (s)'), ylabel('Amplitude'), grid on;
