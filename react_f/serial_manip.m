%% Init
m_sh = sum(m_sh);

I_sh = m_sh * l_sh_pl^2/3;
I_el = m_el * l_el_pl^2/3;

lc_sh = norm(rO(1:2) - com_sh);
lc_el = norm(rO(1:2) - com_el);
% l_sh_pl
% l_el_pl

q1 = Alpha;                          % q1
q2 = Alpha_1; % q2
q3 = Alpha+Alpha_1;                        % q1+q2

%% Jacobian
J_sh = [-lc_sh*sin(q1), 0;
    lc_sh*cos(q1),      0;
    0,                  0];

J_el = [-lc_sh*sin(q1) - lc_el*sin(q3), -lc_el*sin(q3);
    lc_sh*cos(q1) + lc_el*cos(q3),    lc_el*cos(q3);
    0,                                        0];

%% Inertia Matrix
%     || m_2*(l1^2 + 2*l1*lc2*cos(Theta2)+lc2^2) + m1*lc1^2 + I1 + I2  |  m2*l1*lc2*cos(Theta2) + m2*lc2^2+I2 || 
% M =  
%     || m2*l1*lc2*cos(Theta2) + m2lc2^2 + I2                          |  m2*lc2^2 + I2                       ||
M = zeros(2,2);

M(1,1) = m_el*(l_sh_pl^2 + 2*l_sh_pl*lc_el*cos(q2)+lc_el^2) + m_sh*lc_sh^2 + I_sh + I_el;
M(2,1) = m_el*l_sh_pl*lc_el*cos(q2) + m_el*lc_el^2 + I_el;
M(1,2) = M(2,1);
M(2,2) = m_el*lc_el^2 + I_el;

%% Christoffel Symbols
% 1/2 * (dM / dq)
h_cs = -m_el * l_sh_pl * lc_el * sin(q2);
c_111 = 0;
c_121 = h_cs;
c_211 = c_121;
c_221 = h_cs;
c_112 = -h_cs;
c_122 = 0;
c_212 = c_122;
c_222 = 0;

%% Potential Energy
P_1 = m_sh * g * lc_sh * sin(q1);
P_2 = m_el * g * (l_sh_pl * sin(q1) + lc_el * sin(q3));
P   = P_1 + P_2;

%%
ph_1 = (m_sh*lc_sh + m_el*lc_el)*g*cos(q1) + m_el*lc_el*g*cos(q3);
ph_2 = m_el*lc_el*cos(q3);


