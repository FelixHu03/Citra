 % Felix 2327250059
  x{1} = [1 2 3 ; 4 5 6; 7 8 9];% cell 1 isa matrix
  x{2} = 2+3i; %cell 2 is complex
  x{3} = 'String'; %cell 3 is a string
  x{4} = 1:2:9;%cell 4 is a vactor
  % Felix 2327250059
  x;
   % Felix 2327250059
  celldisp(x);
   % Felix 2327250059
  x(1);
   % Felix 2327250059
  x{1};

  % Felix 2327250059
  x(1) = {[1 2 3 ; 4 5 6; 7 8 9]};

  %Felix 2327250059
  x(3) = 'This produces an error';
  %Felix 2327250059
  x(3) = {'This is okay'};
  %Felix 2327250059
  x{3} = 'This is okay too';
  %Felix 2327250059