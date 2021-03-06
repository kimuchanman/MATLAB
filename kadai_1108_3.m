
% 倍精度で計算
clear
format long
dx = 0.01;
fd_f1 = zeros(1,1000);
xn = 1.0;
% sin(1.01)からsin(11.00)まで微分する
% 計算結果にあまり変化が見られなかったためiの範囲を大きくした
tic;
for i = 1:1000
    xn_point = xn + dx;
    fd_f1(i) = ( sin( xn + dx ) - sin( xn ))/dx;
    xn = xn_point;
end;
toc;
% 処理時間はMATLABのほうが早かった