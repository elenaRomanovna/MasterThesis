clf;
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 
set(groot, 'defaultLegendInterpreter','latex');

figure(1)
%% Ground
plot([rO(1)-0.25, rA(1)+0.25], [0,0], '--'), hold on 

%% Shoulder
% LINKS
plot([rO(1) , rC1(1) , rC2(1) , rOelb(1) , rO(1) ], [rO(2) , rC1(2) , rC2(2) , rOelb(2) , rO(2) ], 'Linewidth',2), hold on 
x_g = [rO(1) , rC1(1) , rC2(1) , rOelb(1) , rO(1) ];
y_g = [rO(2) , rC1(2) , rC2(2) , rOelb(2) , rO(2) ];

patch(x_g, y_g,'green'), hold on
alpha(0.25)

plot([rA(1) , rB1(1) , rP(1)   ], [rA(2) , rB1(2), rP(2)   ], 'Linewidth',0.5), hold on
plot([rQ(1) , rP(1) ], [rQ(2) , rP(2) ], 'Linewidth',0.5), hold on
plot([rC1(1) , rB3(1) ], [rC1(2) , rB3(2) ], 'Linewidth',0.5), hold on
plot([rC2(1) , rB2(1) ], [rC2(2) , rB2(2) ], 'Linewidth',0.5), hold on
plot([rB1(1), rB2(1),  rB3(1), rB1(1)], [rB1(2), rB2(2),  rB3(2), rB1(2)], 'Linewidth',0.5), hold on

% JOINTS
plot(rO (1,1), rO (1,2), '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]), hold on
plot(rA(1,1), rA (1,2), '-s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 .6 .6]), hold on

plot(rQ (1,1), rQ (1,2), 'rx'), hold on
plot(rB1 (1,1), rB1 (1,2), 'rx'), hold on
plot(rC1 (1,1), rC1 (1,2), 'rx'), hold on
plot(rC2 (1,1), rC2 (1,2), 'rx'), hold on
plot(rB3 (1,1), rB3 (1,2), 'rx'), hold on
plot(rP (1,1), rP (1,2), 'ro'), hold on
plot(rS (1,1), rS (1,2), 'ro'), hold on

%% Text
s1=text((rO (1,1) ), (rO (1,2) ),'O'), hold on 
s1.FontSize = 20;
s2=text((rA (1,1) ), (rA (1,2) ),'A'), hold on 
s2.FontSize = s1.FontSize;
s3=text((rQ (1,1) ), (rQ (1,2) ),'Q'), hold on 
s3.FontSize = s1.FontSize;
s9=text((rP (1,1) ), (rP (1,2) ),'P'), hold on 
s9.FontSize = s1.FontSize;
s10=text((rS (1,1) ), (rS (1,2) ),'S'), hold on 
s10.FontSize = s1.FontSize;

s4=text((rB1 (1,1) ), (rB1 (1,2) ),'B1'), hold on 
s4.FontSize = 15;
s5=text((rC1 (1,1) ), (rC1 (1,2) ),'C1'), hold on 
s5.FontSize = s4.FontSize;
s6=text((rC2 (1,1) ), (rC2 (1,2) ),'C2'), hold on 
s6.FontSize = s4.FontSize;
s7=text((rB3 (1,1) ), (rB3 (1,2) ),'B3'), hold on 
s7.FontSize = s4.FontSize;
s8=text((rB2 (1,1) ), (rB2 (1,2) ),'B2'), hold on 
s8.FontSize = s4.FontSize;
%% Elbow
% Links
plot([rOelb(1), rA_1(1) ], [rOelb(2), rA_1(2) ], 'Linewidth',0.5), hold on 
plot([rA_1(1) , rB_1(1) ], [rA_1(2) , rB_1(2) ], 'Linewidth',0.5), hold on
plot([rC_1(1) , rB_1(1) ], [rC_1(2) , rB_1(2) ], 'Linewidth',0.5), hold on
plot([rB_1(1) , rP_1(1) ], [rB_1(2) , rP_1(2) ], 'Linewidth',0.5), hold on
plot([rQ_1(1) , rP_1(1) ], [rQ_1(2) , rP_1(2) ], 'Linewidth',0.5), hold on
plot([rOelb(1), rH_1(1) ], [rOelb(2), rH_1(2) ], 'Linewidth',4), hold on

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
s1=text((rOelb(1,1) ), (rOelb (1,2) ),'O'), hold on
s1.FontSize = 20;
s3=text((rQ_1 (1,1) ), (rQ_1 (1,2) ),'Q'), hold on
s3.FontSize = s1.FontSize;
s5=text((rC_1 (1,1) ), (rC_1 (1,2) ),'C'), hold on
s5.FontSize = s1.FontSize;

s4=text((rB_1 (1,1) ), (rB_1 (1,2) ),'B'), hold on
s4.FontSize = 15;
s2=text((rA_1 (1,1) ), (rA_1 (1,2) ),'A'), hold on
s2.FontSize = s4.FontSize;
s6=text((rP_1 (1,1) ), (rP_1 (1,2) ),'P'), hold on
s6.FontSize = s4.FontSize;
s7=text((rS_1 (1,1) ), (rS_1 (1,2) ),'S'), hold on
s7.FontSize = s4.FontSize;
s8=text((rH_1 (1,1) ), (rH_1 (1,2) ),'H'), hold on
s8.FontSize = s4.FontSize;

%% Limits
grid on
grid minor
xlim( [-1, 1] )
ylim( [-1, 1] )
