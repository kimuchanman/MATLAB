% C[ i ] = A[ i ] + B[ i ] (i = 0, ... , Max-1)
% 倍精度で計算
clear

format long
for i = 1:20
    tic;
    MAX(i) = 2^i;
%     二重ループを用い、処理時間tと要素数MAXを配列に格納した。
    for j = 1:MAX(i)
   a(j) = (j*1);
   b(j) = (j*2);
   c(j) = (a(j) + b(j));
    end;
%     計測するのはjのfor文の中身
   t(i) = toc;
    
end;
% O(n^2)より、グラフは二次関数が予想される
 plot(MAX,t);
%  グラフにしてみると、やはり二次関数っぽい。

% 結果[倍精度の方が単精度よりやや処理時間が大きくなる。]

