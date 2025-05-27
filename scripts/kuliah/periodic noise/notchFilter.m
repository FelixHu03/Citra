clear;
%Original Image
img = imread('cameraman.tif');

%Periodic Noise
Fs = 128;
dt = 1/Fs;
N  = 2*Fs;
t  = (0:N-1)*dt;
[xt, yt] = meshgrid(t);

tht = [0 45];
r = 20;
noise = zeros(256);
for i=1:numel(tht)
    theta = (tht(i)/180)*pi;
    fx = round(r*cos(theta));
    fy = round(r*sin(theta));
    noise = noise + 10*sin(2*pi*(fx*xt+fy*yt));
end

%Noisy Image
imgn = double(img) + 1*noise;
imgn = imgn./max(max(imgn));
imgn = im2uint8(imgn);

%Fourier Transform
Fimg   = fft2(img);
Fnoise = fft2(noise);
Fimgn  = fft2(imgn);

h = ones(256, 256);
for i=1:2
    %Ideal Band Reject Filter
    u0 = 2*r*sin(tht(i)/180*pi);
    v0 = 2*r*cos(tht(i)/180*pi);
    D1 = distmatrix2(256, 256, u0, v0);
    D2 = distmatrix2(256, 256, -u0, -v0);
    
    D0 = 2;
    idx = (D1 < D0) | (D2 < D0);
    h(idx) = 0;

    subplot(1, 2, i); surface(fftshift(D1));
end

%Notch Filtering
    Ft = h.*Fimgn;

%Image Filtering
imgF = ifft2(Ft);
imgF = imgF./max(max(imgF));
imgF = im2uint8(imgF);

figure;
subplot(3, 3, 1), imshow(img), title('Original Image');
subplot(3, 3, 2), imshow(noise), title('Periodic Noise');
subplot(3, 3, 3), imshow(imgn), title('Noisy Image');

subplot(3, 3, 4), imshow(fftshift(log(1+abs(Fimg))), []), ...
    title('Fourier Trans. Ori. Image');
subplot(3, 3, 5), imshow(imdilate(fftshift(log(1+abs(Fnoise))),ones(5)), []), ...
    title('Fourier Trans. Noise');
subplot(3, 3, 6), imshow(imdilate(fftshift(log(1+abs(Fimgn))), ones(5)), []), ...
    title('Fourier Trans Noisy Image');

subplot(3, 3, 7), imshow(fftshift(h), []), title('Ideal Band Reject Filter');
subplot(3, 3, 8), imshow(imdilate(fftshift(log(1+abs(Ft))),ones(5)), []), ...
    title('Ideal Band Reject Filtering');
subplot(3, 3, 9), imshow(imgF), title('Image Filteting Result');
