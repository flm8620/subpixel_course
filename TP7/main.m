N=10;
s = rand(1,N)
L = fliplr(s);
s=[L(1:end-1),s];
s=s/sum(s);

n=10;
T=s;
for i=1:10
    T=conv(s,T);
    a = floor(size(T,2)/2);
    plot(-a:a,T,'DisplayName',num2str(i));
    hold on;
end
legend show