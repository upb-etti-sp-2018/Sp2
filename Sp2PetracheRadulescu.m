P=40;
f=1/P;
t=-2*P:0.002:2*P;
D=10;D1=10/40;
N=50;

xi = (1+sawtooth(2*pi*f*t,D1))/2;
g0 = @(t)(1+sawtooth(2*pi*f*t,D1))/2;
cc = 1/P*integral(g0,0,P);
Ck = zeros(1,N);
Ak = zeros(1,N);
xr = 0;

for (i=1:1:N)
   g1 = @(t)(1+sawtooth(2*pi*f*t,D1))/2.*exp(-2*pi*f*t*1j*(i-25));
   Ck(i) = 1/P*integral(g1,0,P);
   Ak(i+1) = 2*abs(Ck(i));
   xr = xr+Ck(i)*exp(2*pi*f*t*1j*(i-25));
end


figure(1);
plot(t,xr,'r',t,xi,'b');
figure(2);
Ak(26)=abs(cc);
Ak(1)=Ak(51);
stem([0:N],Ak,'r')


%In lista de apel echipa noastra are numarul 10 (par, asadar folosim semnal triunghiular).
%Teoria seriilor Fourier arata ca orice semnal periodic se poate aproxima
%printr-o suma infinita de sinusuri si cosinusuri de diferite frecvente,
%fiecare fiind precedat de un coeficient. Coeficientii reprezinta spectrul.
%Semnalul reconstruit (care foloseste N=50 de termeni) se apropie ca forma de
%semnalul original, dar cu o marja de eroare. Marja de eroare e din ce in ce mai
%mica cu cat se mareste numarul de coeficienti ai Seriei Fourier.
