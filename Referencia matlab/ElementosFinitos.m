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
    
    coefs= coeficientes(G{ext(1)}.coor, G{ext(2)}.coor, G{ext(3)}.coor );
    EF{ef}.coefs = coefs;
    
end
    

