clear

%Selección arbitraria de dos números primos p y q
% num=randsample(primes(2^30),2);
% p=num(1); %Número primo p
% q=num(2); %Número primo q
p=23;
q=29;

%ES PRIMO?
if isprime(p)==0||isprime(q)==0
    disp('Los prarámetros p y q deben ser Números Primos')
elseif p<=3||q<=3
    disp('Los prarámetros p y q deben ser mayores a 3')
else
N=p*q; %Hallar el producto N=p×q
Fi=(p-1)*(q-1); %Calcular la función indicador de Euler

%CLAVE PÚBLICA
%Calcular un entero e primo menor que Fi(N) / mcd(e, Fi(N))=1
for i=2:Fi
if gcd(i,Fi)==1 %Comprobación si el módulo es 1
break;
end
end
publica=i %Clave pública es el valor donde se cumple la igualdad.


%CLAVE PRIVADA
a=publica;
b=Fi;
x=[1 0]; %Valor constante de x
y=[0 1]; %Valor constante de y
q=0; r=0; m=0; n=0; %Inicialización de variables
while a~=0 %Lazo hasta encontrar el inverso
q=fix(b/a); %Redondear la división
r=mod(b,a); %Módulo de los números b y a
m=x(2)-q*x(1); %Ecuaciones de Euclides
n=y(2)-q*y(1); %Ecuaciones de Euclides
x(2)=x(1); %Almacenar temporalmente el valor de x(1)
y(2)=y(1); %Almacenar temporalmente el valor de y(1)
x(1)=m; y(1)=n; %Almacenar temporalmente el valor de m y n
b=a; a=r; %Los nuevos b y a serán a y r respectivamente
end
if x(2)>0 %Si el valor obtenido es mayor a 0
privada=x(2) %El inverso es x(2)
else %Si el valor obtenido es menor a 0
privada=x(1)+x(2) %El inverso es x(1)+x(2)
end

msg='lool';

l=length(msg); %Conocer la longitud del mensaje
c=double(msg); %Convertir a decimal los valores de la clave
disp(['El código ASCII de la Clave es: ' num2str(c)]);

%Proceso de cifrado
    powc=sym(c.^publica);
for j= 1:l
cifra(j)=powc(j)-sym(N*fix(sym(powc(j)/N))) %C=M^e mod (N)
%cifra(j)=mod(c(j)^publica,N); %C=M^e mod (N)
end
lol= double(cifra);
%disp(['El código cifrado es: ' num2str(cifra)])

%Proceso de descifrado
powd = sym(cifra.^privada);
for j= 1:l
%dcifra(j)=mod(sym(cifra(j)^privada),N) %M=C^d mod (N)
dcifra(j)= powd(j)-sym(N*fix(sym(powd(j)/N)))  %M=(C^d) mod (N)

end
lel=double(dcifra);
%disp(['El mensaje descifrado es: ' num2str(dcifra)])
fin=char(lel)
end

