clear
clc
format long

MAX = 10001;
dx = 200 * pi / MAX;              % Δx
j = -MAX;
A = 1.125;                        % 9/8, 4次精度差分の係数

exact = zeros(1, 2*MAX+1);        % (sinc)' = ( xcosx - sinx )/x^2
input_sinc = zeros(1, 2*MAX+1);   % sinc = sinx/x

% (sinc)'
fd_f1 = zeros(1, 2*MAX+1);
fd_b1 = zeros(1, 2*MAX+1);
fd_c2 = zeros(1, 2*MAX+1);
fd_c4 = zeros(1, 2*MAX+1);

% RMSE
rsme_f1 = zeros;
rsme_b1 = zeros;
rsme_c2 = zeros;
rsme_c4 = zeros;
%%
% sincの離散化

% sincの微分
for i = 1:2*MAX+1
    
    exact(i) = cos(pi*j*dx)/(j*dx) - sin(pi*j*dx)/((j*dx)^2*pi);
    j = j + 1;
end;
    exact(MAX+1) = 1;
j = -MAX;

% sinc関数
for i = 1:2*MAX+1    
    input_sinc(i) = sinc(j*dx);
    j = j + 1;
end;
j = -MAX;
%%
% 近似

% 前進差分
for i = 2:2*MAX
    fd_f1(i) = (input_sinc(i+1) - input_sinc(i)) / dx;
end;

% 後退差分
for i = 2:2*MAX
    fd_b1(i) = (input_sinc(i) - input_sinc(i-1)) / dx;
end;

% 中心差分
for i = 2:2*MAX
    fd_c2(i) = (input_sinc(i+1) - input_sinc(i-1)) / (2*dx);
end;

% ４次精度差分
for i = 4:2*MAX-3
    fd_c4(i) = A * ((input_sinc(i+1) - input_sinc(i - 1)) / (2*dx)) + (1 - A) * ((input_sinc(i + 3) - input_sinc(i - 3)) / (6*dx));
end;
%%
% RSME

% 前進差分
for i = 2:2*MAX
    rsme_f1 = rsme_f1 + abs(( fd_f1(i)-exact(i))) * dx;
end;

% 後退差分
for i = 2:2*MAX
    rsme_b1 = rsme_b1 + abs((fd_b1(i) - exact(i))) * dx;
end;

% 中心差分
for i = 2:2*MAX+1
    rsme_c2 = rsme_c2 + abs((fd_c2(i) - exact(i))) * dx;
end;

% ４次精度差分
for i = 4:2*MAX-3
    rsme_c4 = rsme_c4 + abs((fd_c4(i) - exact(i))) * dx;
end;

rsme_f1
rsme_b1
rsme_c2
rsme_c4