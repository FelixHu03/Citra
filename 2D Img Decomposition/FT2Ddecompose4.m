clear; clc;
img = imread('cameraman.tif');
img = im2double(img);

[M, N] = size(img);
D = distmatrix(M,N);

ft  = fft2(img);
imgn = zeros(size(img));
for i=1:5
    idx = (D >= sqrt(2*((i-1)^2))) & (D< sqrt(2*(i^2)));
    H = zeros(M, N);
    H(idx) = 1;
    
    set(figure(1), 'Position', [10 100 500 500 ]);
    imshow(fftshift(H), []);
    
    [row, col] = find(H == 1);
    number = numel(row);
    for j = 1:number 
        H1 = zeros(size(H));
        H1(row(j),col(j)) = 1;
        set(figure(2), 'Position', [510 100 500 500 ]);
        imshow(ifft2(H1.*ft),[]);
        
        DFT_filt = H1.*ft;
        imgn = imgn + real(ifft2(DFT_filt));
        imgn = imgn./max(max(imgn));
        figure(3),
        set(figure(3), 'Position', [1020 100 500 500 ]);
        imshow(imgn);
    end
end



