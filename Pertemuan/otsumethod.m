% img = imread('cameraman.tif');
% 
% t = graythresh(img);
% 
% bImg = im2bw(img,t);
% 
% bImg2 = im2bw(img, 0.1);
% 
% img2 = [1 2 3; 3 3 0 ; 1 1 2]/3
% bimg2 = im2bw(img2, 0.1);
% 
% imshow(bImg)


% a = [ 0 0 0 0 0 ; 0 1 1 0 0 ; 0 1 1 0 0; 0 0 1 0 0; 0 0 0 0 0];
a = [0 0 0 0; 0 1 1 0; 0 0 0 0];
sel = strel('rectangle',[3 2]);
b = imdilate(a, sel);
