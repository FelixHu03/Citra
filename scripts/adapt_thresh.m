function y = adapt_thresh(x)
y = im2bw(x,graythresh(x));

% function y = adapt_thresh(x)
%     if std2(x) < 1
%         y = ones(size(x,1), size(x,2));  % anggap sebagai latar belakang
%     else
%         y = im2bw(x, graythresh(x));     % thresholding objek
%     end
% end
