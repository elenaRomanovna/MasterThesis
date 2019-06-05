clc
set(groot, 'defaultAxesTickLabelInterpreter','latex'); 

%% Tables
elb_table = array2table([driv_angl_el, angle_arm_1, stroke_piston_1, torque_1, force_piston_1, angl_1],...
    'VariableNames', {'phi__rad', 'angle_arm__deg','stroke__m', 'Torque', 'Force', ...
    'Beta','Theta_F', 'Theta3', 'Theta0'})

sld_table = array2table([driv_angl_sh, rad2deg(driv_angl_sh), stroke_piston, torque, force_piston, angl],...
    'VariableNames', {'phi__rad', 'angle_arm__deg','stroke__m', 'Torque', 'Force', ...
    'pB3B1','nB2B1', 'nB2B3', 'pB3C1', 'pB2C2','nQP', 'nAP', 'pC1O', 'nC2O'}) % p - possitive XO, n - negative XO

% filename = 'data.xlsx';
% writetable(elb_table,filename,'Sheet',1);
% writetable(sld_table,filename,'Sheet',2);

%% Display
disp_mfs = ['Max Force SH: ', num2str(max(abs(force_piston(:)))), ',[N] for the range ', num2str(round(rad2deg(r_max_sh - r_min_sh))), '[deg]'];
disp(disp_mfs)
disp_mfe = ['Max Force EL: ', num2str(max(abs(force_piston_1(:)))), ',[N] for the range  ', num2str(round(rad2deg(r_max - r_min))), '[deg]'];
disp(disp_mfe)
disp_pl = ['Payload = ', num2str(m), '[kg]. Shoulder length = ', num2str(l_sh), '[m]. Elbow length = ', num2str(l_el), '[m]'];
disp(disp_pl)

%% Plot
fs = 15; % Font Size
%% SHOULDER
figure(2)
subplot(3,1,1)
plot(driv_angl_sh, torque, 'r', 'LineWidth',4), hold on
ylabel('\tau [Nm]'), hold on
set(gca,'FontSize', fs)
xlim( [0, max(driv_angl_sh(:))+0.05] )
ylim( [min(torque(:))-10, max(torque(:))+10] )
grid on
grid minor

subplot(3,1,2)
plot(driv_angl_sh, force_piston, 'g', 'LineWidth',4), hold on
ylabel('F [N]'), hold on
set(gca,'FontSize', fs)
xlim( [0, max(driv_angl_sh(:))+0.05] )
ylim( [min(force_piston(:))-50, max(force_piston(:))+50] )
grid on
grid minor

subplot(3,1,3)
plot(driv_angl_sh, stroke_piston, 'b', 'LineWidth',4), hold on
xlabel('\phi [rad]'), hold on
ylabel('x_p [m]'), hold on
set(gca,'FontSize', fs)
xlim( [0, max(driv_angl_sh(:))+0.05] )
ylim( [min(stroke_piston(:))-0.05, max(stroke_piston(:))+0.05] )
grid on
grid minor

%% ELBOW
figure('Name', 'Elbow')
subplot(3,1,1)
plot(driv_angl_el, torque_1, 'r', 'LineWidth',4), hold on
ylabel('\tau [Nm]'), hold on
set(gca,'FontSize', fs)
xlim( [0, max(driv_angl_el(:))+0.05] )
ylim( [min(torque_1(:))-10, max(torque_1(:))+10] )
grid on
grid minor

subplot(3,1,2)
plot(driv_angl_el, force_piston_1, 'g', 'LineWidth',4), hold on
ylabel('F [N]'), hold on
set(gca,'FontSize', fs)
xlim( [0, max(driv_angl_el(:))+0.05] )
ylim( [min(force_piston_1(:))-50, max(force_piston_1(:))+50] )
grid on
grid minor

subplot(3,1,3)
plot(driv_angl_el, stroke_piston_1, 'b', 'LineWidth',4), hold on
xlabel('\phi [rad]'), hold on
ylabel('x_p [m]'), hold on
set(gca,'FontSize', fs)
xlim( [0, max(driv_angl_el(:))+0.05] )
ylim( [min(stroke_piston_1(:))-0.05, max(stroke_piston_1(:))+0.05] )
grid on
grid minor
