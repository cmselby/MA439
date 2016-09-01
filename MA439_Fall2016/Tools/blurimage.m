function y = blurimage(x)
% Usage: y = blurimage(x).  Given a image x, this does a weighted averaging of each pixel with
% neighbors, to blur the image.  Zeros edges.

[m,n] = size(x);
y = zeros(m,n);

y(2:m-1,2:n-1) = 0.5*x(2:m-1,2:n-1)+0.125*(x(1:m-2,2:n-1)+x(3:m,2:n-1)+x(2:m-1,1:n-2)+x(2:m-1,3:n));
y(1,:) = x(1,:);
y(m,:) = x(m,:);
y(:,1) = x(:,1);
y(:,n) = x(:,n);

