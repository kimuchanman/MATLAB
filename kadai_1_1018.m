clear

Num = 10000
% 20‰ñÀs‚·‚é‹y‚Ñ•W€•Î·‚ğ‹‚ß‚é
for i=1:20
x = rand(Num,1);
y = rand(Num,1);

z = (x.*x + y.*y);

sum(z<1)/Num*4
a(i) = ans
% a‚Ì‘˜a‚ğSu‚Æ‚¨‚­
Su = sum(a)
% a‚Ì•W€•Î·‚ğSt‚Æ‚¨‚­
St = std(a)
end;
% •½‹Ï‚ğ‹‚ß‚é
 ave = Su/20 
 
 

