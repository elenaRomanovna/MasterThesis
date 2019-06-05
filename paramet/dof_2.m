clc
clear all
close all
warning('off','all');
warning;

%% Init
% Boolean buttons
frc   = 1;   % force calculations
displ = 0;   % plot motion
res   = 1;   % plot graphs

% SHOULDER - [rad]
r_min_sh = -0.5;
r_max_sh = pi;
step     = (r_max_sh - r_min_sh)/21;
% range    = r_min_sh:step:r_max_sh;  % for the motion of the shoulder
range    = 0;                       % for the motion of the  elbow
rho      = -range(1)+pi/2;

% ELBOW - [rad]
r_min   = 0.96;
r_max   = -1.57;
step_1  = (r_max - r_min)/24;
range_1 = r_min:step_1:r_max;       % for the motion of the  elbow
% range_1 = -1.57;                    % for the motion of the shoulder

% Parameters
g     = 9.81;    % [m/s^2]  - gravity force
m     = 5.1;     % [kg]     - payload
m_el  = 1.83;    % [kg]     - mass of the elbow link
m_sh  = m_el;    % [kg]     - mass of the shoulder link
m_act = 0.5;     % [kg]     - mass of the actuator
l_el  = 0.3;     % [m]      - length of the elbow
l_sh  = 0.315;   % [m]      - shoulder


%% Initialization of the link lengths -- separate script
link_length
%%
i  = 0; % counter shoulder
j  = 0; % counter elbow

for phi = range
    i = i + 1;
    
    %% Points + Angles
    % SHOULDER
    [angl_AB, rO, rOelb, rA, rB1, rB2, rB3, rC1, rC2, rP, rS, rQ] = points( phi, rho, AB1, B1P, AO, QS, B1B2, B2B3, B3B1, B3C1, B2C2, C1O, C2O, QO );
    rho = angl_AB;
    [Alpha_1, Alpha_2, Alpha_3, Theta_1, Theta_2, Theta_F, Beta, Lamda_3, Lamda_1]= angles( rO, rA, rB1, rB2, rB3, rC1, rC2, rP, rQ );
    
    % ELBOW
    for omega = range_1
        j = j + 1;
        
        %% Points + Angles
        [ rC_1, rA_1, rB_1, rP_1, rS_1, rH_1, rQ_1] = points_elbow( omega, rOelb, AB_1, BP_1, CB_1 ,OC_1, AO_1, QS_1, l_el );
        [ Beta_1, Theta_F_1, Theta3_1, Theta0_1, Alpha ]= angles_elbow( rOelb, rC_1, rA_1, rB_1, rP_1, rH_1, rQ_1 );
        
        %% Plotting -- separate script
        if displ
            plotting
            tic, pause(0.0001), toc;
        end
        
        %% Force calculation -- separate script
        if frc
            force_elbow % elbow
            force       % shoulder (including the length of the elbow)
            
            %% Results for the table
            % SHOULDER
            driv_angl_sh(j,1)  = phi;
            stroke_piston(j,1) = norm (rP - rS);
            torque(j,1)        = Tau;
            force_piston(j,1)  = F;
            angl(j,:)          = [rad2deg(Alpha_1), rad2deg(Alpha_2), rad2deg(Alpha_3), rad2deg(Theta_1), rad2deg(Theta_2),...
                rad2deg(Theta_F), rad2deg(Beta), rad2deg(Lamda_3), rad2deg(Lamda_1)];
            
            % ELBOW
            driv_angl_el(j,1)    = omega;
            stroke_piston_1(j,1) = norm(rP_1-rS_1);
            angle_arm_1(j,1)     = rad2deg(Alpha);
            torque_1(j,1)        = Tau_1;
            force_piston_1(j,1)  = F_1;
            angl_1(j,:)          = [rad2deg(Beta_1), rad2deg(Theta_F_1), rad2deg(Theta3_1), rad2deg(Theta0_1)];
        end
    end
end

%% Displaying results -- separate script
if (res && frc)
    results
end
