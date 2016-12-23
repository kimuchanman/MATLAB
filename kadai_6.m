%発表課題用①　e^x
Div = 10000;            % 幅1毎の分割数
Upper = 4;         % 積分区間の上限
N_max = Div * Upper; % 総分割数
dx = 1/Div;          % 1分割範囲毎の幅

input_data = zeros( N_max+1, 1);
exact = 4/5 - log(sqrt(2)-1); %手計算
sum_tanzaku = zeros;
sum_daikei = zeros;
sum_simp1 = zeros;
sum_simp2 = zeros;
sum_simp3 = zeros;
sum_simp4 = zeros;

for i = 1: N_max+1 
    input_data(i) = ((i-1)*dx)/10 + 1/sqrt((i-1)*dx + 16);
end;

i=1;
while i <= N_max
    sum_simp1 = sum_simp1 + ( input_data(i+2) + 4*input_data(i+1) + input_data(i) ) * dx / 3;
    i = i + 2;
end;
i=1;
while i <= N_max/10
    sum_simp2 = sum_simp2 + ( input_data(i+2) + 4*input_data(i+1) + input_data(i) ) * dx * 10 / 3;
    i = i + 2;
end;
i=1;
while i <= N_max/100
    sum_simp3 = sum_simp3 + ( input_data(i+2) + 4*input_data(i+1) + input_data(i) ) * dx * 100 / 3;
    i = i + 2;
end;
i=1;
while i <= N_max/1000
    sum_simp4 = sum_simp4 + ( input_data(i+2) + 4*input_data(i+1) + input_data(i) ) * dx * 1000 / 3;
    i = i + 2;
end;

format long

sum_simp

Error_sum_simp1    = sum_simp1 - exact
Error_sum_simp2    = sum_simp2 - exact
Error_sum_simp3    = sum_simp3 - exact
Error_sum_simp4    = sum_simp4 - exact