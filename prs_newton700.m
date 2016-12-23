%%% �p�x��ω������ĉ����F�p�x�G�c���F�򋗗��Ƃ��ăv���b�g %%%

clear;

%%% ��`�E�����l�Z�N�V���� %%%

% �K�v�ȏ��F�����x(�K�{)�ƁA�����ʂƂ̂��̊p�x(�K�{)�A�����ʒu(�C��)
% �K�v�Ȕz��F�����x�Ƃ����x�A���ʒu�Ƃ��ʒu�A�p�x(�C��)
% 
% �A���S���Y���F
% �� �܂������x�Ƃ��̓��ˊp���炘���x�Ƃ����x���ꂼ��̏����x�����߂�
% �� ���ɁA���ꂼ��̎���ԂɁA�O��Ԃ��Q�Ƃ����v�Z�l���^���������ɂȂ���ăI�C���[�@�ő������
% �� ��������Ƃɂ��ꂼ��̈ʒu�����߂�
% �� ���̌J��Ԃ����������
% �� �J��Ԃ�����̉ߒ��ŁA���ʒu���O�ɂȂ邘�ʒu�A���Ȃ킿�򋗗������߂�
% 
% ���ӎ����F
% �� �S����R�Ɗ�����R�̒l���������I��
% ���� �o����A������Rb��e-5�A�S����Rk��e-2�قǂ炵��
% �� ��C��R�̂������Ƃ������͑��x�̂������Ƃ������ɑΉ�������̂Ƃ���

% definitions
Time = 2050;          % �J��Ԃ��� (=����)
dt   = 0.01;          % ��������
g    = 9.8;           % gravity
k    = 0.008;         % �S����R (Air: 1.809e-04; Water: 0.797e-02)
b    = 0.00001;       % ������R (Air: )
m    = 100;           % mass

aData = 181;          % �ΏƂ���f�[�^��

v_0  = 1000;          % first velocity
sx_0 = 0;             % first position of x
sy_0 = 0;             % first position of y

vx = zeros(Time, aData);    % velocity of x(����, �p�x)
vy = zeros(Time, aData);    % velocity of y
sx = zeros(Time, aData);    % position of x
sy = zeros(Time, aData);    % position of y
distance = zeros(aData, 1); % �ő�򋗗�

%%% �v�Z�Z�N�V���� %%%

% calc
for a = 1 : aData    % 0<a<90 ��180�����A180��̎��s
    % calc defaults
    a_0 = (a/aData)*(pi/2);    % ���ˊp
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
    
    % ��򋗗��̒T���̎d�����킩��Ȃ���
    for t = 2 : Time    % t�͎����T���̂��߂̃C�e���[�^
        if sy(t, a) <= 0    % ���ʒu��0�ȉ��ɂȂ�Ƃ��̂��ʒu��򋗗��Ƃ���
            distance(1, a) = sx(t, a);
        end;
    end;
end;


%%% �v���b�g�Z�N�V���� %%%
% % �O���̕\��
% plot(sx,sy)
% axis equal
% grid on
% xlim([-10 1400])
% ylim([-500 500])
% xlabel('���� (����)')
% ylabel('���� (����)')

% �򋗗��̕\��
plot(distance)
xlim([0 180])
xlabel('�p�x 0<a<pi/2')