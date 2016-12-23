% ���\��p�i�������Ԃ̔�r�j
clear
format long
% 100000�|�C���g�ō��ށA��������t1
dx1 = pi/250;
fd_f1 = zeros(1,100000);
xn1 = -200*pi;

tic;
% -200�΂���200�΂܂łŔ�������
for i = 1:100000
    xn_point = xn1 + dx1;
    fd_f1(i) = ( sin( xn1 + dx1 )/( xn1 + dx1 ) - sin( xn1 )/( xn1 ))/dx1;
    xn1 = xn_point;
end;
t1 = toc;

% 10000�|�C���g�ō��ށA��������t2
dx2 = pi/25;
fd_f2 = zeros(1,10000);
xn2 = -200*pi;

tic;
% -200�΂���200�΂܂łŔ�������
for i = 1:10000
    xn_point = xn2 + dx2;
    fd_f2(i) = ( sin( xn2 + dx2 )/( xn2 + dx2 ) - sin( xn2 )/( xn2 ))/dx2;
    xn2 = xn_point;
end;
t2 = toc;

% 1000�|�C���g�ō��ށA��������t3
dx3 = pi/2.5;
fd_f3 = zeros(1,1000);
xn3 = -200*pi;

tic;
% -200�΂���200�΂܂łŔ�������
for i = 1:1000
    xn_point = xn3 + dx3;
    fd_f3(i) = ( sin( xn3 + dx3 )/( xn3 + dx3 ) - sin( xn3 )/( xn3 ))/dx3;
    xn3 = xn_point;
end;
t3 = toc;

%{
100000�|�C���g�̎��͖��炩�Ɏ��Ԃ��������Ă��邪�A10000�|�C���g��
1000�|�C���g�̎��̎��Ԃ̍��͏������H
%}