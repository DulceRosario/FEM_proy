

clear all

%
% Elemento Finito
%

%% Datos
archivo = 'cuadrado';
XI = [ 0 0 ]; % Extremo Izquierdo del Domicio Rectangular 
XD = [ 1 1 ]; % Extremo Derecho del Domicio Rectangular 

tol=10e-8;



%% Setup
global G  %Tabla de Geometria (Puntos)
G={};

global EF % Tabla de Elementos Finitos (Elemento Finito) 

EF={};

global matrizGlobal %Matriz Global
matrizGlobal =[];


global vectorGlobal
vectorGlobal=[];


%% Geometría

NGL = Geometria2D(archivo, XI , XD ); % Numero de grados de libertad


%% Elementos Finitos

ElementosFinitos( archivo)

%%Matrices Globales

%%Matrices Locales y Grados de Libertad

MatricesGlobales( NGL);


%%Resolvedor

unsol =inv(matrizGlobal) * vectorGlobal;

%unsol= conjgrad( tol ); % Aproximado, GM, MAtrice imetrica

%unsol = pcg(-matrizGlobal,-vectorGlobal); % Aproximado, CGM, Matrices simetricas y Pos, Def

%% Graficación

actualizarGeometria( unsol )
grafica2D();

%%Convergencia, Error

convergencia()




