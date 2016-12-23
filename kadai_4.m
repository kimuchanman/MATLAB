clear;

A = [1 3; 3 1]
B = [1 -1 0; -2 1 -2; 0 -1 1]
syms M
[V,D] = eig(A)
v = inv(V)
v*A*V
V*D^M*v

[P,Q] = eig(B)
p = inv(P)
p*B*P
P*Q^M*p

X = [1 3 3; 2 4 -2; -2 2 3];
x = inv(X)