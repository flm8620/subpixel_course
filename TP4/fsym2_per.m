function v = fsym2_per(u)
%------------------------------ FSYM2 ------------------------------
% Symmetrization of an image along each coordinate
%
% author: Lionel Moisan                                   
% author 2: Leman FENG
% v1.0 (11/2017): first version (LM)
% v1.1 (11/2017): No edge repeat if periodized (Leman)

  v = [u,u(:,end-1:-1:2);u(end-1:-1:2,:),u(end-1:-1:2,end-1:-1:2)];
