u = double(imread('room.pgm'))/255;
imshow(u);

lambda = 3;
v = u(1:lambda:end,1:lambda:end);
w = kron(v,ones(lambda));
[ny,nx] = size(u);
imshow([u,w(1:ny,1:nx)]);