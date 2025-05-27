clear; clc;

% Felix 2327250059
I = imread('blobs.png');
% figure, imshow(I), title('Original Image');

% Felix 2327250059
SE_1 = strel('square',3);

% Felix 2327250059
I_dil_1 = imdilate(I,SE_1);
% figure, imshow(I_dil_1), title('Dilated with 3x3');

% Felix 2327250059
SE_2 = strel('rectangle', [1 7]);
I_dil_2 = imdilate(I, SE_2);
% figure, imshow(I_dil_2), title('Dilated with 1x7');

% Felix 2327250059
SE_3 = strel('rectangle', [7 1]);
I_dil_3 = imdilate(I, SE_3);
% figure, imshow(I_dil_3), title('Dilated with 7x1');

% Felix 2327250059
SE_4 = strel('line', 5, 180);
I_dil_4 = imdilate(I, SE_4);
% figure, imshow(I_dil_4), title('Tes');


% Felix 2327250059
I_ero_1 = imerode(I, SE_1);
% figure, imshow(I), title('Original Image');
% figure, imshow(I_ero_1), title('Eroded with 3x3');

% Felix 2327250059
I_ero_2 = imerode(I, SE_2);
% figure, imshow(I_ero_2), title('Eroded with 1x7');

% Felix 2327250059
I_open_1 = imopen(I, SE_1);
% figure, imshow(I), title('Original Image');
% figure, imshow(I_open_1), title('Opening the image');


% Felix 2327250059
% figure, subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_ero_1), title('Result of Erosion');
% subplot(2,2,3), imshow(I_open_1), title('Result of Opening (3x3)');

% Felix 2327250059
I_open_2 = imopen(I, SE_2);
% subplot(2,2,4), imshow(I_open_2), title('Result of Opening (1x7)');

% Felix 2327250059
SE_3 = strel('square',5);
I_clo_1 = imclose(I, SE_3);
% figure, imshow(I), title('Original Image');
% figure, imshow(I_clo_1), title('Closing the image');

% Felix 2327250059
% figure, imshow(I), title('Original Image');
% figure, imshow(I_dil_1), title('Dilating the image');
% figure, imshow(I_clo_1), title('Closing the image');


% Felix 2327250059
SE1 = [ 0 0 0 0 0 ;
        0 0 0 0 0 ;
        0 1 1 0 0 ;
        0 0 1 0 0 ;
        0 0 0 0 0 ];
SE2 = [ 0 0 0 0 0 ;
        1 1 1 1 0 ;
        0 0 0 1 0 ;
        0 0 0 1 0 ;
        0 0 0 1 0];

% Felix 2327250059
I_hm = bwhitmiss(I,SE1,SE2);
% figure, imshow(I), title('Original Image');
% figure, imshow(I_hm), title('Hit-or-miss operation');

% Felix 232725059
interval = [ 0 0 0 0 0;
            -1 -1 -1 -1 0;
            0 1 1 -1 0;
            0 0 1 -1 0;
            0 0 0 -1 0];

% Felix 2327250059
I_hm2 = bwhitmiss(I,interval);
figure, imshow(I_hm), title('Using two SEs');
figure, imshow(I_hm2), title('Using interval');
