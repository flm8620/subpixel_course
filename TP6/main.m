u = double(imread('lena.pgm'));
%u=zeros(64,64);
%u(1:32,:)=255;
% u(20,30)=1;
% u=(real(fft2(u))+1)/2*255;
% imshow(u,[]); colorbar;

um = double(u).*contrast(distcenter(u,'n'),[0,0.8,0.85],[1,1,0])/255;
imshow(um);
%%


v3 = um;
vn3 = um;
vf = um;
v5=um;
for i=1:36
    v3 = frot(v3,10,3); 
    v5 = frot(v5,10,3); 
    vn3 = frot(vn3,10,-3); 
    vf = fftrot(vf,10);
    fprintf('%d\n', i);
end
%flip2(v2,v);
%%
imshow([vn3,v3,v5, vf; vn3-um,v3-um,v5-um, vf-um],[]);
title('rotation of: keys 3 ; spline 3, spline 5, fftrot')
cmap=[gray];
colormap(gca,cmap);
colorbar;
%%
v=um;
fm=[];
fm(:,:,1) = fftshift(fft2(v));
for i=1:36
    v=frot(v,10,-3);
    fm(:,:,i+1) = fftshift(fft2(v));
    fprintf('%d\n', i);
end
%%
cmview(fm);

%%
imshow([real(fm(:,:,1)-fm(:,:,37)), real(fm(:,:,1))],[0,100]);
title('diff of fft2(lena) and fft2(rotation(lena))')
cmap=[gray];
colormap(gca,cmap);
colorbar;
