
% �{���x�Ōv�Z
clear
format long
dx = 0.01;
fd_f1 = zeros(1,1000);
xn = 1.0;
% sin(1.01)����sin(11.00)�܂Ŕ�������
% �v�Z���ʂɂ��܂�ω��������Ȃ���������i�͈̔͂�傫������
tic;
for i = 1:1000
    xn_point = xn + dx;
    fd_f1(i) = ( sin( xn + dx ) - sin( xn ))/dx;
    xn = xn_point;
end;
toc;
% �������Ԃ�MATLAB�̂ق�����������