function limEF =leerMSHent( archivo, NPAR )

    % archivo = 'cuadrado2.msh'; %Nombre del Archivo
    limEF = zeros( NPAR,2);
    fid = fopen(archivo, 'r'); % Se abre el archivo para lectura ASCII
    Elements =false;
    
    cline=0;
    cPar=1;
    sumEF=1;
    
    tline = fgetl(fid);
    
    while  ischart(tline)
        
        if tline(1) == '$' %Encabezado $
            if tline(3) == 'l'
            Elements=true;
        end
        
        if tline(2) == '$' & tline(6) == '1'  %Encabezado $EndElements
            Elements=false;

        end
        
        end
   
    
