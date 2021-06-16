function y= coef_f(x)
    dim =length( x );
    y=( coef_k(x)^2 -dim * pi^2 );
    for i=1:dim
        y = y * sin( pi * x(i) );
    end

end