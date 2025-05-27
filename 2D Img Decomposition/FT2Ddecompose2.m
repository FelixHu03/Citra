clear; clc;
img = imread('cameraman.tif');
img = im2double(img);

[M, N] = size(img);
D = distmatrix(M,N);

ft  = fft2(img);
imgn = zeros(size(img));
for i=1:floor(max(D(1,:)))
    idx = (D >= sqrt(2*((i-1)^2))) & (D< sqrt(2*((i)^2)));
%     idx = D < sqrt(2*(i^2));
    H = zeros(M, N);
    H(idx) = 1;
    DFT_filt = H.*ft;
    imgn = imgn + real(ifft2(DFT_filt));
%     imgn = real(ifft2(DFT_filt));
    imgn = imgn./max(max(imgn));
    
    for j=1:10
        for k=1:100
            
        end
    end
    f1 = figure(1);
    set(f1, 'Position', [100 100 500 500 ]);
    imshow(imgn);
    f2 = figure(2);
    set(f2, 'Position', [600 100 500 500 ]);
    imshow(fftshift(log(1+abs(DFT_filt))), []);
end



