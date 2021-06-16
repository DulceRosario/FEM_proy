function  [coefs ,area] = coeficientes ( E1, E2, E3 )

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

% Area del Elemento Finito(Determinante)

area = abs(det(matPto)/2);


% Matriz inversa de la Matriz de puntos Extremos

invMatPto = inv( matPto );

%Matriz de coeficientes para cada sistema

coefs= zeros(3,3);

%Matriz de coeficientes para cada sistema (3)
for i = 1:3  % Para cada extremo hacer: para cada plano
    
    vec = zeros( 3 ,1 );
    vec(i) = 1;
    coef = invMatPto * vec;% Coeficientes a,b,c de uno de lo planos
    coefs(i,:) = coef'; %se almcacenan los coeficientes en el renglon i-esimo
end


%El resultado final es la matriz coefs que tiene lo coeficientes de los
%tres, planos, un juego de coeficientes en cada renglon. 



