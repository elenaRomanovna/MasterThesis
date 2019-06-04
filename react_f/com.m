%% Elbow
x_el_pl = (rH_1(1) + rOelb(1)).'/2;
y_el_pl = (rH_1(2) + rOelb(2)).'/2;

x_el = x_el_pl;
y_el = y_el_pl;

com_el_x = (m_el.*x_el)/sum(m_el);
com_el_y = (m_el.*y_el)/sum(m_el);

%% Shoulder
% -- x --
x_sh_pl = (rO(1) + rOelb(1)).'/2;
x_cyl   = (rQ(1) + rS(1)).'/2;
x_rod   = (rS(1) + rP(1)).'/2;
x_AB    = (rA(1) + rB(1)).'/2;
x_BP    = (rB(1) + rP(1)).'/2;
x_CB    = (rC(1) + rB(1)).'/2;

x_cyl_1 = (rQ_1(1) + rS_1(1)).'/2;
x_rod_1 = (rS_1(1) + rP_1(1)).'/2;
x_AB_1  = (rA_1(1) + rB_1(1)).'/2;
x_BP_1  = (rB_1(1) + rP_1(1)).'/2;
x_CB_1  = (rC_1(1) + rB_1(1)).'/2;

% -- y --
y_sh_pl = (rO(2) + rOelb(2)).'/2;
y_cyl   = (rQ(2) + rS(2)).'/2;
y_rod   = (rS(2) + rP(2)).'/2;
y_AB    = (rA(2) + rB(2)).'/2;
y_BP    = (rB(2) + rP(2)).'/2;
y_CB    = (rC(2) + rB(2)).'/2;

y_cyl_1 = (rQ_1(2) + rS_1(2)).'/2;
y_rod_1 = (rS_1(2) + rP_1(2)).'/2;
y_AB_1  = (rA_1(2) + rB_1(2)).'/2;
y_BP_1  = (rB_1(2) + rP_1(2)).'/2;
y_CB_1  = (rC_1(2) + rB_1(2)).'/2;

x_sh = [x_sh_pl; x_cyl; x_rod; x_AB; x_BP; x_CB; x_cyl_1; x_rod_1; x_AB_1; x_BP_1; x_CB_1];
y_sh = [y_sh_pl; y_cyl; y_rod; y_AB; y_BP; y_CB; y_cyl_1; y_rod_1; y_AB_1; y_BP_1; y_CB_1];

com_sh_x = sum(m_sh.*x_sh)/sum(m_sh);
com_sh_y = sum(m_sh.*y_sh)/sum(m_sh);

com_el = [com_el_x, com_el_y];
com_sh = [com_sh_x, com_sh_y];