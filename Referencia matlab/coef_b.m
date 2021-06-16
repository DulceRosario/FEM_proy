function y= coef_b(i,x)

switch i
    
    case 1 % coeficiente b 1 Dx
        y = 0;
    case 2  % coeficiente b 1 Dy 
        y = 0;
    otherwhise
        error('coef_b: indice invalido');

end