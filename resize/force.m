l1 = OC; % [m] - moving crank

Fmg_p_el = -m * g;                % [N] - payload
Fmg_w_el = -m_el * g;             % [N] - weigth of the elbow
Fmg_w_sh = -(m_sh + 2*m_act) * g; % [N] - weigth of the shoulder with 2 actuators

L_p_el = l_el * cos (Alpha_1) + l_sh * cos (Alpha+deg2rad(7));       % [m] - payload is applied
L_w_el = 1/2 * l_el * cos (Alpha_1) + l_sh * cos (Alpha+deg2rad(7)); % [m] - COM of the elbow
L_w_sh = 1/2 * l_sh * cos (Alpha+deg2rad(7));                        % [m] - COM of the shoulder

% Tau    = Fmg_p_el*L_p_el + Fmg_w_el*L_w_el + Fmg_w_sh*L_w_sh;  % [N*m] 

Tau    = 7133;

Z = (cos(Beta) * sin(Theta_F) -  sin(Beta) * cos(Theta_F)) / (sin(Beta) - cos(Beta) * tan(Theta3));

C = sin(Theta0) + cos(Theta0) * tan(Theta3);

F  = Tau / (-2 * l1 * Z * C);

