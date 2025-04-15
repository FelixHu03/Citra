clear; clc;

% histogram shrinking
img = imread("pout.tif");
shrinked_image = imadjust(img, [0 1], [0.4 0.8]);
% histogram stretching/contrast stretching
% stretcing_image = imadjust(shrinked_image, [0 1], [0 1]);

stretcing_image = histeq(shrinked_image, 256);

subplot(3,3,1), imshow(img), title('original');
subplot(3,3,2), imshow(shrinked_image), title('shrinked');
subplot(3,3,3), imshow(stretcing_image), title('stretching');
subplot(3,3,4), histogram(img,256);
subplot(3,3,5), histogram(shrinked_image, 256);
subplot(3,3,6), histogram(stretcing_image, 256);
subplot(3,3,7), plot(sort(cumsum(imhist(img))));
subplot(3,3,8), plot(sort(cumsum(imhist(shrinked_image))));
subplot(3,3,9), plot(sort(cumsum(imhist(stretcing_image))));