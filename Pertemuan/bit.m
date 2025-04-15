img = imread('cameraman.tif'); % 8bit
img2 = ceil((3/255)*img); %2bit
img3 = ceil((63/255) * img); %6bit
img4 = ceil((15/255) *img); %4bit = 2^4

figure
subplot(2,2,1), imshow(img), title("original (8bit)");
subplot(2,2,2), imshow(img2,[]), title("2 bit");
subplot(2,2,3), imshow(img4,[]), title("4 bit");
subplot(2,2,4), imshow(img,[]), title("6 bit");

