clear; clc;
 
%signal sampling fit
Fs = 20;             %Sampling rate (Hz)     [sample/sec]
dt = 1/Fs;           %delta t                          [time interval (sec)] 
N  = 1*Fs;          %Sampling number       [number of samples]
t  = (0:N-1)*dt;    %time(s)                        [time for each sample]
 
%The signal
A = 1;                 %Amplitude
n = 1;                 %scale of Frequency
F = 1;             %Frequency
theta = 0*pi;      %phase
xt = 1 + 4*cos(2*pi*3*F*t) + 5/7*sin(2*pi*4*F*t) + 3*sin(2*pi*6*F*t) + 10*sin(2*pi*F*t) + 8*cos(2*pi*15*F*t);
% xt = 2 + 2*cos(2*pi*F*t)+ 4*sin(2*pi*F*t) - 2*sin(6*pi*F*t);
stem(t, xt); hold on; plot(t, xt);
xlabel('Time (s)'); ylabel('Amplitude');
