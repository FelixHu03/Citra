% This code is to show that histogram can detect noise
%  or qualitative aspect

clear; clc;

img = im2double(imread("cameraman.tif"));
mu = 0;
sigma = 0.05;
noise = random('Normal', mu, sigma, size(img));
nImg = img +noise;
% subplot(2, 3, 1), imshow(img), title('Original');
% subplot(2,3,3), imhist(nImg), title ('noise');
% 
% subplot(2,3,4), histogram(img, 256), title ('Noise');
% subplot(2,3,5), histogram(noise, 256), title ('Noise');
% subplot(2,3,6), histogram(nImg, 256), title ('Noise');


clear; clc;

% brightning image
% img = imread("cameraman.tif");

img = [3 7 6 5 7 8 8 7;
 2 0 4 6 1 3 10 10;
 3 6 5 6 6 9 5 3;
 4 4 3 9 5 5 7 1;
 5 2 3 4 5 2 7 1;
 4 5 0 4 4 5 2 2;
 6 8 8 6 9 9 8 7;
 1 1 4 6 2 5 3 2;
];
bImg = img + 5;

% subplot(2,2,1), imshow(img, []), title("original");
% subplot(2,2,2), imshow(bImg, []), title('brighter');
% subplot(2,2,3), histogram(img, 256), title("original");
% subplot(2,2,4), histogram(bImg, 256), title('brighter');

clear; clc;
% contrast strecthing

img = [3 7 6 5 7 8 8 7;
 2 0 4 6 1 3 10 10;
 3 6 5 6 6 9 5 3;
 4 4 3 9 5 5 7 1;
 5 2 3 4 5 2 7 1;
 4 5 0 4 4 5 2 2;
 6 8 8 6 9 9 8 7;
 1 1 4 6 2 5 3 2;
];
min = min(img(:));
max = max(img(:));
newmin = 0;
newmax = 15;
csImg = (img - min) * (newmax - newmin)/max - min + newmin;

% subplot(2,2,1), imshow(img, [0, 15]), title("original");
% subplot(2,2,2), imshow(csImg, [0, 15]), title('higher contrast');
% subplot(2,2,3), histogram(img, 16), title("original");
% subplot(2,2,4), histogram(csImg, 16), title('higher contrast');

clear;clc;

img = [ 0 1 1 3;
    3 3 2 1 ;
    0 0 2 2 ;
    1 1 3 3;
    ];
min = min(img(:));
max = max(img(:));
newmin = 0;
newmax = 7;
csImg = (img - min) * (newmax - newmin)/max - min + newmin;

% subplot(2,2,1), imshow(img, [0, 7]), title("original");
% subplot(2,2,2), imshow(csImg, [0, 7]), title('higher contrast');
% subplot(2,2,3), histogram(img, 8), title("original");
% subplot(2,2,4), histogram(csImg, 8), title('higher contrast');

% Ekualisasi histogram
