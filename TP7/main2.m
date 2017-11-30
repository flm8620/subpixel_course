N=6;
s = rand(N,N-4);
L = fliplr(s);
B = flipud(s);
LB = flipud(fliplr(s));
s=[L(:,1:end-1),s; LB(2:end,1:end-1),B(2:end,:)];
s=s./sum(sum(s));


T=s;
for i=1:10
    
    T=conv2(s,T);
end


a = floor(size(T,1)/2);
b = floor(size(T,2)/2);
[X,Y] = meshgrid(-b:b,-a:a);
T=T/max(max(T))*100;
surf(X,Y,T);
hold on;
axis equal
