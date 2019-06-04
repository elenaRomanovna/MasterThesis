clf
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

fs_bg = 40;
fs_sm = 30;
lw_bg = 6;
lw_sm = 4;

rf_ll = 0.04;
drawArrow = @(x,y,varargin) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0, varargin{:} );

figure('Name', 'Reaction Forces')
%         p_sh(j,:)  = [ rC, rA, rB, rP, rS, rQ, rOelb];
%         r_uv_sh(j,:) = [B_uv, A_uv, O_uv, C_uv, P_uv];


%% Ground
 plot([0,0], [rO(1)+0.25, p_sh(1,4)-0.25],  '--'), hold on
%  plot( [p_sh(1,19)-0.1, p_el(1,1)+0.1], [p_sh(1,20), p_el(1,2)],  '--'), hold on

%% Shoulder
if gr_sh
% Links
x_g = [rO(1), p_sh(1,4), p_sh(1,16), p_sh(1,19), p_el(1,19), p_sh(1,1)];
y_g = [rO(2), p_sh(1,5), p_sh(1,17), p_sh(1,20), p_el(1,20), p_sh(1,2)];
plot(x_g, y_g, 'm', 'Linewidth',lw_sm), hold on
% patch(x_g, y_g,'green'), hold on
% alpha(0.25)

plot([p_sh(1,19), rO(1) ], [p_sh(1,20), rO(2) ], 'r', 'Linewidth',lw_sm), hold on
plot([p_sh(1,19), rO(1) ], [p_sh(1,20), rO(2) ], 'r', 'Linewidth',lw_sm), hold on
plot([p_sh(1,4) , p_sh(1,7) ], [p_sh(1,5) , p_sh(1,8) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_sh(1,1) , p_sh(1,7) ], [p_sh(1,2) , p_sh(1,8) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_sh(1,7) , p_sh(1,10) ], [p_sh(1,8) , p_sh(1,11) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_sh(1,16) , p_sh(1,10) ], [p_sh(1,17) , p_sh(1,11) ], 'm', 'Linewidth',lw_sm), hold on

% Joints
plot(rO(1), rO(2), 'rx'), hold on
plot(p_sh(1,1), p_sh(1,2), 'rx'), hold on
plot(p_sh(1,7), p_sh(1,8), 'rx'), hold on
plot(p_sh(1,4), p_sh(1,5), 'rx'), hold on
plot(p_sh(1,10), p_sh(1,11), 'rx'), hold on
plot(p_sh(1,16), p_sh(1,17), 'rx'), hold on
plot(p_sh(1,13), p_sh(1,14), 'rx'), hold on


% Reaction Forces vectors
for c_sh = 1:size(r_uv_sh,1)
drawArrow([p_sh(1,7)+rf_ll*r_uv_sh(c_sh,1), p_sh(1,7)], [p_sh(1,8)+rf_ll*r_uv_sh(c_sh,2),p_sh(1,8)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([p_sh(1,4)+rf_ll*r_uv_sh(c_sh,3), p_sh(1,4)], [p_sh(1,5)+rf_ll*r_uv_sh(c_sh,4),p_sh(1,5)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([rO(1)+rf_ll*r_uv_sh(c_sh,5), rO(1)], [rO(2)+rf_ll*r_uv_sh(c_sh,6),rO(2)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([p_sh(1,1)+rf_ll*r_uv_sh(c_sh,7), p_sh(1,1)], [p_sh(1,2)+rf_ll*r_uv_sh(c_sh,8),p_sh(1,2)],'linewidth',lw_bg,'color','r'), hold on
drawArrow([p_sh(1,10)+rf_ll*r_uv_sh(c_sh,9), p_sh(1,10)], [p_sh(1,11)+rf_ll*r_uv_sh(c_sh,10),p_sh(1,11)],'linewidth',lw_bg,'color','r'), hold on
end

% Text
text((rO(1)), (rO(2)),{'$O$'},'Interpreter','latex', 'FontSize', fs_bg);
text((p_sh(1,19)), (p_sh(1,20)),{'$O_{elb}$'},'Interpreter','latex', 'FontSize', fs_bg);
text((p_sh(1,16)), (p_sh(1,17)),{'$Q$'},'Interpreter','latex', 'FontSize', fs_bg);
text((p_sh(1,1)), (p_sh(1,2)),{'$C$'},'Interpreter','latex', 'FontSize', fs_bg);

text((p_sh(1,7)), (p_sh(1,8)),{'$B$'},'Interpreter','latex', 'FontSize', fs_sm);
text((p_sh(1,4)), (p_sh(1,5)),{'$A$'},'Interpreter','latex', 'FontSize', fs_sm);
text((p_sh(1,10)), (p_sh(1,11)),{'$P$'},'Interpreter','latex', 'FontSize', fs_sm);
text((p_sh(1,13)), (p_sh(1,14)),{'$S$'},'Interpreter','latex', 'FontSize', fs_sm);
end

%% Elbow
if gr_el
    
% Links
plot([p_sh(1,19), p_el(1,4) ], [p_sh(1,20), p_el(1,5) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_el(1,4) , p_el(1,7) ], [p_el(1,5) , p_el(1,8) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_el(1,1) , p_el(1,7) ], [p_el(1,2) , p_el(1,8) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_el(1,7) , p_el(1,10) ], [p_el(1,8) , p_el(1,11) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_el(1,19) , p_el(1,10) ], [p_el(1,20) , p_el(1,11) ], 'm', 'Linewidth',lw_sm), hold on
plot([p_sh(1,19), p_el(1,16) ], [p_sh(1,20), p_el(1,17) ], 'm', 'Linewidth',lw_bg), hold on

% Joints
plot(p_sh(1,19), p_sh(1,20), 'rx'), hold on
plot(p_el(1,1) , p_el(1,2) , 'rx'), hold on
plot(p_el(1,7) , p_el(1,8) , 'rx'), hold on
plot(p_el(1,4) , p_el(1,5) , 'rx'), hold on
plot(p_el(1,10) , p_el(1,11) , 'rx'), hold on
plot(p_el(1,19) , p_el(1,20) , 'rx'), hold on
plot(p_el(1,13) , p_el(1,14) , 'rx'), hold on
plot(p_el(1,16) , p_el(1,17) , 'ro'), hold on

% Reaction Forces vectors
for c_el = 1:size(r_uv_el,1)
drawArrow([p_el(1,7)+rf_ll*r_uv_el(c_el,1), p_el(1,7)],   [p_el(1,8)+rf_ll*r_uv_el(c_el,2),p_el(1,8)],  'linewidth',lw_sm,'color','r'), hold on
drawArrow([p_el(1,4)+rf_ll*r_uv_el(c_el,3), p_el(1,4)],   [p_el(1,5)+rf_ll*r_uv_el(c_el,4),p_el(1,5)],  'linewidth',lw_sm,'color','r'), hold on
drawArrow([p_sh(1,19)+rf_ll*r_uv_el(c_el,5), p_sh(1,19)], [p_sh(1,20)+rf_ll*r_uv_el(c_el,6),p_sh(1,20)],'linewidth',lw_sm,'color','r'), hold on
drawArrow([p_el(1,1)+rf_ll*r_uv_el(c_el,7), p_el(1,1)],   [p_el(1,2)+rf_ll*r_uv_el(c_el,8),p_el(1,2)],  'linewidth',lw_sm,'color','r'), hold on
drawArrow([p_el(1,10)+rf_ll*r_uv_el(c_el,9), p_el(1,10)],   [p_el(1,11)+rf_ll*r_uv_el(c_el,10),p_el(1,11)],  'linewidth',lw_sm,'color','r'), hold on
end

% Text
text((p_sh(1,19)), (p_sh(1,20)),{'$O_{elb}$'},'Interpreter','latex', 'FontSize', fs_bg);
text((p_el(1,19) ), (p_el(1,20) ) ,{'$Q$'}      ,'Interpreter','latex', 'FontSize', fs_bg);
text((p_el(1,1) ), (p_el(1,2) ) ,{'$C$'}      ,'Interpreter','latex', 'FontSize', fs_bg);
text((p_el(1,16) ), (p_el(1,17) ) ,{'$H$'}      ,'Interpreter','latex', 'FontSize', fs_bg);

text((p_el(1,7) ), (p_el(1,8) ) ,{'$B$'}      ,'Interpreter','latex', 'FontSize', fs_sm);
text((p_el(1,4) ), (p_el(1,5) ) ,{'$A$'}      ,'Interpreter','latex', 'FontSize', fs_sm);
text((p_el(1,10) ), (p_el(1,11) ) ,{'$P$'}      ,'Interpreter','latex', 'FontSize', fs_sm);
text((p_el(1,13) ), (p_el(1,14) ) ,{'$S$'}      ,'Interpreter','latex', 'FontSize', fs_sm);

end

%% Limits
grid on
grid minor
xlim( [-0.5, 0.5] )
ylim( [-0.5, 0.5] )

