clear;
D = distmatrix(256, 256);

%Ideal Band Reject Filter
D0      = 40;
W       = 10;
h1      = ones(size(D));
idx     = (D >= D0 - W/2) & (D <= D0 + W/2);
h1(idx) = 0;

%Butterworth Band Reject Filter
D0 = 40;
W  = 10;
n  = 3;
h2 = 1./(1 + ((D*W)./(D.^2 + D0^2)).^(2*n));

%Gaussian Band Reject Filter
D0 = 40;
W  = 10;
h3 = 1 - exp(-0.5*((D.^2 - D0^2)./(D*W)).^2);

subplot(1, 3, 1), imshow(fftshift(h1),[]), title('Ideal Band Reject Filter');
subplot(1, 3, 2), imshow(fftshift(h2),[]), title('Butterworth Band Reject Filter');
subplot(1, 3, 3), imshow(fftshift(h3),[]), title('Gaussian Band Reject Filter');


