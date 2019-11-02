function numeric_resolution()
%Ejercicio 1
%{
    A = [3 -0.1 -0.2;
        0.1 7 -0.3;
        0.3 -0.2 10];
    B = [7.85; 
        -19.3;
        71.4];
%}

%Ejercicio 2 

    A = [5 2 -1 1;
        1 7 3 -1;
        -1 4 9 2;
        1 -1 1 4];
    B = [12; 
        2;
        1;
        3];

    tol = 0.00001;
    
    xG = gauss(A, B, tol);
    xJ = jacobi(A, B, tol);
    
    disp("Gauss sol: ");
    disp(xG.');
    disp("Jacobi sol ")
    disp(xJ.');
end

function xk = jacobi(A, B, tol)

    x0 = zeros(size(B)); 
    xk = zeros(size(B)); 
    error = inf;
    ni = size(A, 2);
    nj = size(B, 1);
    
    iter = 0;
    while (error > tol)
        for (i = 1:ni)
            bi = B(i);
            ax = 0;
            for (j = 1:nj)
                if(j ~= i)
                   ax = ax + A(i, j) * x0(j);
                end
            end
                xk(i) = (bi - ax) / A(i, i);            
        end

        error = max(abs((abs(x0) - abs(xk))));
        iter = iter + 1;
        disp("Jacobi error " + error + " en iter " + iter); 
        
        x0 = xk;
    end
end

function xk = gauss (A, b, tol)
    xk = zeros(size(b));
    x0 = zeros(size(b));
    
    ni = size(A,2);
    nj = size(b,1);
    
    error = inf;
    iter = 0
    while error > tol
        x0 = xk;
        for i=1:ni
            bi = b(i);
            axk = 0;
            axk0 = 0;
            
            for j=1:i-1
               axk = axk + ((A(i ,j)* xk(j)));
            end
            
            for j = i+1:nj
                axk0 = axk0 + ((A(i ,j)* x0(j)));
            end
            
            xk(i) = (bi - axk -axk0)/A(i ,i);
        end
        error = max(abs(abs(x0) -abs(xk)));
        iter = iter + 1;
        disp("Gauss error " + error + " en iter " + iter);   
    end
end
