img = imread('liftingbody.png');
imgblur = imfilter(img, fspecial("gaussian", 7,3));
imgsharp = imadd(img, imsubtract(img, imgblur));


subplot(2,3,1), imshow(img), title('original')
subplot(2,3,4), histogram(img), title('original')
subplot(2,3,2), imshow(imgblur), title('blurred Image')
subplot(2,3,5), histogram(imgblur), title('blurred Image')
subplot(2,3,3), imshow(imgsharp), title('sharp Image')
subplot(2,3,6), histogram(imgsharp), title('sharp Image')

