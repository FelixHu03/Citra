clear; clc;

% Felix 2327250059
J = imread('pout.tif');
I = im2double(J);
clear J ;
% figure,
% subplot(3,2,1), imshow(I), title('Origianl Image')
% subplot(3,2,2), imhist(I), axis tight,...
%     title('Original Histogram')

% Felix 2327250059
const = 0.1;
I2 = I +const;
% subplot(3,2,3), imshow(I2), title('original Image + 0.1')
% subplot(3,2,4), imhist(I2), title('Original Hist. + 0.1')

% Felix 2327250059
const = 0.5;
I3 = I + const;
bad_values = find(I3 > 1);
I3(bad_values) = 1;
% subplot(3,2,5), imshow(I3), title('original Image + 0.5')
% subplot(3,2,6), imhist(I3), title('Original Hist. + 0.5')

% Felix 2327250059
% J = imadjust(I,[low_in ; high_in], [low_out; high_out], gamma);

clc;
% Felix 2327250059
img_limits = stretchlim(I);
I_stretch = imadjust(I, img_limits, []);
% figure,
% subplot(3,2,1), imshow(I), title('Original Image')
% subplot(3,2,2), imhist(I), axis tight, ...
%     title('Original histogram')
% subplot(3,2,3), imshow(I_stretch),...
%     title('Stretched Image')
% subplot(3,2,4), imhist(I_stretch),...
%     title('Stretched Histogram')

% Felix 2327250059
I_stretch2 = imadjust(I);
% subplot(3,2,5),imshow(I_stretch2),...
%     title('Stretched Image')
% subplot(3,2,6),imhist(I_stretch2), axis tight,...
%     title('Stretched Histogram')
I_stretch_diff = imabsdiff(I_stretch, I_stretch2);
% figure,
% imshow(I_stretch_diff,[])
min(I_stretch_diff(:));
max(I_stretch_diff(:));

clear; clc;
% Felix 2327250059
I = imread('westconcordorthophoto.png');
I_shrink = imadjust(I, stretchlim(I),[0.25 0.75]);
% figure,
% subplot(2,2,1), imshow(I), title('Original Image')
% subplot(2,2,2), imhist(I), axis tight,...
%     title('Original Histogram')
% subplot(2,2,3), imshow(I_shrink), title('shrunk Image')
% subplot(2,2,4), imhist(I_shrink), axis tight,...
%     title('shrunk Histogram')
% Felix 2327250059
X = reshape(I, 1, prod(size(I)));
Y = reshape(I_shrink, 1, prod(size(I_shrink)));
% figure,
% plot(X,Y,'.'),
% xlim([0 255]); ylim([0 255]);
% ylabel('Adjusted Image')
% xlabel('Original Image')

% Felix 2327250059
I_shrink = imadjust(I, stretchlim(I),[0.5 0.75],2);
X = reshape(I, 1, prod(size(I)));
Y = reshape(I_shrink, 1, prod(size(I_shrink)));
figure,
subplot(2,2,1), imshow(I), title('Original Image')
subplot(2,2,2), imhist(I), axis tight,...
    title('Original Histogram')
subplot(2,2,3), imshow(I_shrink), title('adjusted Image')
subplot(2,2,4), imhist(I_shrink), axis tight,...
    title('adjusted Histogram')
% Felix 2327250059
figure,
plot(X,Y,'.'), xlim([0 255]); ylim([0 255]);