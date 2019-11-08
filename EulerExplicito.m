function EulerExplicito()
Ej0();
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

function totalSteps = calculateNumberOfSteps(tn, t_end, h)
    totalSteps = ((t_end - tn) / h ) + 1;
end

function f_tnyn = EjFnt(y_n, tn)
    f_tnyn = y_n - tn^2 + 1;
end