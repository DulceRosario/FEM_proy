function y= I_productofw( centroide,area, idw, coefs)


altura = productofw(idw, centroide, coefs);

base = area; % area del elemento finito

y =  base * altura; 
end