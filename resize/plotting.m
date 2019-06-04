clf;
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

fs_bg = 20;
fs_sm = 15;
lw_bg = 6;
lw_sm = 2;

figure(1)
%% Ground
 plot([0,0], [rO(1)+0.25, rA(1)-0.25],  '--'), hold on
%  plot( [rOelb(1)-0.1, rC_1(1)+0.1], [rOelb(2), rC_1(2)],  '--'), hold on

%% Shoulder
% Links
x_g = [rO(1), rA(1), rQ(1), rOelb(1), rQ_1(1), rC(1)];
y_g = [rO(2), rA(2), rQ(2), rOelb(2), rQ_1(2), rC(2)];
plot(x_g, y_g, 'Linewidth',lw_sm), hold on
patch(x_g, y_g,'green'), hold on
alpha(0.25)

plot([rO(1), rA(1) ], [rO(2), rA(2) ], 'Linewidth',lw_sm), hold on
plot([rA(1) , rB(1) ], [rA(2) , rB(2) ], 'Linewidth',lw_sm), hold on
plot([rC(1) , rB(1) ], [rC(2) , rB(2) ], 'Linewidth',lw_sm), hold on
plot([rB(1) , rP(1) ], [rB(2) , rP(2) ], 'Linewidth',lw_sm), hold on
plot([rQ(1) , rP(1) ], [rQ(2) , rP(2) ], 'Linewidth',lw_sm), hold on

% Joints
plot(rO (1,1), rO (1,2), '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]), hold on
plot(rC (1,1), rC (1,2), '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]), hold on
plot(rB (1,1), rB (1,2), 'rx'), hold on
plot(rA (1,1), rA (1,2), 'rx'), hold on
plot(rP (1,1), rP (1,2), 'rx'), hold on
plot(rQ (1,1), rQ (1,2), 'rx'), hold on
plot(rS (1,1), rS (1,2), 'rx'), hold on

% Text

text((rO(1,1) ), (rO(1,2) ),{'$O$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rQ(1,1) ), (rQ(1,2) ),{'$Q$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rC(1,1) ), (rC(1,2) ),{'$C$'},'Interpreter','latex', 'FontSize', fs_bg);

text((rB(1,1) ), (rB(1,2) ),{'$B$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rA(1,1) ), (rA (1,2) ),{'$A$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rP(1,1) ), (rP(1,2) ),{'$P$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rS(1,1) ), (rS(1,2) ),{'$S$'},'Interpreter','latex', 'FontSize', fs_sm);

%% Elbow
% Links
plot([rOelb(1), rA_1(1) ], [rOelb(2), rA_1(2) ], 'Linewidth',lw_sm), hold on
plot([rA_1(1) , rB_1(1) ], [rA_1(2) , rB_1(2) ], 'Linewidth',lw_sm), hold on
plot([rC_1(1) , rB_1(1) ], [rC_1(2) , rB_1(2) ], 'Linewidth',lw_sm), hold on
plot([rB_1(1) , rP_1(1) ], [rB_1(2) , rP_1(2) ], 'Linewidth',lw_sm), hold on
plot([rQ_1(1) , rP_1(1) ], [rQ_1(2) , rP_1(2) ], 'Linewidth',lw_sm), hold on
plot([rOelb(1), rH_1(1) ], [rOelb(2), rH_1(2) ], 'Linewidth',lw_bg), hold on

% Joints
plot(rOelb (1,1), rOelb (1,2), '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]), hold on
plot(rC_1 (1,1), rC_1 (1,2), '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]), hold on
plot(rB_1 (1,1), rB_1 (1,2), 'rx'), hold on
plot(rA_1 (1,1), rA_1 (1,2), 'rx'), hold on
plot(rP_1 (1,1), rP_1 (1,2), 'rx'), hold on
plot(rQ_1 (1,1), rQ_1 (1,2), 'rx'), hold on
plot(rS_1 (1,1), rS_1 (1,2), 'rx'), hold on
plot(rH_1 (1,1), rH_1 (1,2), 'ro'), hold on

% Text
text((rOelb(1,1) ), (rOelb (1,2) ),{'$O_{elb}$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rQ_1 (1,1) ), (rQ_1 (1,2) ),{'$Q$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rC_1 (1,1) ), (rC_1 (1,2) ),{'$C$'},'Interpreter','latex', 'FontSize', fs_bg);
text((rH_1 (1,1) ), (rH_1 (1,2) ),{'$H$'},'Interpreter','latex', 'FontSize', fs_bg);

text((rB_1 (1,1) ), (rB_1 (1,2) ),{'$B$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rA_1 (1,1) ), (rA_1 (1,2) ),{'$A$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rP_1 (1,1) ), (rP_1 (1,2) ),{'$P$'},'Interpreter','latex', 'FontSize', fs_sm);
text((rS_1 (1,1) ), (rS_1 (1,2) ),{'$S$'},'Interpreter','latex', 'FontSize', fs_sm);


%% Limits
grid on
grid minor
xlim( [-1, 1] )
ylim( [-1, 1] )

