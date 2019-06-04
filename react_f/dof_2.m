clc
clear all
close all
warning('off','all');
warning;

%% Motion of 
gr_sh = 1; % shoulder [0, pi]
gr_el = 0; % elbow    [0, pi/2]

%% init
% Time
t_min = 0;
t_max = 1;
t_st  = (t_max-t_min)/100;
t_ime = t_min:t_st:t_max;


if gr_sh
    range    = pi*t_ime;
    range_1 = -pi/2;
end
if gr_el
    range    = 0;
    range_1 = -pi/2*t_ime;
end

g     = 9.81;    % [m/s^2]  - gravity force
m     = 5.1;     % [kg]     - payload

d1 =  1060; % [kg/m^2] ABS - density of the material for elbow-shoulder
% d2 =  7850; % [kg/m^2] Steel      ------ || ------    for VSA
d2 =  2830; % [kg/m^2  Aluminium  ------ || ------    for mechanism
d3 =  2830; % [kg/m^2] Aluminium  ------ || ------    for mechanism

%% Initialization of the link dimensions (length, mass,..) -- separate script
link_length

%%
q_d  = [0,0]; % velocity of the (q1, q2)
q_dd = [0,0]; % acceleration of the (q1, q2)
T    = [0,0]; % torque

i    = 0; % counter shoulder
j  = 0;   % counter elbow

rO = [0 0 0]; % GRF

%%
for phi = range
    
    %% Points + Angles
    % SHOULDER
    [ rC, rA, rB, rP, rS, rQ, rOelb] = points( phi, AB, BP, CB, AO, QS);
    [ Beta, Theta_F, Theta3, Theta0, Alpha] = angles( phi, rO, rC, rA, rB, rP, rQ, rOelb );
    
    % ELBOW
    for omega = range_1
        j = j + 1;
        
        %% Points + Angles
        [ rC_1, rA_1, rB_1, rP_1, rS_1, rH_1, rQ_1] = points_elbow( omega, rOelb, AB_1, BP_1, CB_1, AO_1, QS_1, l_el_pl );
        [ Beta_1, Theta_F_1, Theta3_1, Theta0_1, Alpha_1 ] = angles_elbow( rO, rOelb, rC_1, rA_1, rB_1, rP_1, rH_1, rQ_1 );
        
        %% REACTION Force (in every pin of the assembly) calculation -- separate script
        force_elbow     % elbow
        force           % shoulder (including the elbow)
        rect_unit_vect  % unit vectors to plot the direction
        
        %% Center of Mass + Euler-Lagrange calculation -- separate script        
        com             % Center of Mass of the elbow&shoulder links
        serial_manip    % Dynamics equations
        
        %% Results for the table
        % SHOULDER
        driv_angl_sh(j,1)  = phi;
        stroke_piston(j,1) = norm (rP - rS);
        angle_arm(j,1)     = Alpha;
        react_f(j,:)       = [rfB, rfA, rfO, rfC, rfP];
        sh_com(j,:)        = com_sh;
        tip_sh(j,:)        = [rOelb(1), rOelb(2)];
        
        % ELBOW
        driv_angl_el(j,1)    = omega;
        stroke_piston_1(j,1) = norm(rP_1-rS_1);
        angle_arm_1(j,1)     = Alpha_1;
        react_f_1(j,:)       = [rfB_1, rfA_1, rfO_1, rfC_1, rfP_1];
        el_com(j,:)          = com_el;
        tip_el(j,:)          = [rH_1(1), rH_1(2)];
   
        % Pins and reactions
        p_sh(j,:)  = [ rC, rA, rB, rP, rS, rQ, rOelb];
        p_el(j,:)  = [ rC_1, rA_1, rB_1, rP_1, rS_1, rH_1, rQ_1];
        r_uv_sh(j,:) = [B_uv, A_uv, O_uv, C_uv, P_uv];
        r_uv_el(j,:) = [B1_uv, A1_uv, O1_uv, C1_uv, P1_uv];
        
        %% Dynamics
        q(j,:) = [Alpha, Alpha_1]; % joint angle (i.e. generalize coordinate)
        
        if j>1  % no vel/acc for time = 0
            q_d(j,:)  = (q(j,:) - q(j-1,:))/t_st;
            q_dd(j,:) = (q_d(j,:) - q_d(j-1,:))/t_st;
        end
        
        T_1 = M(1,1)*q_dd(j,1) + M(1,2)*q_dd(j,2) + c_121*q_d(j,1)*q_d(j,2) + c_211*q_d(j,2)*q_d(j,1) + c_221*q_d(j,2)^2 + ph_1;
        T_2 = M(2,1)*q_dd(j,1) + M(2,2)*q_dd(j,2) + c_112*q_d(j,1)^2 + ph_2;
        
        T(j,:) = [T_1, T_2]
    end
end

%% Results
results
% rf_plot % reaction forces plot
% plotting


