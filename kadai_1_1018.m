clear

Num = 10000
% 20����s����y�ѕW���΍������߂�
for i=1:20
x = rand(Num,1);
y = rand(Num,1);

z = (x.*x + y.*y);

sum(z<1)/Num*4
a(i) = ans
% a�̑��a��Su�Ƃ���
Su = sum(a)
% a�̕W���΍���St�Ƃ���
St = std(a)
end;
% ���ς����߂�
 ave = Su/20 
 
 

