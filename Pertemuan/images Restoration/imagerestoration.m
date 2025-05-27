clear; clc;
 
imageSizeX = 640;
imageSizeY = 640;
[columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
 
centerX = 320;%untuk memindahkan bola
centerY = 320;
radius  = 100;
circlePixels = (rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius.^2;
 
img = 70*uint8(circlePixels);
 
square = uint8( zeros(size(img))+50);
square(120:520, 120:520) = 120;
% square = uint8(square);
 
% img_circle = img;
img_circle = mod(img+square, 255);
 
subplot(1, 3, 1), imshow(img_circle);
subplot(1, 3, 2), imhist(img_circle);
subplot(1, 3, 3), surf(img_circle);
% colormap('hot')
 
% save('myCircle', 'img_circle');%unutk di save k evariable
 
%imwrite(img, 'image_test.jpg', 'JPEG');

