% Felix 2327250059
my_images(1).imageName = "Image 1";
my_images(1).width = 256;
my_images(1).height = 256;
% Felix 2327250059
my_images(2).imageName = "Image 2";
my_images(2).width = 128;
my_images(2).height = 128;

% Felix 2327250059
my_images(1);
% Felix 2327250059
my_images(2).imageName;
% Felix 2327250059
num_of_images = prod(size(my_images));
fieldnames(my_images);
class(my_images);
isstruct(my_images)
isstruct(num_of_images)
% Felix 2327250059
fieldnames(my_images);
% Felix 2327250059
isstruct(my_images)
isstruct(num_of_images)
% Felix 2327250059
My_images = rmfield(my_images, 'width');
% Felix 2327250059
% Felix 2327250059
