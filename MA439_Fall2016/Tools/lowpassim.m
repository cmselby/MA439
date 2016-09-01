%Low pass filter an image
function y2 = lowpass(y, m, n)

s = size(y);
Y = fft2(y);
Y(m+1:s(1)-m+1,:)=0.0;
Y(:,n+1:s(2)-n+1)=0.0;

y2 = uint8(real(ifft2(Y)));
