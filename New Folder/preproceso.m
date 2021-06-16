clear all

archivo='cuadrado2';

%% Detectar número de subdominios 

NPAR= leerMSHpar( [ archivo '.msh' ] );

%% Detectar límites de elementos finitos por partición 

limPar = leerMSHent( [ archivo '.msh' ], NPAR  );

%% Archivo extensión .m (archivo exportado a Matlab)

feval(archivo);

% Graficar NODOS

figure(1)

NPT = msh.nbNod; %Número de puntos totales
XX = zeros(NPT,1); % Coordernada X
YY = zeros(NPT,1); % Coordernada Y
ZZ = zeros(NPT,1); % Coordernada Z 

for pto = 1: NPT %Para cada punto
    
    XX(pto) = msh.POS(pto,1); %  Coor X
    XX(pto) = msh.POS(pto,2); %  Coor Y
    XX(pto) = msh.POS(pto,3); %  Coor Z (Z=0)
    
end

scatter3(XX,YY,ZZ, 15, 'k','filled') %
title('Nodos')
xlabel('X')
ylabel('Y')
view(2)

%% Graficar Elementos Finitos

figure(2)

NPT = msh.nbNod; %Número de puntos totales
XX = zeros(NPT,1); % Coordernada X
YY = zeros(NPT,1); % Coordernada Y
ZZ = zeros(NPT,1); % Coordernada Z 

for pto = 1:NPT %Para cada punto

    XX(pto) = msh.POS(pto,1); %Coor X 
    YY(pto) = msh.POS(pto,2); %Coor Y
    ZZ(pto) = msh.POS(pto,3); %Coor Z (Z-0)
    
end

scatter3(XX,YY,ZZ, 15, 'r','filled')

hold on

NET = length( msh.TRIANGLES ); %Numero de elementos totales

for ef = 1:NET % Para cada Elemento Finito
   
    ext=  msh.TRIANGLES(ef,:)
    line( [ XX(ext(1)) XX(ext(2)) ] , [ YY(ext(1)) YY(ext(2)) ], [ ZZ(ext(1)) ZZ(ext(2)) ] )
    line( [ XX(ext(2)) XX(ext(3)) ] , [ YY(ext(2)) YY(ext(3)) ], [ ZZ(ext(2)) ZZ(ext(3)) ] )
    line( [ XX(ext(3)) XX(ext(1)) ] , [ YY(ext(3)) YY(ext(1)) ], [ ZZ(ext(3)) ZZ(ext(1)) ] )
    
end


title('Elementos')
xlabel('X')
xlabel('Y')

view(2)

hold off

%% Graficar UNA PARTICIÓN

par=2;
figure (3)

NPT = msh.nbNod; %Número de puntos totales
XX = zeros(NPT,1); % Coordernada X
YY = zeros(NPT,1); % Coordernada Y
ZZ = zeros(NPT,1); % Coordernada Z 

for pto = 1:NPT %Para cada punto

    XX(pto) = msh.POS(pto,1); %Coor X 
    YY(pto) = msh.POS(pto,2); %Coor Y
    ZZ(pto) = msh.POS(pto,3); %Coor Z (Z-0)

end

scatter3(XX,YY,ZZ, 15, 'r','filled')

hold off










%%Conjuntos: Los Nodos (interior, frontera extrior e interior) que pertenecen a un subdominio 

ptoTodos=cell(NPAR,1);

for par=1:NPAR
ptoTodos= [];
for i= limPar(par,1):limPar(par,2)
    ptoSub= union(msh.TRIANGLES(ef,1:3),ptoTodos{par});
    
end 
end

%%Conjuntos : Los nodos de frontera Exterior

ptosFronExt = [];

XI= msh.MIN( 1:2);
XD= msh.MAX( 1:2);
NPT=msh.nbNod;
 
for pto = 1:NPT
    coor =msh.POS(pto,1:2);
   if esFrontera(coor, XI,XD)
       ptosFronExt = union(pto,ptosFronExt);
       
   end
end
   
ptosFronInt= [];

for i=1:(NPAR-1)
    for j=i+1:NPAR
    fronDiSj= intersect(ptoTodos(i),ptoTodos(j));
    ptoFronInt=union( fronDiSj,ptosFronInt );
    
    end
end

%%Conjuntos: Los nodos interiores que pertenecen a un subdominio

ptoInt = cell(NPAR, 1)

for par= 1: NPAR
    ptoInt{par}=setdiff(ptoTodos{par}, ptosFronExt  );
    ptoInt{par}=setdiff(ptoTodos{par}, ptosFronInt  );

    
end

%%
save 'datosNodos' ptosFronExt
