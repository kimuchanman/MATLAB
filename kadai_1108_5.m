% ���\��p�i���āj
clear
format long
dx = pi/250;
fd_f1 = zeros(1,100000);
xn = -200*pi;

tic;
% -200�΂���200�΂܂łŔ�������
for i = 1:100000
    xn_point = xn + dx;
    fd_f1(i) = ( sin( xn + dx )/( xn + dx ) - sin( xn )/( xn ))/dx;
    xn = xn_point;
end;
t1 = toc;
plot(fd_f1);
% ���_�Ώ̂̃T���v�����O�Ȑ����`����