I= imread("Ayaka 1.jpg");
I2 = imadd(I,75);

figure
subplot(1,2,1), imshow(I), title('Original Image');
subplot(1,2,2), imshow(I2), title('brighterImage')
I
