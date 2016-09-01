function y2 = highpassim(y, m, n)
% Usage: y = highpassim(y, m, n). High pass filter an image.  Image is in array "y".  The frequencies 1 to m
% in x, 1 to n in y (and symmetric portions) are zeroed out.

s = size(y);
Y = fft2(double(y));
Y(2:m,:)=0.0; Y(s(1)-m+1:s(1))=0.0;
Y(:,2:n)=0.0; Y(:,s(2)-n+1:s(2))=0.0;

y2 = uint8(real(ifft2(Y)));
