clear; clc;

% Felix 2327250059
I = imread('lenna.tif');
% figure, subplot(2,2,1), imshow(I), title('Original Image');

% Felix 2327250059
[I_prw1,t1] = edge(I,'prewitt');
% subplot(2,2,2), imshow(I_prw1), title('Prewitt, default thresh');

% Felix 2327250059
I_noise = imnoise(I,'gaussian');
[I_prw2,t2] = edge(I_noise,'prewitt');
% subplot(2,2,3), imshow(I_noise), title('Image w/ noise');
% subplot(2,2,4), imshow(I_prw2), title('Prewitt on noise');
% Felix 2327250059
edge2 = edge(I_noise, 'prewitt', 0.15);
% imshow(edge2);


% Felix 2327250059
[I_sob1,t1] = edge(I,'sobel');
% figure, subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_sob1), title('Sobel, default thresh');
% Felix 2327250059
[I_sob2,t2] = edge(I_noise,'sobel');
% subplot(2,2,3), imshow(I_noise), title('Image w/ noise');
% subplot(2,2,4), imshow(I_sob2), title('Sobel on noise');


% Felix 2327250059
I_sob3 = edge(I,'sobel','nothinning');
% figure, subplot(1,2,1), imshow(I_sob1), title('Thinning');
% subplot(1,2,2), imshow(I_sob3), title('No Thinning');

% Felix 2327250059
[I_sob4,t,I_sobv,I_sobh] = edge(I,'sobel');
% figure
% subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_sob4), title('Complete Sobel');
% subplot(2,2,3), imshow(abs(I_sobv),[]), title('Sobel Vertical');
% subplot(2,2,4), imshow(abs(I_sobh),[]), title('Sobel Horizontal');


% Felix 2327250059
I_sobv_bin = abs(I_sobv) > t;
I_sobh_bin = abs(I_sobh) > t;
% subplot(2,2,3), imshow(I_sobv_bin), title('Sobel Vertical (Binary)');
% subplot(2,2,4), imshow(I_sobh_bin), title('Sobel Horizontal (Binary)');


% Felix 2327250059
I_rob1 = edge(I,'roberts');
% figure
% subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_rob1), title('Roberts, default thresh');


% Felix 2327250059
[I_rob2,t] = edge(I_noise,'roberts');
% subplot(2,2,3), imshow(I_noise), title('Image w/ noise');
% subplot(2,2,4), imshow(I_rob2), title('Roberts on noise');


% Felix 2327250059
I_log1 = edge(I,'log');
% figure
% subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_log1), title('LoG, default parameters');

% Felix 2327250059
[I_log2,t] = edge(I_noise,'log');
% subplot(2,2,3), imshow(I_noise), title('Image w/ noise');
% subplot(2,2,4), imshow(I_log2), title('LoG on noise');

% Felix 2327250059
I_can1 = edge(I,'canny');
% figure
% subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_log1), title('Canny, default parameters');

% Felix 2327250059
[I_can2,t] = edge(I_noise,'canny', [], 2.5);
% subplot(2,2,3), imshow(I_noise), title('Image w/ noise');
% subplot(2,2,4), imshow(I_can2), title('Canny on noise');

% Felix 2327250059
I = imread('mandrill.tif');
[I_can1,thresh] = edge(I,'canny');
% figure
% subplot(2,2,1), imshow(I), title('Original Image');
% subplot(2,2,2), imshow(I_can1), title('Canny, default parameters');

% felix 2327250059
[I_can2,thresh] = edge(I, 'canny', 0.4);
% subplot(2,2,3), imshow(I_can2), title('Canny, thresh = 0.4');

% Felix 2327250059
[I_can2,thresh] = edge(I, 'canny', 0.08);
% subplot(2,2,4), imshow(I_can2), title('Canny, thresh = 0.08');

% Felix 23272500559
I = imread('mandrill.tif');
I = im2double(I);

% Felix 2327250059
k = zeros(3,3,8);
k(:,:,1) = [-3 -3 5; -3 0 5; -3 -3 5];
k(:,:,2) = [-3 5 5; -3 0 5; -3 -3 -3];
k(:,:,3) = [5 5 5; -3 0 -3; -3 -3 -3];
k(:,:,4) = [5 5 -3; 5 0 -3; -3 -3 -3];
k(:,:,5) = [5 -3 -3; 5 0 -3; 5 -3 -3];
k(:,:,6) = [-3 -3 -3; 5 0 -3; 5 5 -3];
k(:,:,7) = [-3 -3 -3; -3 0 -3; 5 5 5];
k(:,:,8) = [-3 -3 -3; -3 0 5; -3 5 5];


% Felix 2327250059
I_k = zeros(size(I,1), size(I,2), 8);
for i = 1:8
I_k(:,:,i) = imfilter(I,k(:,:,i));
end

% % Felix 2327250059
% figure
% for j = 1:8
% subplot(2,4,j), imshow(abs(I_k(:,:,j)),[]), ...
% title(['Kirsch mask' , num2str(j)]);
% end

% Felix 2327250059
I_kir = max(I_k, [],3);
% figure, imshow(I_kir, []);

% Felix 2327250059
m = 255/ (max(I_kir(:)) - min(I_kir(:)));
I_kir_adj = uint8(m * I_kir);
figure,imshow(I_kir_adj);


% Felix 2327250059
I_gaus = imnoise(I, 'gaussian');
I_k2 = zeros(size(I,1), size(I,2), 8);
for i = 1:8
I_k2(:,:,i) = imfilter(I_gaus,k(:,:,i));
end
I_kir2 = max(I_k2, [],3);
m = 255/ (max(I_kir2(:)) - min(I_kir2(:)));
I_kir_adj2 = uint8(m * I_kir2);
% figure,imshow(I_kir_adj2);

% Felix 2327250059
r = zeros(3,3,8);
r(:,:,1) = [-1 0 1; -2 0 2; -1 0 1];
r(:,:,2) = [0 1 2; -1 0 1; -2 -1 0];
r(:,:,3) = [1 2 1; 0 0 0; -1 -2 -1];
r(:,:,4) = [2 1 0; 1 0 -1; 0 -1 -2];
r(:,:,5) = [1 0 -1; 2 0 -2; 1 0 -1];
r(:,:,6) = [0 -1 -2; 1 0 -1; 2 1 0];
r(:,:,7) = [-1 -2 -1; 0 0 0; 1 2 1];
r(:,:,8) = [-2 -1 0; -1 0 1; 0 1 2];

% Felix 2327250059
I_r = zeros(size(I,1), size(I,2), 8);
for i = 1:8
I_r(:,:,i) = imfilter(I,r(:,:,i));
end
% figure
% for j = 1:8
% subplot(2,4,j), imshow(abs(I_r(:,:,j)),[]), ...
% title(['Robinson mask ', num2str(j)]);
% end


% Felix 2327250059
I_rob = max(I_r,[],3);
figure, imshow(I_kir,[]);