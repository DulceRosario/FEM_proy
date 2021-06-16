% Metodo de Gradiente Conjugado

function x= conjgrad(b,col) % Ax=b 

global matrizGlobal
global vectorGlobal

%Paso 1

x= zeros(size(b)); %x= 0, punto inicial
r=b;
p=r;
rsold= r'*r;

%Paso  2 y 3 

for i=1:length(b)

    %Paso 5
    AP =
    Ap = A * p; %Multiplicación de la Matriz A con el vector p
   
    alpha = rsold / (p' * Ap);
    x=  x + alpha * p;
    r= r - alpha *Ap;
    rnew = r' * r ;
    
    fprintf('iter %d , residuo %g \n',i,sqrt(rsnew) )
    
    %Paso 6 
    
    if sqrt(rnew) < tol
        break
        
    end
end