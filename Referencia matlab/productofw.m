% arg_forma_cuadradica
%W(id, der, coor, coefs )
function y = productofw(idw,x, coefs)

    der= zeros(1,2);
    y = coef_f(x) * W(idw, der, x, coefs );

end
