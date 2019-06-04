clf;
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

gr_el = 1;
gr_sh = 1;

% FontSize
fs_bg = 40;
fs_sm = 20;
% LineWidth
lw_bg = 8;
lw_sm = 1;
% MarkerSize
ms_sm = 10;
ms_bg = 20;

rf_ll = 0.01;
drawArrow = @(x,y,varargin) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0, varargin{:} );

figure('Name', 'Parametrique')

% Ground
 plot([0,0], [rO(1)+0.25, rA(1)-0.25],  '--', 'LineWidth',lw_bg), hold on
 plot( [rOelb(1)-0.1, rC_1(1)+0.1], [rOelb(2), rC_1(2)],  '--'), hold on

%% Shoulder
if gr_sh

% Links
x_g = [rO(1), rA(1), rQ(1), rOelb(1), rQ_1(1), rC(1)];
y_g = [rO(2), rA(2), rQ(2), rOelb(2), rQ_1(2), rC(2)];
plot(x_g, y_g, 'g', 'Linewidth',lw_sm), hold on
patch(x_g, y_g,'green'), hold on
alpha(0.1)

plot([rO(1) , rA(1) ], [rO(2) , rA(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rA(1) , rB(1) ], [rA(2) , rB(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rC(1) , rB(1) ], [rC(2) , rB(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rB(1) , rP(1) ], [rB(2) , rP(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rQ(1) , rP(1) ], [rQ(2) , rP(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rOelb(1), rO(1) ], [rOelb(2), rO(2) ], 'b', 'Linewidth',lw_bg), hold on

% Joints
plot(rO (1,1), rO (1,2), 'rx'), hold on
plot(rC (1,1), rC (1,2), 'rx'), hold on
plot(rB (1,1), rB (1,2), 'rx'), hold on
plot(rA (1,1), rA (1,2), 'rx'), hold on
plot(rP (1,1), rP (1,2), 'rx'), hold on
plot(rQ (1,1), rQ (1,2), 'rx'), hold on
plot(rS (1,1), rS (1,2), 'rx'), hold on

% COM
plot(com_sh_x , com_sh_y , '-o','MarkerSize',ms_bg, 'MarkerEdgeColor','red', 'MarkerFaceColor', 'm'), hold on
plot(x_sh_pl , y_sh_pl , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_cyl   , y_cyl   , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_rod   , y_rod   , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_AB    , y_AB    , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_BP    , y_BP    , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_CB    , y_CB    , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_cyl_1 , y_cyl_1 , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_rod_1 , y_rod_1 , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_AB_1  , y_AB_1  , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_BP_1  , y_BP_1  , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on
plot(x_CB_1  , y_CB_1  , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on   

% Text
text((com_sh_x), (com_sh_y),{'$COM_{sh}$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rO(1,1) ), (rO(1,2) ),{'$O$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rQ(1,1) ), (rQ(1,2) ),{'$Q$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rC(1,1) ), (rC(1,2) ),{'$C$'},'Interpreter','latex', 'FontSize', fs_sm);

text((rB(1,1) ), (rB(1,2) ),{'$B$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rA(1,1) ), (rA(1,2) ),{'$A$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rP(1,1) ), (rP(1,2) ),{'$P$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rS(1,1) ), (rS(1,2) ),{'$S$'},'Interpreter','latex', 'FontSize', fs_sm);

end

%% Elbow
if gr_el 

% Links
plot([rOelb(1), rA_1(1) ], [rOelb(2), rA_1(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rA_1(1) , rB_1(1) ], [rA_1(2) , rB_1(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rC_1(1) , rB_1(1) ], [rC_1(2) , rB_1(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rB_1(1) , rP_1(1) ], [rB_1(2) , rP_1(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rQ_1(1) , rP_1(1) ], [rQ_1(2) , rP_1(2) ], 'g', 'Linewidth',lw_sm), hold on
plot([rOelb(1), rH_1(1) ], [rOelb(2), rH_1(2) ], 'b', 'Linewidth',lw_bg), hold on

% Joints
plot(rOelb(1), rOelb(2), 'rx'), hold on
plot(rC_1(1), rC_1(2), 'rx'), hold on
plot(rB_1(1), rB_1(2), 'rx'), hold on
plot(rA_1(1), rA_1(2), 'rx'), hold on
plot(rP_1(1), rP_1(2), 'rx'), hold on
plot(rQ_1(1), rQ_1(2), 'rx'), hold on
plot(rS_1(1), rS_1(2), 'rx'), hold on
 plot(rH_1(1), rH_1(2), 'rx'), hold on

% COM
plot(com_el_x , com_el_y , '-o','MarkerSize',ms_bg, 'MarkerEdgeColor','red', 'MarkerFaceColor', 'm'), hold on
plot(x_el_pl , y_el_pl , '-s','MarkerSize',ms_sm, 'MarkerEdgeColor','red', 'MarkerFaceColor', [1 .6 .6]), hold on

% Text
text((com_el_x), (com_el_y),{'$COM_{elb}$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rOelb(1)), (rOelb(2)),{'$O_{elb}$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rQ_1(1)), (rQ_1(2)),{'$Q$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rC_1(1)), (rC_1(2)),{'$C$'},'Interpreter','latex', 'FontSize', fs_sm);

text((rB_1(1)), (rB_1(2)),{'$B$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rA_1(1)), (rA_1(2)),{'$A$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rP_1(1)), (rP_1(2)),{'$P$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rS_1(1)), (rS_1(2)),{'$S$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rH_1(1)), (rH_1(2)),{'$H$'},'Interpreter','latex', 'FontSize', fs_bg);
end

% Limits
grid on
grid minor
xlim( [-0.5, 0.5] )
ylim( [-0.5, 0.5] )

