function y= esFrontera (coor, XI, XD)
 
tol =2*eps; % Tolerancia de comparación entre número reales
y = false; % Inicialmente asume que el nodo no esta en la frontera
dim=length(coor); % Nuero de dimensiones
for i=1:dim % Por cada dimension
% incorrecto comparar números reales  coor(i)== XI(i)
if( abs(coor(i)- XI(i)) < tol ) | ( abs( coor(i)- XD(i))<tol )
    y = true;
end
end

