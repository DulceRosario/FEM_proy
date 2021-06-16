function graficar2D()
global G
global EF

NPT = length( G );
XX = zeros(NPT,1 );
YY = zeros(NPT,1 );
ZZ = zeros(NPT,1 );

for pto = 1 : NPT 
    XX(pto) = G{pto}.coor(1);
    YY(pto) = G{pto}.coor(2);
    ZZ(pto) = G{pto}.val;
    
end
scatter3(XX,YY,ZZ, 10, 'r', 'filled' );
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Gráfica de la solución');


hold on

NET=length(EF);
for ef = 1:NET
    ext= EF{ef}.ext;
    P1 = G{ ext(1) }.coor;
    P2 = G{ ext(2) }.coor;
    P3 = G{ ext(3) }.coor;
    
    Z1 = G{ ext(1) }.val;
    Z2 = G{ ext(2) }.val;
    Z3 = G{ ext(3) }.val;
    
    line(  [ P1(1) P2(1) ], [ P1(2) P2(2)  ], [ Z1 Z2 ] ); %Recta P1-P2
    line(  [ P2(1) P3(1) ], [ P2(2) P3(2)  ], [ Z2 Z3 ] ); %Recta P2-P3
    line(  [ P3(1) P1(1) ], [ P3(2) P1(2)  ], [ Z3 Z1 ] ); %Recta P3-P1
end
    