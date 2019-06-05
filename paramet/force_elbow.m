l1_1     = AO_1;            % [m] - moving crank

Fmg_p_el = m * g;      % [N] - payload
Fmg_w_el = m_el * g;   % [N] - weigth of the elbow

L_p_el = l_el * cos (Alpha);       % [m] - payload is applied
L_w_el = 1/2 * l_el * cos (Alpha); % [m] - COM of the elbow

Tau_1    = Fmg_p_el * L_p_el + Fmg_w_el * L_w_el;  % [N*m] 

Z_1 = (sin(Beta_1) * cos(Theta_F_1) + cos(Beta_1) * sin(Theta_F_1)) /...
    (sin(Beta_1) + cos(Beta_1) * tan(Theta3_1));

first  = sin(Theta0_1) * (2*Z_1 - cos(Theta_F_1)) ;
second = cos(Theta0_1) * (sin(Theta_F_1) - 2*Z_1*tan(Theta3_1));

C_1 = first + second;

F_1  = Tau_1 / (l1_1 * C_1);

