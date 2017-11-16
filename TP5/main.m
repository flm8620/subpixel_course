u = double(imread('crop_bouc.pgm'));

v=fzoom(u,16,1);
v2=fzoom(u,16,0);

for i=1:20
    figure(1);
    imshow(v,[]);
    title('1')
    pause(0.5);
    imshow(v2,[]);
    title('0')
    pause(0.5);
end