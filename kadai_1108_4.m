
% �P���x�Ōv�Z
clear
format long
dx = single( 0.01 );
fd_f1 = single( zeros(1,1000) );
xn = single(1.0);

tic;
for i = 1:1000
    xn_point = single( xn + dx );
    fd_f1(i) = single( sin( xn + dx ) - sin( xn ) )/dx;
    xn = single( xn_point );
end;
toc;
% �P���x��MATLAB�̂ق����������Ԃ���������