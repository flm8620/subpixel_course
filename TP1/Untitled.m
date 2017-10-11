%%
r = 0:0.01:10;
D = 1;
f = 1;
lambda = 1;
c=pi*pi *D.^4/ 32/f/f;

%%
K = c* (2*besselj(1,r)./r).^2;
a = 5;
b=0.01;
[X,Y] = meshgrid((-a:b:a)+0.01,(-a:b:a+0.01));
R = sqrt(X.^2+Y.^2)*D*pi/lambda/f;
rho = sqrt(X.^2+Y.^2);
K_f = (acos(rho) - rho.*sqrt(1-rho.*rho)).*(rho<1);
Im = c*(2*besselj(1,R)./R).^2;

figure(1);
subplot(2,1,1)
plot(r,min(K,0.01))
subplot(2,1,2);
plot(r,K);

figure(2);
imshow(min(Im,0.01),[])
figure(3);
imshow(abs(fftshift(fft2(Im))),[])
figure(4);
imshow(real(K_f),[])