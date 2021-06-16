function id=buscarGL(gl)

global G

NPT= length(G);

id=[];
encontrado =false;

for i=1:NPT
    if G{i}.gl== gl
        
        id= G{i}.id;
        encontrado=true;
        break;
    end
end

if encontrado  == false 
    error(' buscarGl: gl no encontrado en G');
end
