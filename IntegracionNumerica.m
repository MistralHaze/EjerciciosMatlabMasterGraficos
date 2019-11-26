function IntegracionNumerica()
a=0;
b=2*pi;

% Plot f(x) and show the real value on the terminal
x = a:0.01:b;
plot(x, cos(x.^2 -1));
res =trapz(x, cos(x.^2 -1));
fprintf('el area aproximada es de %f \n', res);


Rectangulo(a,b);
Trapecio(a,b);
Simpson1_3(a,b);
end

function Rectangulo(a,b)
extremo_izq= Fun(a)*(b-a);  
extremo_der= Fun(b)*(b-a);
punto_medio=Fun((a+b)/2)*(b-a);
fprintf('punto izq %f \npunto centro %f \npunto der %f\n', extremo_izq, extremo_der, punto_medio);
end

function Trapecio(a,b)
fa=Fun(a);
fb=Fun(b);
trapecio = ((b-a)/2)* (fa + fb);
fprintf('el area del trapecio es %f \n', trapecio);
end

function Simpson1_3(a,b)
c = [1,4,1];
x= [a, (a+b)/2, b];
D=6;
n = 3;
first_part= (b-a)/D;
n_c=0;
for i=1:n
    n_c = n_c + c(i)* Fun(x(i));
end
simpson = first_part * n_c;
fprintf('el area por Simpson 1/3 es %f \n', simpson);
end

function fx= Fun(x)
fx= cos(x.^2 -1);
end