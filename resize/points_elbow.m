function [ rC, rA, rB, rP, rS, rH, rQ ] = points_elbow( phi, Oelb, AB, BP, CB, AO, QS, OH )

R = rotz(Oelb(3));
%% -- O --
xO = Oelb(1);
yO = Oelb(2);

%% -- Q --
v_Q = [-0.23965; 0.08628];
xQ = xO + R(1,:) * v_Q;
yQ = yO + R(2,:) * v_Q;
rQ = [xQ yQ 0];

%% -- C --
v_C = [-0.04466; 0];
xC = xO + R(1,:) * v_C;
yC = yO + R(2,:) * v_C;
rC = [xC yC 0];

%% -- H --
v_H = [OH*cos(phi+pi/2); OH*sin(phi+pi/2)];
xH = xO + R(1,:) * v_H;
yH = yO + R(2,:) * v_H;
rH = [xH yH 0];

%% -- A --
v_A = [AO * cos(phi); AO * sin(phi)];
xA = xO + R(1,:) * v_A;
yA = yO + R(2,:) * v_A;
rA = [xA yA 0];


%% -- B --
% (xB - xA)^2 + (yB - yA)^2 = AB^2
% (xB - xC)^2 + (yB - yC)^2 = CB^2

eqn_AB = '( xBsol - xA )^2 + ( yBsol - yA )^2 = AB^2';
eqn_CB = '( xBsol - xC )^2 + ( yBsol - yC )^2 = CB^2';
solB = solve(eqn_AB, eqn_CB, 'xBsol, yBsol');
xB_pos = eval(solB.xBsol);
yB_pos = eval(solB.yBsol);

xB1 = xB_pos(1);
xB2 = xB_pos(2);
yB1 = yB_pos(1);
yB2 = yB_pos(2);

xB = xB1; yB=yB1;

rB = [xB yB 0];

%% -- P --
% (xP - xB)^2 + (yP - yB)^2 = BP^2          - length
% (yA - yB)/(xA - xB) = (yP - yB)/(xP - xB) - AB || BP

eqnP1 = '( xPsol - xB )^2 + ( yPsol - yB )^2 = BP^2';
eqnP2 = '(yA-yB)/(xA-xB)=(yPsol-yB )/(xPsol-xB)';
solP = solve(eqnP1, eqnP2, 'xPsol, yPsol');
xP_pos = eval(solP.xPsol);
yP_pos = eval(solP.yPsol);

xP1 = xP_pos(1);
xP2 = xP_pos(2);
yP1 = yP_pos(1);
yP2 = yP_pos(2);

xP = xP2; yP=yP2;
rP = [xP yP 0];

%% -- S --
% (xQ - xS)^2 + (yQ - yS)^2 = QS^2          - length
% (yP - yS)/(xP - xS) = (yP - yQ)/(xP - xQ) - PS || PQ

eqnS1 = '( xQ - xSsol )^2 + ( yQ -  ySsol )^2 = QS^2';
eqnS2 = '( yP - ySsol )/( xP - xSsol ) = ( yP - yQ )/( xP - xQ )';
solS = solve(eqnS1, eqnS2, 'xSsol, ySsol');
xS_pos = eval(solS.xSsol);
yS_pos = eval(solS.ySsol);

xS1 = xS_pos(1);
xS2 = xS_pos(2);
yS1 = yS_pos(1);
yS2 = yS_pos(2);

xS = xS1; yS=yS1;


rS = [xS yS 0];

end

