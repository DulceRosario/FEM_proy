function  y=MatricesGlobales( NGL)

global matrizGlobal
global vectorGlobal
global EF



%%Vector Local

vectorGlobal= zeros(NGL, 1); % Inicialización del Vector Global

NEF = length(EF);

for ef= 1:NEF % Para cada elemento finito 
   VL =EF{ef}.VL; %Vector Local
   gl= EF{ef}.gl;  %Mapeo
   
  for p=1:3   %funciones de de base Locales (3), columna 
      if ~isnan( gl(p))
             vectorGlobal( gl(p) ) =  vectorGlobal( gl(p) ) + VL(p);
      end
   end
      
   

end

%%MAtriz -Global

matrizGlobal= zeros(NGL, NGL);

NEF = length(EF);

for ef= 1:NEF % Para cada elemento finito 
   AL =EF{ef}.AL; %MAtroz Local
   gl= EF{ef}.gl;  %Mapeo
   for p=1:3  %funciones de de peso Locales (3), renglon
       
       if ~isnan( gl(p))  % ¿ es valido el mapeo?
         for b=1:3   %funciones de de base Locales (3), columna
            if ~isnan( gl(b))
             matrizGlobal( gl(p), gl(b) ) =  matrizGlobal( gl(p), gl(b) ) + AL(p,b);
            end
         end
       end
   end

end