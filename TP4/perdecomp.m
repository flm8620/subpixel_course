function [p,s] = perdecomp(u)
%------------------------------ PERDECOMP ------------------------------
%       Periodic plus Smooth Image Decomposition
%
%               author: Lionel Moisan
%
%   This program is freely available on the web page
%
%   http://www.mi.parisdescartes.fr/~moisan/p+s
%
%   I hope that you will find it useful.
%   If you use it for a publication, please mention 
%   this web page and the paper it makes reference to.
%   If you modify this program, please indicate in the
%   code that you did so and leave this message.
%   You can also report bugs or suggestions to 
%   lionel.moisan [AT] parisdescartes.fr
%
% This function computes the periodic (p) and smooth (s) components
% of an image (2D array) u
%
% usage:    p = perdecomp(u)    or    [p,s] = perdecomp(u)
%
% note: this function also works for 1D signals (line or column vectors)
%
% v1.0 (01/2014): initial Matlab version from perdecomp.sci v1.2

  [ny,nx] = size(u); % size of image
  u = double(u);
  X = 1:nx; Y = 1:ny;
  v = zeros(ny,nx); % construct image v which is a intermediate result in the proof
    
  % construct the part v1, calculate difference between top and bottom line
  % and put them in v1
  v(1,X)  = u(1,X)-u(ny,X); 
  v(ny,X) = -v(1,X);
  
  % construct the part v2, calculate difference between left and right
  % column, and put them in v2
  v(Y,1 ) = v(Y,1 )+u(Y,1)-u(Y,nx);
  v(Y,nx) = v(Y,nx)-u(Y,1)+u(Y,nx);
  
  % fx and fy are two terms in the denominater of cosine
  % we use repmat to generate a grid of values for all (p,q)
  fx = repmat(cos(2.*pi*(X -1)/nx),ny,1);
  fy = repmat(cos(2.*pi*(Y'-1)/ny),1,nx);
  
  % fx(1,1)=fy(1,1)=1 by default, lead to division by zero in
  % fft2(v)*0.5./(2.-fx-fy), while fft2(v)(1,1) should be zero anyway
  % because fft2(v)(1,1) = \sum v(p,q) = 0, we will have a 0/0 in this case
  % so just modified fx(1,1) to avoid this, without changing anything
  fx(1,1)=0.;   % avoid division by 0 in the line below
  
  % we know fft2(p) = fft2(u) - fft2(v)/(-4+2*fx+2*fy)
  % so p = u - ifft2( fft2(v)/(-4+2*fx+2*fy) )
  % and fft2(p)(1,1) should be equal to fft2(u)(1,1), which is solved by
  % the above trick
  s = real(ifft2(fft2(v)*0.5./(2.-fx-fy)));
  p = u-s;
  
