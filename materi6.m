clear; clc;

Fs = 5;                 %jumlah sample dalam satu x(periode) x
dt = 1/Fs;              %jarak antar sample dalam satu periode
T = 2;                  %periode
N = T/dt;               %total jumlah sempel
t = (0:N-1)*dt;         %waktu pengembalian sample
xt = 2+ 3*sin(2*pi*1*t) + 3*sin(8*pi*4*t);

stem(t,xt); hold on, plot(t,xt);
xlabel('Time (s)'), ylabel('Amplitudo');


xt = fft(xt);
magnitude = abs(xt/n);
magnitude1 = abs(1:N/2+1);
magniude1(2:end-1) = 2*magnitude1(2:end-1);

Fmax = Fs/2;
SL = N/2;
df = Fmax/SL;
f1 = (0:5L)*df;

