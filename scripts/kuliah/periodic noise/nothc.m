clear;
u0 = 64;
v0 = 0;
D1 = distmatrix2(256, 256, u0, v0);
D2 = distmatrix2(256, 256, -u0, -v0);
h = ones(256, 256);
D0 = 16;
idx = (D1 < D0) | (D2 < D0);
h(idx) = 0;

subplot(1, 3, 1), imshow(fftshift(D1), []);
subplot(1, 3, 2), imshow(fftshift(D2), []);
subplot(1, 3, 3), imshow(fftshift(h), []);