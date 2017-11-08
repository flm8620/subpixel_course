u = double(imread('lena.pgm'));
f = fft2(u);
%%
imshow(f);
%%
imshow(abs(f));
%%
imshow(abs(f),[]);
%%
imshow(normsat(abs(f),1));
%%
imshow(normsat(fftshift(abs(f)),1));
%%
f=f/1000;
mag = abs(f);
R = real(f);
I = imag(f);
ang = atan2(I,R);
hue = (ang+pi) / pi / 2;
imcolor = hsv2rgb(hue,ones(size(f)),mag);
imshow(imcolor);