I = imread('coins.png');
I_g = imnoise(I,'gaussian',0,0.001);
midpoint = inline('0.5 * (max(x(:)) + min(x(:)))');
I_filt = nlfilter(I_g,[3 3],midpoint);
figure
subplot(1,2,1), imshow(I_g), title('Gaussian Noise');
subplot(1,2,2), imshow(I_filt), title('Midpoint Filter');