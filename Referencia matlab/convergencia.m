function errorGlobal = convergencia()

global G

NTP= length( G ); %Numero Total de puntos

errorGlobal=0;

for i=1:NTP
    errorLocal = abs( G{i}.val - G{i}.sol );
    if errorLocal > errorGlobal
        errorGlobal = errorLocal;
    end
end

fprintf('Error Global = %f\n ', errorGlobal)