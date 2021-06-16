function  y=VectorGlobal( NGL)

global vectorGlobal
global EF

vectorGlobal= zeros(NGL, 1); % Inicialización del Vector Global

NEF = length(EF);

for ef= 1:NEF % Para cada elemento finito 
   VL =EF{ef}.VL; %Vector Local
   gl= EF{ef}.gl;  %Mapeo
   
  for p=1:3   %funciones de de base Locales (3), columna 
      if ~isnan( gl(p))
             vectorGlobal{ gl(p) } =  vectorGlobal{ gl(p) } + VL(p);
      end
   end
      
   

end