clear

Num = 10000
% 20回実行する及び標準偏差を求める
for i=1:20
x = rand(Num,1);
y = rand(Num,1);

z = (x.*x + y.*y);

sum(z<1)/Num*4
a(i) = ans
% aの総和をSuとおく
Su = sum(a)
% aの標準偏差をStとおく
St = std(a)
end;
% 平均を求める
 ave = Su/20 
 
 

