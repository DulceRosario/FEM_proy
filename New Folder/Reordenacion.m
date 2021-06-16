function glFronInt = Reordenacion()

global G 

load datosNodos

% Frontera Interior

NPFI = length(ptoFronInt);
glFromInt();
for i=1:NPFT 
    glFronInt=union(G{ptoFronInt(i)}.gl, glFronInt);
end

%%Interior

NPAR= length(limpar);
glInt = cell(NPAR,1);

for i=1ength(limpar);
    glInt=