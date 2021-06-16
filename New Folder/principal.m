

clear all

%
% Elemento Finito
%

%% Datos
archivo = 'cuadrado';
XI = [ 0 0 ]; % Extremo Izquierdo del Domicio Rectangular 
XD = [ 1 1 ]; % Extremo Derecho del Domicio Rectangular 



%% Setup
global G  %Tabla de Geometria (Puntos)
G={};

global EF % Tabla de Elementos Finitos (Elemento Finito) 

EF={};

global matrizGlobal %Matriz Global
matrizGlobal =[];


global vectorGlobal
vectorGlobal =[];


%% Geometría

NGL = Geometria2D(archivo, XI , XD ); % Numero de grados de libertad


%% Elementos Finitos

ElementosFinitos( archivo)

%%Matrices Globales

%%Matrices Locales y Grados de Libertad

MatricesGlobales( NGL);


%%Resolvedor

unsol =inv(matrizGlobal) * VectorGlobal;

%unsol = pcg(-matrizGlobal,-vectorGlobal); % Aproximado, CGM, Matrices simetricas y Pos, Def

%% Graficación



%%Complemento de Schur


%Subrutina de geometria 
%Subrutina elementos Finitos
%Subrutina MAtriz Global -> MAtrices subdomiio


global MS % tabla de Matrices por subdominio
MS={}

[glInt, glFronInt]= Reordenacion();
MatricesSubdominio()

%% Complemento de Shur (Construyendo la matriz S) secuencial

S=MS.AGG;
for i= 1:NPAR  %Se puede hacer en paralelo 
   S=S-MS.S{i}.AGI* MS.S{i}.invAII * MS.S{i}.AIG;
    
end

FS=MS.FG;
for i= 1:NPAR %Se puede hacer en paralelo 
   FS=FS-MS.S{i}.AGI* MS.S{i}.invAII * MS.S{i}.FI;
    
end


%CGM Sx=FS
uG= conjgradA(S,FS,tol);

%Operador de proyeccion  a Nodos interiores

uI= cel{NPAR,1};
for i= 1:NPAR %Se puede hacer en paralelo 
   uI= MS.S{i}.invAII* ( MS.S{i}.FI- MS.S{i}.AIG*uG);
end


