function  coefs = coeficientes ( E1, E2, E3 )

% Matriz de Puntos Extremos
matPto = ones(3,3);

% Primer renglon 

matPto(1,1) = E1(1); %Coor x de ext1 
matPto(1,2) = E1(2); %Coor x de ext1 

% Segundo renglon 

matPto(2,1) = E2(1); %Coor x de ext2 
matPto(2,2) = E2(2); %Coor x de ext2


% Tercer renglon 

matPto(3,1) = E3(1); %Coor x de ext3 
matPto(3,2) = E3(2); %Coor x de ext3


% Matriz inversa de la Matriz de puntos Extremos

invMatPto = inv( matPto );

%Matriz de coeficientes 

coefs= zeros(3,3);

for i = 1:3  % Para cada extremo hacer:
    
    vec = zeros( 3 ,1 );
    vec(i) = 1;
    coef = invMatPto * vec;
    coefs(i,:) = coef';
end




