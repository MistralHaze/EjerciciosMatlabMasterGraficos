function EulerExplicito()
 fprintf('Ej 1 \n');
 Ej0();
% fprintf('Ej 2 \n');
% Ej1();
end


function Ej0()
h=0.2;
tn=0;
t_end=1;

N =calculateNumberOfSteps(tn, t_end, h);

y= 1:N;
y(1)=0.5;
n=1;

while (tn<t_end)
    
    f_tnyn=EjFnt(y(n), tn);
    y(n+1)= y(n) + h* f_tnyn;
    
    tn = tn + h;
    n = n+1;
    
end

% We now calculate the real y(t)
real_y=0:0.2:1;
func_real_y=(real_y+1).^2 -0.5*exp(real_y);
error= abs(y - func_real_y);
fprintf('Euler %f Real %f Error %f \n', y ,func_real_y, error);

plot(0:h:t_end,y, real_y,func_real_y);
end


function Ej1()
h=0.05;
tn=0.0;
t_end=0.1;

m=10;
B=50;
k=200;

N =calculateNumberOfSteps(tn, t_end, h);

u= 1:N;
u(1)=0;

v= 1:N;
v(1)=1;

n=1;
while (tn<t_end)
%     Calculamos primero para u con el anterior valor de v
    f_tnun= (-B * abs(v(n)) * v(n) -k*u(n))/m;
    
    u(n+1)=u(n) + h* v(n);
    v(n+1)=v(n) + h *f_tnun;
    
    tn = tn + h;
    n = n+1;
    
end
% Draw the plot with the calculated values
% func_u= M*


for i=1:3
fprintf('U%i %f ',i, u(i));
fprintf('V%i %f ',i, v(i));
fprintf('\n')
end
plot(0:h:t_end, u, 0:h:t_end, v);

end

function totalSteps = calculateNumberOfSteps(tn, t_end, h)
    totalSteps = ((t_end - tn) / h ) + 1;
end

function f_tnyn = EjFnt(y_n, tn)
    f_tnyn = y_n - tn^2 + 1;
end