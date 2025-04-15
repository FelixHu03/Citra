% Red Image
img(:, :, 1) = zeros(128,128); %first Image
img(:, :, 2) = ones(128,128); %second Image
img(:, :, 3) = zeros(128,128); %third Image
% green
img2(:, :, 1) = ones(128,128); %first Image
img2(:, :, 2) = zeros(128,128); %second Image
img2(:, :, 3) = zeros(128,128); %third Image

% blue
img3(:, :, 1) = zeros(128,128); %first Image
img3(:, :, 2) = zeros(128,128); %second Image
img3(:, :, 3) = ones(128,128); %third Image

figure
subplot(3,1,1), imshow(img, []), title('g')
subplot(3,1,2), imshow(img2, []), title('r')
subplot(3,1,3), imshow(img3, []), title('b')


imshow(img);