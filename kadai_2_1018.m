clear
% おおよそ円周率に漸近した値、実行時間が７秒前後
Num = 70000000
x = rand(Num,1);
y = rand(Num,1);

z = (x.*x + y.*y);

sum(z<1)/Num*4

 
 

