
% ”{¸“x‚ÅŒvŽZ
clear
format long
dx = 0.01;
fd_f1 = zeros(1,1000);
xn = 1.0;
% sin(1.01)‚©‚çsin(11.00)‚Ü‚Å”÷•ª‚·‚é
% ŒvŽZŒ‹‰Ê‚É‚ ‚Ü‚è•Ï‰»‚ªŒ©‚ç‚ê‚È‚©‚Á‚½‚½‚ßi‚Ì”ÍˆÍ‚ð‘å‚«‚­‚µ‚½
tic;
for i = 1:1000
    xn_point = xn + dx;
    fd_f1(i) = ( sin( xn + dx ) - sin( xn ))/dx;
    xn = xn_point;
end;
toc;
% ˆ—ŽžŠÔ‚ÍMATLAB‚Ì‚Ù‚¤‚ª‘‚©‚Á‚½