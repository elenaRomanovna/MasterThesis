%% D1 material for elbow-shoulder plates
l_sh_pl = 0.36;   % [m]
h_sh_pl = 0.121;  % [m]
w_sh_pl = 0.0125; % [m]
V_sh_pl = l_sh_pl * h_sh_pl * w_sh_pl; % [m^3]
m_sh_pl = V_sh_pl * d1;          % [kg]

l_el_pl = 0.2903; % [m]
h_el_pl = 0.053;  % [m]
w_el_pl = 0.0125; % [m]
V_el_pl = l_el_pl * h_el_pl * w_el_pl; % [m^3]
m_el_pl = V_el_pl * d1;          % [kg]

%% D2 material for VSA
QS   = 0.160; % [m]
QS_1 = QS;    % [m]

Ro_cyl = 0.035/2; % [m]
ho_cyl = QS; 
Ri_cyl = 0.031/2; % [m]
hi_cyl = 0.140;   % [m]

V_cyl = pi * Ro_cyl * ho_cyl - pi * Ri_cyl * hi_cyl; % [m^3]
m_cyl = V_cyl * d2;                                  % [kg]

Ro_rod = 0.020/2; % [m]
ho_rod = 0.110;   % [m]
Ri_rod = 0.016/2; % [m]
hi_rod = 0.09;   % [m]

V_rod =  pi * Ro_rod * ho_rod - pi * Ri_rod * hi_rod; % [m^3]
m_rod = V_rod * d2;          % [kg]

%% D3 material for mechanism 
% Shoulder
AO = 0.0203;  % [m] 
OC = 0.04466; % [m]

AB   = 0.05692; % [m] 
h_AB = 0.015;
w_AB = 0.0125;  % [m]
V_AB = AB * h_AB * w_AB; % [m^3]
m_AB = V_AB * d3;        % [kg]

BP   = AB;   % [m]
m_BP = m_AB; % [kg]

CB = AB;      % [m]
h_CB = 0.025; % [m]
w_CB = 0.0125;  % [m]
V_CB = CB * h_CB * w_CB; % [m^3]
m_CB = V_CB * d3;        % [kg]

% Elbow
AO_1 = 0.02346; % [m] 

AB_1   = 0.05692; % [m] 
h_AB_1 = 0.0208;  % [m]
w_AB_1 = 0.0125;  % [m]
V_AB_1 = AB_1 * h_AB_1 * w_AB_1; % [m^3]
m_AB_1 = V_AB_1 * d3;            % [kg]

BP_1 = AB_1;     % [m] 
m_BP_1 = m_AB_1; % [kg]

CB_1   = AB_1;    % [m]
h_CB_1 = 0.025;   % [m]
w_CB_1 = 0.0125;  % [m]
V_CB_1 = CB_1 * h_CB_1 * w_CB_1; % [m^3]
m_CB_1 = V_CB_1 * d3;            % [kg]

%% Mass 
m_sh = [m_sh_pl; m_cyl; m_rod; m_AB; m_BP; m_CB; m_cyl; m_rod; m_AB_1; m_BP_1; m_CB_1];
m_el = m_el_pl;

[sum(m_sh), m_el]

