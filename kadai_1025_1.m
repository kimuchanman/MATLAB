% C[ i ] = A[ i ] + B[ i ] (i = 0, ... , Max-1)
% �P���x�Ōv�Z
clear

format long
for i = 1:20
    tic;
    MAX(i) = 2^i;
%     ��d���[�v��p���A��������t�Ɨv�f��MAX��z��Ɋi�[�����B
    for j = 1:MAX(i)
   a(j) = single(j*1);
   b(j) = single(j*2);
   c(j) = single(a(j) + b(j));
    end;
%     �v������̂�j��for���̒��g
  t(i) = toc;
    
end;
% O(n^2)���A�O���t�͓񎟊֐����\�z�����
 plot(MAX,t);
%  �O���t�ɂ��Ă݂�ƁA��͂�񎟊֐����ۂ��B

