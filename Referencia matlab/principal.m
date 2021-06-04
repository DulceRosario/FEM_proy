

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

%% Geometría

NGL = Geometria2D(archivo, XI , XD ); % Numero de grados de libertad

%% Elementos Finitos

ElementosFinitos( archivo)



