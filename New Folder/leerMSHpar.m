function lim 


%%% FALTA %%
while  ischart(tline)
    if tline(1) == '$' % Encabezado $
        if tline(2) == 'P' % Encabezado $PartitionedEntities
           PartitionedEntities = true;
        end
        if tline(2) == 'E'  & tline(5) == 'P'   % Encabezado $PartitionedEntities
           PartitionedEntities = false;
        end
        
    end
    
    if  PartitionedEntities == true
        if cline == 1
            disp( tline )
            npar= str2num( tline );     
        end
        cline = cline + 1;
    end
end