%Load Image
sat=imread('satellite.jpg');
%Display image:  note that the image is uint8
imshow(sat);
%Get the red part of the image
satred=sat(:,:,1);
figure;
imshow(satred);
title('Original');
%Blur the image:  in order to do "math," need doubles and the routine
%returns an array of double
blurSatRed=uint8(blurimage(satred));
figure;
imshow(blurSatRed);
title('Blurred Once');
bblurSatRed=uint8(blurimage(blurSatRed));
figure;
imshow(bblurSatRed);
title('Blurred Twice');
bbblurSatRed=uint8(blurimage(bblurSatRed));
figure;
imshow(bbblurSatRed);
title('Blurred Three Times');
figure;
title('Comparison')
subplot(1,2,1), imshow(satred), title('Original');
subplot(1,2,2), imshow(bbblurSatRed), title('Blurred Three Times');
%Now to look at adding noise
noisat=noiseim(satred, 20);
figure;
imshow(uint8(noisat));
title('Noisy Image');
filtsat=uint8(highpassim(satred, 20,20));
figure;
imshow(filtsat);
title('High Pass Filter Applied');
lfiltsat=uint8(lowpassim(satred, 20,20));
figure;
imshow(lfiltsat);
title('Low Pass Filter Applied');
%Want to show how the images are indexed
figure;
imshow(sat(1:250, 1:100, :));
title('Subplot');
%close all to close all windows



