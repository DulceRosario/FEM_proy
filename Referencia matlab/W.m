% Funcion de pero Base W
%Parametros:
%     id: 1, 2 ó 3  tipo de función
%    der: [0 0] función, [1 0] derivada en X, [0 1] derivada en  Y
%   coor: [x,y]
% coefs: matriz de coeficientes
% Resultado
%    W

function y = W(id, der, coor, coefs )

switch id
    case 1  %Funcion id 1 ( W=1 en ext 1 y 0 en otro ext  )
        opder= der(1) + der(2)*2;
        switch opder
            case 0 % der -[ 0 0 ] funcion
                y= plano(coor, coefs(1,:) )
            case 1 % der -[ 1 0 ] derivada en X
                y= DxPlano(coor, coefs(1,:) )
            case 2 % der -[ 0 1 ] derivada en Y
                y= DyPlano(coor, coefs(1,:) )
            otherwise
                error('Funci{on W : id invalido')
        end
                
    case 2  %Funcion id 2 ( W=1 en ext 2 y 0 en otro ext  )
         opder= der(1) + der(2)*2;
        switch opder
            case 0 % der -[ 0 0 ] funcion
                y= plano(coor, coefs(2,:) )
            case 1 % der -[ 1 0 ] derivada en X
                y= DxPlano(coor, coefs(2,:) )
            case 2 % der -[ 0 1 ] derivada en Y
                y= DyPlano(coor, coefs(2,:) )
            otherwise
                error('Funci{on W : id invalido')
        end
    case 3  %Funcion id 3 ( W=1 en ext 3 y 0 en otro ext  )
         opder= der(1) + der(2)*2;
        switch opder
            case 0 % der -[ 0 0 ] funcion
                y= plano(coor, coefs(3,:) )
            case 1 % der -[ 1 0 ] derivada en X
                y= DxPlano(coor, coefs(3,:) )
            case 2 % der -[ 0 1 ] derivada en Y
                y= DyPlano(coor, coefs(3,:) )
            otherwise
                error('Funci{on W : id invalido')
        end
    otherwise
        error('Funci{on W : id invalido')
end