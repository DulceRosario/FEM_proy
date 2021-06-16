function imprimirGeometria()

global G

NPT = length(G);

fprintf('%5s', 'id' )
fprintf('%5s', 'coor' )
fprintf('%5s', 'gl' )
fprintf('%5s', 'val' )
fprintf('%5s', 'exa')
fprintf('\n')

for i=1:NPT
   fprintf('%5d', G{i}.id )
   
   fprintf('[')
   fprintf('%10.4f ', G{i}.coor)
   fprintf(']-')
   
   
   fprintf('-')
   fprintf('%3d', G{i}.f )
   fprintf('-[')
   fprintf('%5d', G{i}.gl )
   fprintf(']')
   fprintf('%10.4f', G{i}.val )
   
   fprintf('%10.4f', G{i}.sol )
   fprintf('\n')
   
   
   
    
end



end