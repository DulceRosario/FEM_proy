function y = solucionAnalitica( coor)
dim= length(coor);
y= 1;
for i= 1:dim 
    y= y*sin(pi*coor(i));
end