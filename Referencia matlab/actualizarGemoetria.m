function actualizarGemoetria( usol)

global G

NPT= length( G ); %Numero total de punto

for pto = 1:NPT % para cada punto hacer
    if G{pto}.f == false % No frontera
        G{pto}.val = usol( G{pto}.gl );
    end 
end