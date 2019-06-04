clc
clear all
close all
warning('off','all');
warning;

%% init
displ = 0; % plot motion
gr_sh = 0; % motion of the shoulder
gr_el = 1; % motion of the elbow

% SHOULDER
r_min_sh = 0;
r_max_sh = pi;
step     = (r_max_sh - r_min_sh)/35;

% ELBOW
r_min   = -1.6;
r_max   = 1.1;
step_1  = (r_max - r_min)/34;

if gr_sh
    range    = r_min_sh:step:r_max_sh;
    range_1 = -1.6;
end
if gr_el
    range    = 0;
    range_1 = r_min:step_1:r_max;
end

% Parameters
g     = 9.81;    % [m/s^2]  - gravity force
m     = 2.4;     % [kg]     - payload
m_el  = 1.83;    % [kg]     - mass of the elbow link
m_sh  = 1.83;    % [kg]     - mass of the shoulder link
m_act = 0.25;    % [kg]     - mass of the actuator
l_el  = 0.2903;  % [m]      - length of the elbow
l_sh  = 0.369;   % [m]      - shoulder


%% Initialization of the link lengths -- separate script
link_length
%%
i  = 0; % counter shoulder
j  = 0; % counter elbow

rO = [0 0 0];

for phi = range
    i = i + 1;
    
    %% Points + Angles
    % SHOULDER
    [ rC, rA, rB, rP, rS, rQ, rOelb] = points( phi, AB, BP, CB, AO, QS);
    [ Beta, Theta_F, Theta3, Theta0, Alpha] = angles( phi, rO, rC, rA, rB, rP, rQ, rOelb );
    
    % ELBOW
    for omega = range_1
        j = j + 1;
        
        %% Points + Angles
        [ rC_1, rA_1, rB_1, rP_1, rS_1, rH_1, rQ_1] = points_elbow( omega, rOelb, AB_1, BP_1, CB_1, AO_1, QS_1, l_el );
        [ Beta_1, Theta_F_1, Theta3_1, Theta0_1, Alpha_1 ] = angles_elbow( rO, rOelb, rC_1, rA_1, rB_1, rP_1, rH_1, rQ_1 );
        
        %% Plotting -- separate script
        if displ
            plotting
            tic, pause(0.0001), toc;
        end
        
        %% Force calculation -- separate script
        force_elbow % elbow
        force       % shoulder (including the length of the elbow)
        
        %% Results for the table
        % SHOULDER
        driv_angl_sh(j,1)  = phi;
        stroke_piston(j,1) = norm (rP - rS);
        angle_arm(j,1)   = Alpha;
        torque(j,1)        = Tau;
        force_piston(j,1)  = F;
        angl(j,:)          = [rad2deg(Beta), rad2deg(Theta_F), rad2deg(Theta3), rad2deg(Theta0)];
        
        % ELBOW
        driv_angl_el(j,1)    = omega;
        stroke_piston_1(j,1) = norm(rP_1-rS_1);
        angle_arm_1(j,1)     = Alpha_1;
        torque_1(j,1)        = Tau_1;
        force_piston_1(j,1)  = F_1;
        angl_1(j,:)          = [rad2deg(Beta_1), rad2deg(Theta_F_1), rad2deg(Theta3_1), rad2deg(Theta0_1)];
    end
end

%% Displaying results -- separate script
results
