%%% 角度を変化させて横軸：角度；縦軸：飛距離としてプロット %%%

clear;

%%% 定義・初期値セクション %%%

% 必要な情報：初速度(必須)と、水平面とのその角度(必須)、初期位置(任意)
% 必要な配列：ｘ速度とｙ速度、ｘ位置とｙ位置、角度(任意)
% 
% アルゴリズム：
% ＞ まず初速度とその投射角からｘ速度とｙ速度それぞれの初速度を求める
% ＞ 次に、それぞれの次状態に、前状態を参照した計算値を運動方程式にならってオイラー法で代入する
% ＞ それをもとにそれぞれの位置も求める
% ＞ この繰り返し制御をする
% ＞ 繰り返し制御の過程で、ｙ位置が０になるｘ位置、すなわち飛距離を求める
% 
% 注意事項：
% ＞ 粘性抵抗と慣性抵抗の値をいくつか選ぶ
% ＞＞ 経験上、慣性抵抗bはe-5、粘性抵抗kはe-2ほどらしい
% ＞ 空気抵抗のｘ成分とｙ成分は速度のｘ成分とｙ成分に対応するものとした

% definitions
Time = 2050;          % 繰り返し回数 (=時間)
dt   = 0.01;          % 微小時間
g    = 9.8;           % gravity
k    = 0.008;         % 粘性抵抗 (Air: 1.809e-04; Water: 0.797e-02)
b    = 0.00001;       % 慣性抵抗 (Air: )
m    = 100;           % mass

aData = 181;          % 対照するデータ数

v_0  = 1000;          % first velocity
sx_0 = 0;             % first position of x
sy_0 = 0;             % first position of y

vx = zeros(Time, aData);    % velocity of x(時間, 角度)
vy = zeros(Time, aData);    % velocity of y
sx = zeros(Time, aData);    % position of x
sy = zeros(Time, aData);    % position of y
distance = zeros(aData, 1); % 最大飛距離

%%% 計算セクション %%%

% calc
for a = 1 : aData    % 0<a<90 を180分割、180回の試行
    % calc defaults
    a_0 = (a/aData)*(pi/2);    % 投射角
    vx(1, a) = v_0 * cos(a_0);
    vy(1, a) = v_0 * sin(a_0);
    sx(1, a) = sx_0;
    sx(1, a) = sy_0;
    
    % calc data
    for t = 1 : Time
        vx(t+1, a) = vx(t, a) - (k/m)*vx(t, a)*dt - (b/m)*vx(t, a)^2*dt;
        sx(t+1, a) = sx(t, a) + vx(t, a)*dt;
        vy(t+1, a) = vy(t, a) - (k/m)*vy(t, a)*dt - (b/m)*vy(t, a)^2*dt - g*dt;
        sy(t+1, a) = sy(t, a) + vy(t, a)*dt;
    end;
    
    % ≪飛距離の探索の仕方がわからない≫
    for t = 2 : Time    % tは時刻探索のためのイテレータ
        if sy(t, a) <= 0    % ｙ位置が0以下になるときのｘ位置を飛距離とする
            distance(1, a) = sx(t, a);
        end;
    end;
end;


%%% プロットセクション %%%
% % 軌道の表示
% plot(sx,sy)
% axis equal
% grid on
% xlim([-10 1400])
% ylim([-500 500])
% xlabel('ｘ軸 (距離)')
% ylabel('ｙ軸 (高さ)')

% 飛距離の表示
plot(distance)
xlim([0 180])
xlabel('角度 0<a<pi/2')