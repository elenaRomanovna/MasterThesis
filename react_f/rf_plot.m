clf;
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

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

figure('Name', 'Reaction Forces')
%% Shoulder
if gr_sh

%% Ground
 plot([0,0], [rO(1)+0.25, rA(1)-0.25],  '--', 'LineWidth',lw_bg), hold on
 
% Reaction Forces vectors
for c_sh = 1:size(r_uv_sh,1)
drawArrow([rB(1)+rf_ll*r_uv_sh(c_sh,1), rB(1)], [rB(2)+rf_ll*r_uv_sh(c_sh,2),rB(2)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([rA(1)+rf_ll*r_uv_sh(c_sh,3), rA(1)], [rA(2)+rf_ll*r_uv_sh(c_sh,4),rA(2)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([rO(1)+rf_ll*r_uv_sh(c_sh,5), rO(1)], [rO(2)+rf_ll*r_uv_sh(c_sh,6),rO(2)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([rC(1)+rf_ll*r_uv_sh(c_sh,7), rC(1)], [rC(2)+rf_ll*r_uv_sh(c_sh,8),rC(2)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([rP(1)+rf_ll*r_uv_sh(c_sh,9), rP(1)], [rP(2)+rf_ll*r_uv_sh(c_sh,10),rP(2)],'linewidth',lw_bg,'color','r'), hold on
end

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
plot([rOelb(1), rO(1) ], [rOelb(2), rO(2) ], 'b', 'Linewidth',lw_sm), hold on
plot([rOelb(1), rH_1(1) ], [rOelb(2), rOH_1(2) ], 'b', 'Linewidth',lw_sm), hold on

% Joints
plot(rO (1,1), rO (1,2), 'rx'), hold on
plot(rC (1,1), rC (1,2), 'rx'), hold on
plot(rB (1,1), rB (1,2), 'rx'), hold on
plot(rA (1,1), rA (1,2), 'rx'), hold on
plot(rP (1,1), rP (1,2), 'rx'), hold on
plot(rQ (1,1), rQ (1,2), 'rx'), hold on
plot(rS (1,1), rS (1,2), 'rx'), hold on

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
%% Ground
plot( [rOelb(1)-0.1, rC_1(1)+0.1], [rOelb(2), rC_1(2)],  '--'), hold on

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

% Reaction Forces vectors
for c_el = 1:size(r_uv_el,1)
drawArrow([rB_1(1)+rf_ll*r_uv_el(c_el,1), rB_1(1)],   [rB_1(2)+rf_ll*r_uv_el(c_el,2),rB_1(2)],  'linewidth',lw_sm,'color','r'), hold on
drawArrow([rA_1(1)+rf_ll*r_uv_el(c_el,3), rA_1(1)],   [rA_1(2)+rf_ll*r_uv_el(c_el,4),rA_1(2)],  'linewidth',lw_sm,'color','r'), hold on
drawArrow([rOelb(1)+rf_ll*r_uv_el(c_el,5), rOelb(1)], [rOelb(2)+rf_ll*r_uv_el(c_el,6),rOelb(2)],'linewidth',lw_sm,'color','r'), hold on
drawArrow([rC_1(1)+rf_ll*r_uv_el(c_el,7), rC_1(1)],   [rC_1(2)+rf_ll*r_uv_el(c_el,8),rC_1(2)],  'linewidth',lw_sm,'color','r'), hold on
drawArrow([rP_1(1)+rf_ll*r_uv_el(c_el,9), rP_1(1)],   [rP_1(2)+rf_ll*r_uv_el(c_el,10),rP_1(2)],  'linewidth',lw_sm,'color','r'), hold on
end


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

%% Limits
grid on
grid minor
xlim( [-0.5, 0.5] )
ylim( [-0.5, 0.5] )

