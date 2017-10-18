function [v] = gradn(u)
[M,N] = size(u);
dx = u(1:M-1,2:N)-u(1:M-1,1:N-1);
dy = u(2:M,1:N-1)-u(1:M-1,1:N-1);
v = dx.^2+dy.^2;
v = sqrt(v);
end

