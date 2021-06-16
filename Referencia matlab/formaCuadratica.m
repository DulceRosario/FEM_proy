
% arg_forma_cuadradica

%W(id, der, coor, coefs )
function y =formaCuadratica( idu, idw, x, coefs)

y = 0;

% Primer termino de la forma cuadratica
for i=1:2
    for j=1:2
        derw = zeros(1,2);
        derw(i) =1;
        deru = zeros(1,2);
        deru(i) =1;
        
        y= y - W(idw, derw, x, coefs ) * coef_a(i,j) * W(idu, deru, x, coefs ) ;
    end
end

% ... Segundo termino ... Tercer termino 


end



