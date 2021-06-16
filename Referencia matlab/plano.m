%Plano z= ax+by+c
%Parametros:
%   coor: [x,y]
%   coef: [a,b,c]
% Resultado
%    z= ax+by+c
function y = plano (coor,coef)

y= coef(1)* coor(1) + coef(2)* coor(2) + coef(2)* coor(2) + coef(3);
