
function cgl=Geometria2D(archivo ,XI ,XD)

global G   %Tabla de Geometria

feval(archivo); %variable msh

NPT=msh.nbNod; % Numero de puntos Totales

G= cell(NPT,1); %Inicialización de la tabla Geometria

cgl =0; % Contador de grados de libertad

for pto = 1:NPT  %Para cada punto hacer:
    %Campo  identificador
    G{pto}.id = pto;
    %CAmpo coordenada
    coor=msh.POS(pto,1:2);
    G{pto}.coor= coor;
    
    %Campo es frontera
     f=esFrontera( coor, XI, XD );
    G{pto}.f= f;
    
    % Campo Grado de libertad
    
    if f == false
        %Nodo interior
        cgl =cgl + 1;
        G{pto}.gl = cgl;
        G{pto}.val = NaN;
    else
        %Nodo de frontera
        G{pto}.gl = NaN;
        G{pto}.val = condicionFrontera( coor );
    end
    
    %Solución analitica
        G{pto}.sol = solucionAnalitica( coor );
    
    
    
end