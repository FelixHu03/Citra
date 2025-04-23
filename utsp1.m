clear; clc;
img = imread('cameraman.tif');
img_1 = imread('moon.tif');

c0 = 50; c1 = 0.25;
img2 = c1 * img + c0;
img2_eq = histeq(img2,256);
img2_sp = imhistmatch(img2, img, 256);
img2_sp_moon = imhistmatch(img2, img_1, 256);


c0_2 = 75; c1_2 = 0.50;
img3 = c1_2 * img + c0_2;
img3_eq = histeq(img3,256);
img3_sp = imhistmatch(img3, img, 256);
img3_sp_moon = imhistmatch(img3, img_1, 256);

c0_3 = 50; c1_3 = 0.75;
img4 = c1_3 * img + c0_3;
img4_eq = histeq(img4,256);
img4_sp = imhistmatch(img4, img, 256);
img4_sp_moon = imhistmatch(img4, img_1, 256);

subplot(5,6,1), imshow(img), title('camereaman')
subplot(5,6,2), imhist(img), title('histogram')

subplot(5,6,5), imshow(img_1), title('moon')
subplot(5,6,6), imhist(img_1), title('histogram')

subplot(5,6,7), imshow(img2), title('1st scheme')
subplot(5,6,8), imhist(img2), title('histogram')

subplot(5,6,9), imshow(img3), title('2nd scheme')
subplot(5,6,10), imhist(img3), title('histogram')

subplot(5,6,11), imshow(img4), title('3rd scheme')
subplot(5,6,12), imhist(img4), title('histogram')

subplot(5,6,13), imshow(img2_eq), title('1st Histogram eq.')
subplot(5,6,14), imhist(img2_eq), title('histogram')

subplot(5,6,15), imshow(img3_eq), title('2nd Histogram eq.')
subplot(5,6,16), imhist(img3_eq), title('histogram')

subplot(5,6,17), imshow(img4_eq), title('3rd Histogram eq.')
subplot(5,6,18), imhist(img4_eq), title('histogram')

subplot(5,6,19), imshow(img2_sp), title('1st Histogram sp.1')
subplot(5,6,20), imhist(img2_sp), title('histogram')

subplot(5,6,21), imshow(img3_sp), title('2nd Histogram sp.1')
subplot(5,6,22), imhist(img3_sp), title('histogram')

subplot(5,6,23), imshow(img4_sp), title('3rd Histogram sp.1')
subplot(5,6,24), imhist(img4_sp), title('histogram')

subplot(5,6,25), imshow(img2_sp_moon), title('1st Histogram sp. 2')
subplot(5,6,26), imhist(img2_sp_moon), title('histogram')

subplot(5,6,27), imshow(img3_sp_moon), title('2nd Histogram sp. 2')
subplot(5,6,28), imhist(img3_sp_moon), title('histogram')

subplot(5,6,29), imshow(img4_sp_moon), title('3rd Histogram sp. 2')
subplot(5,6,30), imhist(img4_sp_moon), title('histogram')