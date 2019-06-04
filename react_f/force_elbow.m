Z_1 = (sin(Beta_1) * cos(Theta_F_1) + cos(Beta_1) * sin(Theta_F_1)) /...
    (sin(Beta_1) + cos(Beta_1) * tan(Theta3_1));

F_1  = m*g;
F_x_1 = F_1 * cos(Theta_F_1);
F_y_1 = F_1 * sin(Theta_F_1);

% -- B_rx_ry --
R_bx_1 = -2 * F_1 * Z_1;
R_by_1 = -2 * F_1 * Z_1 * tan(Theta3_1);

% -- A --
R_ax_1 = -F_x_1 - R_bx_1;
R_ay_1 = -F_y_1 - R_by_1;
M_az_1 = -sin(Beta) * (R_bx_1 * AB_1 + 2 * F_x_1 * AB_1) - cos(Beta) * (R_by_1 * AB_1 + 2 * F_y_1 * AB_1);
rfA_1 = [M_az_1, R_ax_1, R_ay_1];

% -- B_mz --
M_bz_1 = R_ax_1 * AB_1 * sin(Beta_1) + R_ay_1 * AB_1 * cos(Beta_1) - F_x_1 * BP_1 * sin(Beta_1) - F_y_1 * BP_1 * cos(Beta_1);
rfB_1 = [M_bz_1, R_bx_1, R_by_1];

% -- O --
R_ox_1 = R_ax_1;
R_oy_1 = R_ay_1;
M_oz_1 = R_ax_1 * AO_1 * sin(Theta0_1) - R_ay_1 * AO_1 * cos(Theta0_1);
rfO_1 = [M_oz_1, R_ox_1, R_oy_1];

% -- C --
R_cx_1 = R_bx_1;
R_cy_1 = R_by_1;
M_cz_1 = R_bx_1 * CB_1 * sin(Theta3_1) - R_by_1 * CB_1 * cos(Theta3_1);
rfC_1 = [M_cz_1, R_cx_1, R_cy_1];

% -- P --
str_1 = norm (rP_1 - rS_1);
R_cx_1 = F_x_1;
R_cy_1 = F_y_1;
M_cz_1 = F_x_1 * str_1 * sin(Theta_F_1) - F_y_1 * str_1 * cos(Theta_F_1);
rfP_1 = [M_cz_1, R_cx_1, R_cy_1];

