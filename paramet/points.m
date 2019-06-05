function [angl_AB, rO, rOelb, rA, rB1, rB2, rB3, rC1, rC2, rP, rS, rQ] = points( phi, rho, AB1, B1P, AO, QS, B1B2, B2B3, B3B1, B3C1, B2C2, C1O, C2O, QO )

R = rotz(phi);

%% -- O --
xO = 0;
yO = 0;
rO = [xO yO 0];

%% -- A --
xA = xO  - AO;
yA = 0;
rA = [xA yA 0];

%% -- C1 --
v_C1 = [-0.00605; -0.0968];
xC1 = R(1,:) * v_C1;
yC1 = R(2,:) * v_C1;
rC1 = [xC1 yC1 0];

%% -- C2 --
v_C2 = [0.17606; -0.16929];
xC2 = R(1,:) * v_C2;
yC2 = R(2,:) * v_C2;
rC2 = [xC2 yC2 0];

%% B1 - B2 - B3 -----> AB1 optim angle
i = 0;

C1AO = link_plane( rA, rC1, rA, rO );

if phi<pi/2
    start_rho = rho;
    fin_rho =  C1AO - 0.3;
elseif (phi>=pi/2)&&(phi<3*pi/4)
    start_rho = rho;
    fin_rho =  C1AO - 0.1;
elseif (phi>=3*pi/4)&&(phi<=pi)
    start_rho = rho;
    fin_rho =  C1AO*2;   
else
    start_rho = rho;
    fin_rho =  -2.295;
end

step = (fin_rho-start_rho)/5;
for rho = start_rho:step:fin_rho
    
    xB1 = xA  + AB1*cos(rho);
    yB1 = yA  - AB1*sin(rho);
    rB1 = [xB1 yB1 0];
    try
        
        if (phi>pi/3) && (phi<=2.3)
            rB2_f = btw_lines( rC2, rB1, B2C2, B1B2, rC2, 1, 0);
            gamma    = abs(link_plane( rB2_f, rC2, rA, rO ));
            
            xB3 = xC1  - B3C1 * cos(gamma);
            yB3 = yC1  - B3C1 * sin(gamma);
            rB3 = [xB3 yB3 0];
            
            rB2 = btw_lines( rC2, rB3, B2C2, B2B3, rC2, 1, 0);
            
        elseif (phi>2.3)
            rB2 = btw_lines( rC2, rB1, B2C2, B1B2, rC2, 2, 0);
            gamma    = link_plane( rB2, rC2, rA, rO );
            
            xB3 = xC1  - B3C1 * cos(gamma);
            yB3 = yC1  + B3C1 * sin(gamma);
            rB3 = [xB3 yB3 0];
            
        elseif (phi<pi/3)
            
            rB2_f = btw_lines( rC2, rB1, B2C2, B1B2, rC2, 1, 1);
            gamma    = abs(link_plane( rB2_f, rC2, rA, rO ));
            
            xB3 = xC1  - B3C1 * cos(gamma);
            yB3 = yC1  - B3C1 * sin(gamma);
            rB3 = [xB3 yB3 0];
            
            rB2 = btw_lines( rC2, rB3, B2C2, B2B3, rC2, 1, 1);
        end
        
        i = i+1;
        er_b1b2 = abs(abs(norm(rB1-rB2)) - 0.2066);
        er_b1b3 = abs(abs(norm(rB1-rB3)) - 0.1465);
        er_b2b3 = abs(abs(norm(rB2-rB3)) - 0.1942);
        er(i,1) =  er_b1b2+  er_b1b3  + er_b2b3 ;
        rt(i,1) = rho;
    catch
        
    end
end

ind1 = er(:) == min(er(:));
min_rho = rt(ind1,1);

angl_AB = min_rho;
%% -- Oelb --
v_Oelb = [0.64702; -0.13025];
xOelb  = R(1,:) * v_Oelb;
yOelb  = R(2,:) * v_Oelb;
rOelb  = [xOelb  yOelb  phi];

%% -- Q --
v_Q = [0.5059; -0.12411];
xQ = R(1,:) * v_Q;
yQ = R(2,:) * v_Q;
rQ = [xQ yQ 0];

%% -- P --
% (xP - xB1)^2 + (yP - yB1)^2 = B1P^2          - length
% (yA - yB1)/(xA - xB1) = (yP - yB1)/(xP - xB1) - AB1 || BP

eqnP1 = '( xPsol - xB1 )^2 + ( yPsol - yB1 )^2 = B1P^2';
eqnP2 = '(yA-yB1)/(xA-xB1)=(yPsol-yB1 )/(xPsol-xB1)';
solP = solve(eqnP1, eqnP2, 'xPsol, yPsol');
xP_pos = eval(solP.xPsol);
yP_pos = eval(solP.yPsol);

xP1 = xP_pos(1);
xP2 = xP_pos(2);
yP1 = yP_pos(1);
yP2 = yP_pos(2);

xP = xP2; yP=yP2;
% if xP1 > xB1
%     xP = xP1; yP=yP1;
% else
%     xP = xP2; yP=yP2;
% end
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


