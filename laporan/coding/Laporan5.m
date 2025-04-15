% Felix 2327250059
I1 = imread('cameraman.tif');
sx = 2; sy = 2;
T = maketform('affine', [sx 0 0; 0 sy 0; 0 0 1]);
I2 = imtransform(I1, T);
% imshow(I2), title('Using affine transformmation');
I3 = imresize(I1, 1);
% figure, imshow(I3), title('Using image resizing ');

% question 1
% % Felix 2327250059
% size(I2);imhist(I2);
% % Felix 2327250059
% size(I3); imhist(I3);

clear; clc;

% Felix 2327250059
% I1 = imread('cameraman.tif');
% theta = 35*pi/180;
% xform = [cos(theta) sin(theta) 0; -sin(theta) cos(theta) 0; 0 0 1];
% T = maketform('affine', xform);
% I4 = imtransform(I1,T);
% % imshow(I4), title('Using affine tranfrmation')
% I5 = imrotate(I1, 35);
% figure, imshow(I5), title('Using image roating')

% question 2
% % Felix 2327250059
% size(I4); imhist(I4);
% % Felix 2327250059
% size(I5); imhist(I5);


% Felix 2327250059
I1 = imread('cameraman.tif');
delta_x = 50;
delta_y = 100;
% xform= [1 0 delta_x; 0 1 delta_y; 0 0 1];
xform = [1 0 0; 0 1 0; delta_x delta_y 1];
tform_translate = maketform('affine', xform);
I6 = imtransform(I1, tform_translate, ...
    'XData', [1 (size(I1,2) + xform(3,1))], ...
    'YData', [1 (size(I1,1) + xform(3,2))], ...
    'FillValue', 128); 
% figure, imshow(I6);

% question 3
% Felix 2327250059
% size(I1); imhist(I1);
% % Felix 2327250059
% size(I6); imhist(I6);

clear; clc;

% Felix 2327250059
I1 = imread('cameraman.tif');
sh_x = 2; sh_y = 1.5;
xform = [1 sh_y 0; sh_x 1 0; 0 0 1];
T = maketform('affine',xform);
I7 = imtransform(I1, T);
% imshow(I7)

% felix 2327250059
base = imread('earth1.tif');
unregistered = imread("earth1.tif");

% felix 2327250059
cpselect(unregistered,base)

% felix 2327250059
base_points
input_points

% felix 2327250059
input_points_adj = cpcorr(input_points, base_points, unregistered(:,:,1), base(:,:,1));

% Felix 232750059
% select the type of transformation
mytform1 = cp2tform(input_points, base_points, 'nonreflective similarity');

% Transform the unregistered image
info = imfinfo('earth1.tif');
registered = imtransform(unregistered,mytform1, 'XData', [1 info.width], 'YData',[1 info.height]);