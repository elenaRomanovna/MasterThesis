Z = (cos(Beta) * sin(Theta_F) -  sin(Beta) * cos(Theta_F)) / (sin(Beta) - cos(Beta) * tan(Theta3));

F = 1;
F_x = F * cos(Theta_F);
F_y = F * sin(Theta_F);

% -- B_rx_ry --
R_bx = 2 * F * Z;
R_by = 2 * F * Z * tan(Theta3);

% -- C --
R_cx = -R_bx;
R_cy = -R_by;
M_cz = R_bx * CB * sin(Theta3) - R_by * CB * cos(Theta3);
rfC = [M_cz, R_cx, R_cy];

% -- O --
R_ox = -R_cx;
R_oy = -R_cy;
M_oz = R_cx * OC * sin(Theta0) + R_cy * OC * cos(Theta0);
rfO = [M_oz, R_ox, R_oy];

% -- A --
R_ax = -R_bx - F_x;
R_ay = -R_by - F_y;
M_az = sin(Beta) * (R_bx + 2*F_x) + cos(Beta) * (R_by + 2*F_y);
rfA = [M_az, R_ax, R_ay];

% -- B_mz --
M_bz = -R_ax * AB * sin(Beta) + R_ay * AB * cos(Beta) + F_x * BP * sin(Beta) - F_y * BP * cos(Beta) ;
rfB = [M_bz, R_bx, R_by];

% -- P --
str = norm (rP - rS);
R_px = F_x;
R_py = F_y;
M_pz = F_x * str * sin(Theta_F) - F_y * str * cos(Theta_F);
rfP = [M_pz, R_px, R_py];


