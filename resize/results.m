clc
close all
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

pl    = 1;

%% Tables
if gr_sh
    tbl_sh = array2table([driv_angl_sh, stroke_piston, angle_arm, torque, force_piston, angl],...
        'VariableNames', {'phi__rad', 'stroke__m', 'angle_arm__deg', 'Torque', 'Force', ...
        'Beta','Theta_F', 'Theta3', 'Theta0'});
end

if gr_el
    tbl_el = array2table([driv_angl_el, stroke_piston_1, angle_arm_1, torque_1, force_piston_1, angl_1],...
        'VariableNames', {'phi__rad', 'stroke__m', 'angle_arm__rad', 'Torque', 'Force', ...
        'Beta','Theta_F', 'Theta3', 'Theta0'});
end

% Excel
% filename = 'data.xlsx';
% writetable(tbl_sh,filename,'Sheet',1);
% writetable(tbl_el,filename,'Sheet',2);

%% Display
disp_mfs = ['Max Force SH: ', num2str(max(abs(force_piston(:)))), ',[N] for the range ', num2str(round(rad2deg(r_max_sh - r_min_sh))), '[deg]'];
disp(disp_mfs)
disp_mfe = ['Max Force EL: ', num2str(max(abs(force_piston_1(:)))), ',[N] for the range  ', num2str(round(rad2deg(r_max - r_min))), '[deg]'];
disp(disp_mfe)
disp_pl = ['Payload = ', num2str(m), '[kg]. Shoulder length = ', num2str(l_sh), '[m]. Elbow length = ', num2str(l_el), '[m]'];
disp(disp_pl)

%% Plot
if pl
    plotting
    
fs = 20; % Font Size
lw = 6;  % Line Width
%% SHOULDER

if gr_sh
    figure('Name', 'Shoulder')
    subplot(3,1,1)
    plot(angle_arm, torque, 'r', 'LineWidth',lw), hold on
    ylabel({'$\tau_{[Nm]}$'},'Interpreter','latex'), hold on
    set(gca,'FontSize', fs)
    xlim( [min(angle_arm(:))-0.05, max(angle_arm(:))+0.05] )
    ylim( [min(torque(:))-10, max(torque(:))+10] )
    grid on
    grid minor
    
    subplot(3,1,2)
    plot(angle_arm, force_piston, 'g', 'LineWidth',lw), hold on
    ylabel({'$F_{ [rad]}$'},'Interpreter','latex'), hold on
    set(gca,'FontSize', fs)
    xlim( [min(angle_arm(:))-0.05, max(angle_arm(:))+0.05] )
    ylim( [min(force_piston(:))-50, max(force_piston(:))+50] )
    grid on
    grid minor
    
    subplot(3,1,3)
    plot(angle_arm, stroke_piston, 'b', 'LineWidth',lw), hold on
    xlabel({'$\phi_{ [rad]}$'},'Interpreter','latex'), hold on
    ylabel({'$x_{p [m]}$'},'Interpreter','latex'), hold on
    set(gca,'FontSize', fs)
    xlim( [min(angle_arm(:))-0.05, max(angle_arm(:))+0.05] )
    ylim( [min(stroke_piston(:))-0.05, max(stroke_piston(:))+0.05] )
    grid on
    grid minor
end

%% ELBOW
if gr_el
    figure('Name', 'Elbow')
    subplot(3,1,1)
    plot(angle_arm_1, torque_1, 'r', 'LineWidth',lw), hold on
    ylabel({'$\tau_{ [Nm]}$'},'Interpreter','latex','FontSize', fs+30), hold on
    set(gca,'FontSize', fs,'fontweight','bold')
    xlim auto
    ylim auto
    grid on
    grid minor
    
    subplot(3,1,2)
    plot(angle_arm_1, force_piston_1, 'g', 'LineWidth',lw), hold on
    ylabel({'$F_{ [rad]}$'},'Interpreter','latex','FontSize', fs+30), hold on
    set(gca,'FontSize', fs,'fontweight','bold')
    xlim auto
    ylim auto
    grid on
    grid minor
    
    subplot(3,1,3)
    plot(angle_arm_1, stroke_piston_1, 'b', 'LineWidth',lw), hold on
    xlabel({'$\phi_{ [rad]}$'},'Interpreter','latex','FontSize', fs+30), hold on
    ylabel({'$x_{p [m]}$'},'Interpreter','latex','FontSize', fs+15), hold on
    set(gca,'FontSize', fs,'fontweight','bold')
    xlim auto
    ylim auto
    grid on
    grid minor
end
end