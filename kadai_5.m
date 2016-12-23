clear;

A = [1; 3; 3];
B = [2; 4; -2];
C = [-2; 2; 3];

syms a b c
S = solve([a+3*b+3*c == 6, 2*a+4*b-2*c == -2, -2*a+2*b+3*c == -2],[a,b,c]);
S.a
S.b
S.c