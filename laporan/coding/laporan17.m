clear; clc;
% Felix 2327250059
I = imread('morph.bmp');
% figure, imshow(I), title('Original image');

% felix 2327250059
se = strel('square',3);
I_ero = imerode(I,se);
I_bou = imsubtract(I,I_ero);
% figure, imshow(I_bou), title('Boundary Extraction');

% Felix 2327250059
I_perim = bwperim(I,8);
% figure, imshow(I_perim), title('Boundary using bwperim');

% Felix 2327250059
I_fill1 = imfill(I,'holes');
% figure, imshow(I_fill1), title('Holes filled');

% Felix 2327250059
% I_fill2 = imfill(I, [50 20]);
% imshow(I_fill2), title('Interactive fill');


% Felix 2327250059
% bwselect(I);

% Felix 2327250059
% hallo = bwselect(I);

% Felix 2327250059
I_label = bwlabel(I);
I_label_rgb = label2rgb(I_label, 'jet', 'k', 'shuffle');
% figure, imshow(I_label_rgb,[]), title('Labeled image');

% Felix 2327250059
I_thin = bwmorph(I,'thin',5);
% figure, imshow(I_thin), title('Thinning, 5 iterations');


% Felix 2327250059
I_thick = bwmorph(I,'thicken',inf);
% figure, imshow(I_thick), title('Thicken, 5 iterations');

% Felix 2327250059
I_skel = bwmorph(I,'skel',Inf);
figure, imshow(I_skel), title('Skeleton of image');
