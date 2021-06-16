function ElementosFinitos ( archivo)

global EF % Tabla de Elemento Finito
global G  % Tabla de Geometria

feval(archivo); %variable msh

NET= length( msh.TRIANGLES); % Numero de elementos totales

EF =cell(NET,1); %Inicializando Elementos Finitos

for ef = 1:NET  % por cada elemento hacer:
    
    % Campo Identificador
    EF{ef}.id = ef;
    
    %Campor Extremos
    
    ext = msh.TRIANGLES( ef,1:3);
    EF{ef}.ext = ext;
    
    %Campo Grados de Libertad
    
    NEXT = length( ext );
    gl = zeros(1, NEXT);
    
    for i= 1:NEXT
        gl(i) =G{ ext(i) }.gl;
    end
    
    EF{ef}.gl = gl;
    
    %Campo Coeficientes delos planos de la base local 
    
    [coefs,area]= coeficientes(G{ext(1)}.coor, G{ext(2)}.coor, G{ext(3)}.coor );
    EF{ef}.coefs = coefs;
    
    %Campo Centroide
    centroide= zeros(1,2); % Dos dimensiones (x,y)
    for i=1:NEXT
        centroide=centroide + G{ ext(i) }.coor;
    end
    centroide=centroide/NEXT; % Promedio de los extremos
    EF{ef}.centroide = centroide;
    
    %Campo Area
    
    EF{ef}.area = area;
    
    
    %Matriz local
    
    matrizlocal= zeros(NEXT,NEXT);
    
    for idw= 1:NEXT
        
        for idu = 1:NEXT
            matrizlocal(idw,idu)= I_formaCuadratica(centroide,area,idu,idw,coefs);
        end
    end
    
    EF{ef}.AL = matrizlocal;
        
     %Vector local
     
     vectorLocal = zeros( NEXT,1 );
     
     for idw = 1:NEXT
         vectorLocal(idw,1)= I_productofw(centroide,area,idw,coefs);
     end
     
     EF{ef}.VL = vectorLocal;

        
        
  
    
    
    
end
    

