% ���\��p�i���x�̔�r�j
clear
format long

  dx1 = pi/250;
fd_f1 = zeros(1,100000);
  xn1 = -200*pi;

  dx2 = pi/250;
fd_f2 = zeros(1,100000);
  xn2 = -200*pi;
  
%   �������l exact
exact = zeros(1,100000);

% -200�΂���200�΂܂łŔ�������
for i = 1:100000
%     exact �͔��������֐��̐��m�Ȓl
    exact(i) = (( xn1 ) * cos( xn1 ) - sin( xn1 ))/( ( xn1 ) * ( xn1 ) );
%     2�_��ލ����ō��������`���E�E�E�@
    xn_point = xn1 + dx1;
    fd_f1(i) = ( sin( xn1 + dx1 )/( xn1 + dx1 ) - sin( xn1 )/( xn1 ))/dx1;
    xn1 = xn_point;
%     2�_���S�����ō��������`���E�E�E�A
    xn_point = xn2 + dx2;
    fd_f2(i) = ( sin( xn2 + dx2 )/( xn2 + dx2 ) - sin( xn2 - dx2 )/( xn2 - dx2 ))/( 2 * dx2);
    xn2 = xn_point;
%     �@�ƇA�̍����Ƃ�
    dif1(i) = fd_f1(i) - fd_f2(i);  %��ލ����ƒ��S�����Ƃ̌덷
    dif2(i) = exact(i) - fd_f1(i);  %��ލ����̌덷�A�덷�ɂ��΂肪������
    dif3(i) = exact(i) - fd_f2(i);  %���S�����̌덷�A�덷�����_�Ώۂł���
end;

exact(50001) %sin0/0 �̔������l���ł��Ă���B
% ���\�����@plot(fd_f1,'DisplayName','fd_f1');hold on;plot(fd_f2,'DisplayName','fd_f2');hold off;
% ���\�����@plot(dif)

