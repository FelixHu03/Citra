% x = [140, 150, 150, 140, 140]; % horizontal (kiri ke kanan) menghasilkan 
% y = [140, 140, 150, 150, 140]; % vertical (atas ke bawah)
% % x dan y menghasilkan nilai 1 atau berwarna putih
% bw = roipoly(300,300,x,y); % harus mulai searah arah jam dan ditutup Kembali 
% figure
% imshow(bw)

% %Felix 2327250059
% x = [50 250 250]; 
% y = [50 50 250 ];
% 
% x(4) = 50;
% y(4) = 250;

% bw = roipoly(300, 300, x, y);
% figure
% imshow(bw);
% 
% %Felix 2327250059
% x(3) = [];
% y(3) = [];
% bw = roipoly(300, 300, x, y);
% figure;
% imshow(bw);

clear; clc;
% Felix 2327250059
I = imread('pout.tif');
x = [50, 200, 200, 50];  
y = [200, 200, 100, 100];  

bw = roipoly(I, x, y);
bw2 = uint8(bw) * 255; 

% imshow(bw2);
bw3 = im2uint8(bw);



bw_cmp = bitcmp(bw2); 
% Pastikan ukuran bw_cmp sama dengan I
bw_cmp = imresize(bw_cmp, size(I));

% figure
% subplot(1,2,1), imshow(bw2), title('Original Mask');
% subplot(1,2,2), imshow(bw_cmp), title('Complemented Mask');

%Felix 2327250059
I3 = bitor(I, bw_cmp);
I4 = bitor(I,bw2);
% figure, imshow(I4);


% Felix 2327250059
bw_cmp2 = imcomplement(bw2);
imshow(bw_cmp2)

%felix 2327250059
isEqual = isequal(bw_cmp2, bw_cmp);
disp(isEqual);
 clear; clc;

% Felix 2327250059
I = imread('cameraman.tif');
I2 = imread('cameraman2.tif');
I_xor = bitxor(I, I2);

% figure
% subplot(1,3,1), imshow(I), title('Image 1');
% subplot(1,3,2), imshow(I2), title('Image 2');
% subplot(1,3,3), imshow(I_xor, []), title('Xor Image');

clear; clc;

% Felix 2327250059
% I = imread('burungGaruda.jpg');
% I_adj = imdivide(I, 1.5);
% felix 2327250059
% bw = im2uint8(roipoly(I));
% figure, imshow(bw)

% Felix 2327250059
% bw_cmp = bitcmp(bw);            % mask complement
% roi = bitor(I_adj, bw_cmp);     % roi image
% not_roi= bitor(I, bw);          % non_roi image
% new_img = bitand(roi, not_roi); % generatenew image
% imshow(new_img)                 % display new image

% Felix 2327250059
I = imread('cameraman.tif'); 
I_adj = imdivide(I, 1.5); 
I_adj = im2uint8(I_adj); 


x = [50 150 150 50]; 
y = [50 50 150 150]; 
mask = roipoly(I, x, y); 
bw = im2uint8(mask); 

bw_cmp = bitcmp(bw);

roi = bitor(I_adj, bw_cmp);  
not_roi = bitor(I, bw);      
new_img = bitand(roi, not_roi); 

imshow(new_img);


