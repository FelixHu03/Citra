clear; clc;

% Felix 2327250059
a = [0 0 0 1 0 0 0];
f = [1 2 3 4 5];

% Felix 2327250059
g = imfilter(a,f,'same','conv'); % kernel dibalik secara x dan y

% Felix 2327250059
h = imfilter(a,f,'full','corr'); % kernel tidak dibalik

% Felix 2327250059
clear; clc;
x = [140 108 94; 89 99 125; 121 134 221];
y = [-1 0 1 ; -2 0 2; -1 0 1];
z = imfilter(x,y,'corr');
z2 = imfilter(x,y,'conv');