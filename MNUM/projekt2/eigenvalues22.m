function [v1 v2] = eigenvalues22(A)
% program liczacy wartosci wlasne macierzy 2x2
sq = sqrt(A(1,1)^2 -2*A(1,1)*A(2,2) + 4*A(1,2)*A(2,1) + A(2,2)^2);
v1 = (A(2,2)+A(1,1) - sq)/2;
v2 = (A(2,2)+A(1,1)-sq)/(2*A(1,1));
end