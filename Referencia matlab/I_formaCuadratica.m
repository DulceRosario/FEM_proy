function y= I_formaCuadratica( centroide,area, idu, idw, coefs)


altura = formaCuadratica( idu, idw, centroide, coefs);

base = area; % area del elemento finito

y =  base * altura; 
end