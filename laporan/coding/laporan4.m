% Felix 2327250059
i = imread('cameraman.tif');
% imtool(i)

% Felix 2327250059
% i2 = imread('cro')

% Felix 2327250059
x1 = 186; x2 = 211; y1 = 105; y2 = 159;
xmin = x1; ymin = y1; width = x2-x1; height = y2-y1;
i3 = imcrop(i,[xmin ymin width height]);
% imshow(i3);

% Felix 2327250059
i_big1 = imresize(i,3);
% figure 
% imshow(i), title('original image');
% imshow(i_big1), title('enlarged image w/ bicubic interpolation');


% Felix 2327250059
% imtool (i_big1);

% Felix 2327250059
i_big2 = imresize(i,3,'nearest');
i_big3 = imresize(i,3,'bilinear');
% figure, imshow(i_big2), title('Resized w/ nearest-nighborinterpolation');
% figure, imshow(i_big3), title('Resized w/ bilinearinterpolation');

% Felix 2327250059
i_rows = size(i,1);
i_cols= size(i,2);
i_sml = i(1:2:i_rows, 1:2:i_cols);
% figure, imshow(i_sml);

% felix 2327250059
i_sm1_size = imresize(i_sml, 3, 'bilinear');
i_sm1_size2 = imresize(i_sml, 5, 'bilinear');
% imshow(i_sm1_size2);


% felix 2327250059
i_sm2 = imresize(i, 0.5, 'nearest');
i_sm3 = imresize(1, 0.5, 'bilinear');
i_sm4 = imresize(i,0.5, 'bicubic');
% figure
% subplot(1,3,1), imshow(i_sm2), title('nearest-naigbor interpolation');
% subplot(1,3,2), imshow(i_sm3), title('bilinear Interpolation');
% subplot(1,3,3), imshow(i_sm4), title ('bicubic Interpolation');

clear; clc;

% Felix 2327250059
I = imread('cameraman.tif');
J = flipud(I);
K = fliplr(I);
% subplot(1,3,1), imshow(I), title('original image');
% subplot(1,3,2), imshow(J), title('Flipped upside-down');
% subplot(1,3,3), imshow(K), title('Filipped left-right');

clear; clc;

% Felix 2327250059
i = imread('eight.tif');
i_rot = imrotate(i,35);
% imshow(i_rot);


% Felix 2327250059
i_rot2 = imrotate(i,-35);
% imshow(i_rot2);

% Felix 2327250059
I_rot3 = imrotate(i, 35,'bilinear');
% figure, imshow(I_rot3);

%  Felix 2327250059
I_rot4 = imrotate(i,35, 'bilinear', 'crop');
figure, imshow(I_rot4);