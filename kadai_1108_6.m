% 発表会用（精度の比較）
clear
format long

  dx1 = pi/250;
fd_f1 = zeros(1,100000);
  xn1 = -200*pi;

  dx2 = pi/250;
fd_f2 = zeros(1,100000);
  xn2 = -200*pi;
  
%   正しい値 exact
exact = zeros(1,100000);

% -200πから200πまでで微分する
for i = 1:100000
%     exact は微分した関数の正確な値
    exact(i) = (( xn1 ) * cos( xn1 ) - sin( xn1 ))/( ( xn1 ) * ( xn1 ) );
%     2点後退差分で差分商を形成・・・①
    xn_point = xn1 + dx1;
    fd_f1(i) = ( sin( xn1 + dx1 )/( xn1 + dx1 ) - sin( xn1 )/( xn1 ))/dx1;
    xn1 = xn_point;
%     2点中心差分で差分商を形成・・・②
    xn_point = xn2 + dx2;
    fd_f2(i) = ( sin( xn2 + dx2 )/( xn2 + dx2 ) - sin( xn2 - dx2 )/( xn2 - dx2 ))/( 2 * dx2);
    xn2 = xn_point;
%     ①と②の差をとる
    dif1(i) = fd_f1(i) - fd_f2(i);  %後退差分と中心差分との誤差
    dif2(i) = exact(i) - fd_f1(i);  %後退差分の誤差、誤差にも偏りが見られる
    dif3(i) = exact(i) - fd_f2(i);  %中心差分の誤差、誤差も原点対象である
end;

exact(50001) %sin0/0 の微分も考慮できている。
% 発表メモ　plot(fd_f1,'DisplayName','fd_f1');hold on;plot(fd_f2,'DisplayName','fd_f2');hold off;
% 発表メモ　plot(dif)

