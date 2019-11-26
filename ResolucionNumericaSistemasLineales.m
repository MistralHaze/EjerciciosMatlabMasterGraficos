function ResolucionNumericaSistemasLineales()
%  Ej1(1)
 Ej2(2)
end

function Ej1(numEjercicio)
A=[3,-0.1,-0.2;
    0.1,7,-0.3;
    0.3,-0.2,10];

b=[7.85,-19.3,71.4];

tolerancia = 0.001;
fprintf('\n');
fprintf('Ej 1\n');

GaussSeidel(A,b, tolerancia,numEjercicio);
Jacobi(A,b, tolerancia,numEjercicio);
end

function Ej2(numEjercicio)
A=[5,  2,-1, 1;
  1, 7, 3, -1;
  -1, 4, 9, 2;
   1, -1, 1, 4];

b=[12,2,1,3];

tolerancia = 0.001;
fprintf('\n');
fprintf('Ej 2\n');

% GaussSeidel(A, b, tolerancia,numEjercicio);
Jacobi(A,b, tolerancia,numEjercicio);
end

function Jacobi(A,b, tolerancia, numEjercicio)
    fprintf('\n');
    fprintf('Ej %d Jacobi \n', numEjercicio);
    k=0;
    sumK=0;
    sumKminus=0;
    n = size(A,2);

    calculatedError= Inf;

    x=zeros(size(b));
    xMinusOne=zeros(size(b));
    
while (tolerancia < calculatedError)
    for i=1:n
        %Resetear los valores de los sumatorios para que no ensucien los
        %siguientes calculos
        sumKminus=0;
        
        for j=1:n
            if(i~=j)
                sumKminus = sumKminus +  A(i,j)*xMinusOne(j); 
            end
        end
        
        x(i)= (b(i) -sumKminus) /A(i,i);
    end

    k = k +1;
    calculatedError =abs(abs(xMinusOne)-abs(x));
    xMinusOne=x;
    fprintf('X en k = %d :', k);
    fprintf('\n %f', x);
    fprintf('\n');
end
fprintf('SOLUCION Jacobi En  %d iteraciones:', k);
fprintf('\n %f', x);
fprintf('\n');
end
    

function GaussSeidel(A,b, tolerancia, numEjercicio)
fprintf('\n');
fprintf('Ej %d GaussSeidel \n', numEjercicio);

k=0;
sumK=0;
sumKminus=0;
n = size(A,2);

calculatedError= Inf;

x=zeros(size(b));
xMinusOne=zeros(size(b));

while (tolerancia < calculatedError)
    for i=1:n
        
        %Resetear los valores de los sumatorios para que no ensucien los
        %siguientes calculos
        sumK=0;
        sumKminus=0;
        for j=1:(i-1)
             sumK = sumK +  A(i,j)*x(j);
        end
        for j=i+1:n
            sumKminus = sumKminus +  A(i,j)*xMinusOne(j); 
        end
        
        x(i)= (b(i)- sumK -sumKminus) /A(i,i);
    end

    k = k +1;
    calculatedError =abs(abs(xMinusOne)-abs(x));
    xMinusOne=x;
    fprintf('X en k = %d :', k);
    fprintf('\n %f', x);
    fprintf('\n');
end
fprintf('SOLUCION Gauss Seidel En  %d iteraciones:', k);
fprintf('\n %f', x);
fprintf('\n');
end


% function sumKminus = CalculateSumMinusK(A,i,j,x)
%     sumKminus = A(i,j)*x(j); 
% end
% 
% function sumK = CalculateSumK(A,i,j,x)
%     sumK =A(i,j)*x(j);
% end