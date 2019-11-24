function IntegracionNumerica()
a=0;
b=2*pi;

% Plot f(x) and show the real value on the terminal
x = a:0.001:b;
plot(x, cos(x.^2 -1));
res =trapz(x, cos(x.^2 -1));
fprintf('el area real es de %f \n', res);


Rectangulo(a,b);
Trapecio(a,b);
Simpson1_3(a,b);
end

function Rectangulo(a,b)
extremo_izq= Fun(a)*(b-a);  
extremo_der= Fun(b)*(b-a);
punto_medio=Fun((a+b)/2)*(b-a);
% res= extremo_izq+extremo_der+punto_medio;
fprintf('punto izq %f \npunto centro %f \npunto der %f\n', extremo_izq, extremo_der, punto_medio);
end

function Trapecio(a,b)
fa=Fun(a);
fb=Fun(b);
trapecio = ((b-a)/2)* (fa + fb);
fprintf('el area del trapecio es %f \n', trapecio);
end

function Simpson1_3(a,b)
 D=6;
 c = [1,4,1];
 n = 3;
 first_part= (b-a)/D;
 x= [a, (a+b)/2, b];
 n_c=0;
 for i=1:n
     n_c = n_c + c(i)* x(i);
 end
 simpson = first_part * n_c;
 fprintf('el area por Simpson 1/3 es %f \n', simpson);

end

function fx= Fun(x)
fx= cos(x.^2 -1);
end