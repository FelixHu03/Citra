% Felix (2327250059)
2+3;
2*3 + 4*5 + 6*7;

b = 2+3;

% Felix 2327250059
fruit_per_box = 20; num_of_boxes = 5;
total_num_of_fruit = fruit_per_box*num_of_boxes;

% Felix 2327250059
Angka = 5+5;
Angka;

% Felix 2327250059
pi; eps; inf; i;

%Felix 2327250059
A = [ 1 2 3 ; 4 5 6 ; 7 8 9 ];

%Felix 2327250059
B = [1 2 ; 1 2 ;1  5];

%Felix 2327250059
1:5;
%Felix 2327250059
1:1:5;
5:-1:1;

%Felix 2327250059
A = 0 : pi/4 : pi;

%Felix 2327250059
A = [1 2 3 ; 4 5 6; 7 8 9];
%Felix 2327250059
A(:,1);
%Felix 2327250059
A(1, :);

%Felix 2327250059
A = [ 1:3 ; 4:6 ; 7:9];
%Felix 2327250059
B = [1:1:3 ; 4:1:6; 7:1:9];

%Felix 2327250059
colon(1,5)
%Felix 2327250059
linspace(pi/4,pi,4)


%Felix 2327250059
pi/4;
pi/2;
3*pi/4;
pi;

%Felix 2327250059
zeros(3,4)

%Felix 2327250059
ones(3,4)

%Felix 2327250059
ones(3,4)*10;

%Felix 2327250059
rand(3,4)


%Felix 2327250059
randn(3,4)

A = [1 2 3;4 5 6;7 8 9];

%Felix 2327250059
x = [1 2 3]; y = [4 5 6]; z = [7 8 9];
A = [x; y; z];
b = cat(1,x,y,z);

%Felix 2327250059
A =  ones(4,3,2);
B = rand(5,2,3);

%Felix 2327250059
%size(A)
%size(B)

%Felix 2327250059

%disp(A)
%disp(B)


%Felix 2327250059
x = [1 2 -2; 0 -3 4; 7 3 0];
y = [1 0 -1; 2 3 -5; 1 3 5];

%Felix 2327250059
x * y;
%Felix 2327250059
x .* y;

% Felix 2327250059
x = eye(3,4);
y = rand(4,2);
% Felix 2327250059
%x*y;
%y*x;
% Felix 2327250059
y = rand(3,3) *4;
% Felix 2327250059
y_diag =  diag(y);
% Felix 2327250059
y_trace = trace(y);


% Felix 2327250059
y_trace_altenatif = y(1,1) + y (2,2) + y(3,3);
% Felix 2327250059
y_trace_altenatif2 = sum(diag(y)) ;

% Felix 2327250059
y
y_t = y';

% felix 2327250059
y_inv = inv(y);
% felix 2327250059
y * y_inv;
% felix 2327250059
y_inv * y;

%Felix 2327250059
y_det = det(y);