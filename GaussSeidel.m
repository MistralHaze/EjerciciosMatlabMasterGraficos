function PR2()

Ej1()
end

function Ej1()
A=[3,-0.1,-0.2;
    0.1,7,-0.3;
    0.3,-0.2,10];

b=[7.85,-19.3,71.4];
n=3;
GaussSeidel(A,b, n);
end

function GaussSeidel(A,b,n)
k=0;
sumK=0;
sumKminus=0;
x=[0,0,0];
xMinusOne=[0,0,0];
if(k==0)
    for i=1:3
        for j=i+1:n
            sumKminus = sumKminus + A(i,j)*xMinusOne(j); 
        end
        for j=1:(i-1)
             sumK = sumK+ A(i,j)*x(j);
        end
        xMinusOne(i)=x(i);
        x(i)= (b(i)-sumKminus - sumK) /A(i,i);
    end
    k = k +1;
else
end
end

function CalculateSumMinusK(A,i,j,x,sumKminus)
    sumKminus = A(i,j)*x(j); 
end

function CalculateSumK(A,i,j,x, sumK)
    sumK =A(i,j)*x(j);
end