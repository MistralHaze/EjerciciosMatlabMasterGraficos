function RaicesNumericasNoLineales()
% Ej 1.0
raizAlAzar=3;
rootByFZero =fzero (@(x) x*sin(0.5 + x^2) + exp(-x) ,raizAlAzar);
fprintf('Por fzero, la raiz de x*sin(0.5 + x^2) + exp(-x) en %f está en %f \n', raizAlAzar, rootByFZero);

%Ej 2.1
biseccion(1,4,(1/100),1);
%Ej 2.2
biseccion(0,4,(1/1000),2);
biseccion(0.5,1,(1/1000),2);
%Ej 2.3
biseccion(0,1,(1/1000),3);
biseccion(1,3,(1/1000),3);
biseccion(3,5,(1/1000),3);
%Ej 2.4
biseccion(0,4,(1/1000),4);

%Ej 2.1
newtonRaphson(1, (1/100), 1);
%Ej 2.2
newtonRaphson(1, (1/1000),2);
newtonRaphson(0.5, (1/1000),2);
%Ej 2.3
newtonRaphson(0.5, (1/1000),3);
newtonRaphson(1.5, (1/1000),3);
newtonRaphson(4, (1/1000),3);
%Ej 2.4
newtonRaphson(1, (1/1000),4);

end

function fx = Fun(x,exerciseNumber)
    switch exerciseNumber
        case 0
          fx= x*sin(0.5 + x^2) + exp(-x);
        case 1
          fx = sin(x)- 0.3*exp(x);
        case 2
          fx = sqrt(x)-cos(x);
        case 3
          fx = 2*x^3 - 11.7*x^2 + 17.7*x - 5;  
        case 4
          fx = exp((1/2)*x) + 5*x -5; 
        otherwise
            fprintf('exercise not found \n');
    end
end

function biseccion(x1, x2, errorThreshold, ejNumber)
    fprintf('Método de la bisección. Ej %d \n', ejNumber);
    A = Fun(x1, ejNumber);
    B = Fun(x2, ejNumber);
    if(A == 0 || B ==0 )
        if(A==0)
             fprintf('la raiz de f(x) se encuentra en %f \n',  A);
        else
             fprintf('la raiz de f(x) se encuentra en %f \n',  B);
        end
    end
   
    calculatedError = Inf;
    nIterations = 0;
    while( errorThreshold <= calculatedError )
        signoIzq = sign(A);
        signoDer = sign(B);
        
        if(signoIzq  ~= signoDer )
           
            xm = (x1+x2)/2;
            if(xm == 0)
                 fprintf('el cero se encuentra en %f \n',  xm );
            else
            xmf = Fun(xm, ejNumber);
            sxm = sign(xmf);
                if(sxm == signoDer)
                    x2 = xm; 
                else
                    x1 = xm;
                end
                A=Fun(x1, ejNumber);
                B=Fun(x2, ejNumber);
                calculatedError = log((x2-x1)/errorThreshold)/log(2);
            end
        end
        nIterations = nIterations+1;
    end
    fprintf('El cero de la funcion se encuentra en el intervalo %f tras n = %d iteranciones \n', xm, nIterations);

end

function newtonRaphson(x0,errorThreshold, ejNumber)
    fprintf('Método de Newton-Raphson. Ej %d\n',  ejNumber);
    
    fx= Fun(x0,ejNumber);
    
    syms x;
    fPrima= Fun(x, ejNumber);
    fPrima = diff(fPrima);
    
    calculatedError = Inf; 
    nIterations = 0;
    
    while (errorThreshold < calculatedError )
      fPrima=eval(subs(fPrima,x,x0));
      fx= Fun(x0,ejNumber);
      
      x1=x0-(fx/fPrima);
      x1=round(double(x1),4);
     
      calculatedError =abs(abs(x1)-abs(x0));
      
      x0=x1;
      nIterations = nIterations+1;
    end

    fprintf('La raiz de la función se encuentra en %f tras n = %d iteranciones.\n',x0,nIterations);
end

