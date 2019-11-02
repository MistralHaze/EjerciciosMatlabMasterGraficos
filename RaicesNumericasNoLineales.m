function nolineal()
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
        case 1
          fx = sin(x)- 0.3*exp(x);
        case 2
          fx = sqrt(x)-cos(x);
        case 3
          fx = 2*x^3 - 11.7*x^2 + 17.7*x - 5;  
        case 4
          fx = exp((1/2)*x) + 5*x -5; 
        otherwise
            disp("exercise not found");
    end
end

function biseccion(x1, x2, errorThreshold, ejNumber)
    display("bissection method. Ej" + ejNumber);
    A = Fun(x1, ejNumber);
    B = Fun(x2, ejNumber);
    if(A == 0 || B ==0 )
        if(A==0)
             display("la raiz de f(x) se encuentra en " + A);
        else
             display("la raiz de f(x) se encuentra en " + B);
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
                 display("el cero se encuentra en " + xm );
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
    display("el cero de la funcion se encuentra en el intervalo " + xm + " tras n = " + nIterations + " iteranciones");

end

function newtonRaphson(x0,errorThreshold, ejNumber)
    display("newtonRaphson method. Ej" + ejNumber);
    
    fx= Fun(x0,ejNumber);
    
    syms x;
    fPrima= Fun(x, ejNumber);
    fPrima = diff(fPrima);
    
    calculatedError = Inf; 
    nIterations = 0;
    
    while (errorThreshold <= calculatedError )
      fPrima = vpa(subs(fPrima,x,x0));
      fx= Fun(x0,ejNumber);
      
      x1=x0-(fx/fPrima);
      x1=round(double(x1),4);
      
      calculatedError = log((x1-x0)/errorThreshold)/log(2);
      
      x0=x1;
      nIterations = nIterations+1;
    end

    display("la raiz de la función se encuentra en " +  x0 + " tras n = " + nIterations + " iteranciones");
end

