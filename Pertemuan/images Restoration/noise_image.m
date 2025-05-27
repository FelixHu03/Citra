I = img_circle;
% img_circle  = 640*640 = 409600 pixel
% indeks dari 1 sampai 409600
%Gaussian Noise
rng(123)
mu = 0;
sigma = 0.05;
noiseGauss = random('Normal', mu, sigma, size(I));
InGauss = im2double(I) + noiseGauss;
InGauss = im2uint8(InGauss);

%Salt and Pepper Noise
%20% image corrupted 
%or the density is 0.2
li   = randperm(length(I(:))); 
InSP = I;
InSP(li(1:(end/5))) = 255; %index [1, 81920], 20% pixels is set to 255(white)
InSP(li(1:(end/10)))= 0;


%Rayleigh
%20% image corrupted 
%or the density is 0.2
% % ray = raylcdf(I,1:5,"upper");
ray = random('Rayleigh', 0.25, size(I));
ray = (ray - min(ray(:))) / (max(ray(:)) - min(ray(:))); 
ray = uint8(100 * ray);
Inray = I + ray;


%Gamma Noise
k     = 2; 
%shape parameter, the bigger k, the right and flatter the curve
theta = 0.05; %scale parameter
noiseGamma = random('Gamma', k, theta, size(I));
noiseGamma = im2uint8(noiseGamma);
InGamma    = I + noiseGamma;

% Exponential
expon = random('Exponential',0.5)

% subplot(3,3,1), imshow(I); %biasa

% subplot(3,3,1), imshow(InGauss);
% subplot(3,3,2), imshow(ray);
% % subplot(3,3,3), imshow(InSP);
% % subplot(3,3,4), imhist(InGauss)
% subplot(3,3,5), imhist(InGauss)
% subplot(3,3,6), imhist(ray)

% subplot(2,3,1), imshow(InGauss),
% subplot(2,3,2), imshow(Inray)
% subplot(2,3,3), imshow(InGamma)
% subplot(2,3,4), imhist(InGauss)
% subplot(2,3,5), imhist(Inray)
% subplot(2,3,6), imhist(InGamma)

