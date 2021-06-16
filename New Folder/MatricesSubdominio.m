function  MatricesSubdominio(glInt,glFronInt)

global MS % Estructura  Submatrices
global matrizGlobal %Matriz global 
global vectorGlobal

NPAR =length(glInt);
S=cell(NPAR,1);

for i= 1:NPAR
    
    S{i}.AII=matrizGlobal(glInt{i}, glInt{i});
    S{i}.AIG=matrizGlobal(glInt{i}, glFronInt);
    S{i}.AGI=matrizGlobal(glFronInt, glInt{i});
    
    S{i}.FI= vectorGlobal(glInt{i});
    S{i}.invAII=inv(S{i}.AII);

end

MS.AGG=matrizGlobal(glFronInt,glFronInt )
MS.FG=vectorGlobal(glFronInt);
MS.S=S;