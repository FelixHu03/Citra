I_s = imread('eight_salt.tif');
I2  = ordfilt2(I_s, 1, ones(3, 3));

subplot(1, 2, 1), imshow(I_s), title('Salt Noise');
subplot(1, 2, 2), imshow(I2), title('Min Filter');