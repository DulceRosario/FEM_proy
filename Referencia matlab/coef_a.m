function y= coef_a(i,j)

switch i
    case 1
        switch j
            case 1 % coeficiente a 11 D2x
                y=1;
            case 2  % coeficiente a 12 DxDy
                y=0;
            otherwise
                error('coef_a: indice invalido ');
        end
    case 2   
        switch j
            case 1 % coeficiente a 21 DxDy=DyDx
                y=0;
            case 2  % coeficiente a 22 D2y
                y=1;
            otherwise
                error('coef_a: indice invalido ');
        end
        
        
end

end