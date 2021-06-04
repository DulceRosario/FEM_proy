// Gmsh project created on Tue Jun  1 17:09:17 2021
//+
Point(1) = {0, 0, 0, .1};
//+
Point(2) = {0, 1, 0, .1};
//+
Point(3) = {1, 0, 0, .1};
//+
Point(4) = {1, 1, 0, .1};
//+
Point(5) = {0, 0, 0, 0.1};
//+
Point(6) = {0, 1, 0, 0.1};
//+
Line(1) = {2, 4};
//+
Line(2) = {1, 3};
//+
Line(3) = {2, 1};
//+
Line(4) = {4, 3};
//+
Curve Loop(1) = {1, 4, -2, -3};
//+
Plane Surface(1) = {1};
