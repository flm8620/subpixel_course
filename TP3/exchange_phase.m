function [um,vm] = exchange_phase(u,v)
f1=fft2(u); 
f2=fft2(v);
f1mix=exp(1i*angle(f1)).*abs(f2);
f2mix=exp(1i*angle(f2)).*abs(f1);
um=real(ifft2(f1mix));
vm=real(ifft2(f2mix));
end

