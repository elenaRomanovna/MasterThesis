clc
close all
clf
set(groot, 'defaultAxesTickLabelInterpreter','latex');
set(groot, 'defaultLegendInterpreter','latex');

%% Tables
tbl_m = array2table([m, sum(m_sh), m_sh_pl, m_cyl, m_rod, m_AB, m_BP, m_CB, m_el_pl, m_cyl, m_rod, m_AB_1, m_BP_1, m_CB_1],...
    'VariableNames', {'payload', 'Sh', 'plate_sh', 'Cyl_sh', 'Rod_sh', 'AB_sh', 'BP_sh', 'CB_sh', ...
    'El', 'Cyl_el', 'Rod_el', 'AB_el', 'BP_el', 'CB_el'}); % [kg]

if gr_sh
    tbl_sh = array2table([driv_angl_sh, stroke_piston, angle_arm, q(:,1),q_d(:,1),q_dd(:,1),T(:,1), react_f, sh_com, tip_sh],...
        'VariableNames', {'phi__rad', 'stroke__m', 'angle_arm__deg', 'joint_angl_rad', 'vel_rad_s', ...
        'acc_rad_s2', 'Torque_Nm', 'M_bz', 'R_bx', 'R_by', 'M_az', 'R_ax', 'R_ay',...
        'M_oz', 'R_ox', 'R_oy', 'M_cz', 'R_cx', 'R_cy', 'M_pz', 'R_px', 'R_py',...
        'COM_x', 'COM_y', 'Oelb_x', 'Oelb_y'})
end

if gr_el
    tbl_el = array2table([driv_angl_el, stroke_piston_1, angle_arm_1, q(:,2),q_d(:,2),q_dd(:,2),T(:,2), react_f_1, el_com, tip_el],...
        'VariableNames', {'phi__rad', 'stroke__m', 'angle_arm__deg', 'joint_angl_rad', 'vel_rad_s', ...
        'acc_rad_s2', 'Torque_Nm', 'M_bz', 'R_bx', 'R_by', 'M_az', 'R_ax', 'R_ay', ...
        'M_oz', 'R_ox', 'R_oy', 'M_cz', 'R_cx', 'R_cy', 'M_pz', 'R_px', 'R_py',...
        'COM_x', 'COM_y', 'H_x', 'H_y'})
end


%% Plot
fs = 20; % Font Size
lw = 6;  % Line Width
close(1)

figure('Name', 'Torque')
if gr_sh
    plot(t_ime', T(:,1), 'r', 'LineWidth',lw), hold on
    xlabel({'$time_{[s]-SH}$'},'Interpreter','latex'), hold on
    ylabel({'$\tau_{[Nm]}$'},'Interpreter','latex'), hold on
    set(gca,'FontSize', fs)
    xlim auto
    ylim auto
    grid on
    grid minor
end
if gr_el
    plot(t_ime', T(:,2), 'r', 'LineWidth',lw), hold on
    xlabel({'$time_{[s]-EL}$'},'Interpreter','latex'), hold on
    ylabel({'$\tau_{[Nm]}$'},'Interpreter','latex'), hold on
    set(gca,'FontSize', fs)
    xlim auto
    ylim auto
    grid on
    grid minor
end

figure('Name', 'Dyn-SH')
subplot(2,2,1)
plot(tip_el(:,1), tip_sh(:,2), 'r', 'LineWidth',lw), hold on
xlabel({'$x_{[m]}$'},'Interpreter','latex'), hold on
ylabel({'$y_{[m]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

subplot(2,2,2)
plot(t_ime', q(:,1), 'r', 'LineWidth',lw), hold on
xlabel({'$time_{[s]}$'},'Interpreter','latex'), hold on
ylabel({'$q_{[rad]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

subplot(2,2,3)
plot(t_ime', q_d(:,1), 'r', 'LineWidth',lw), hold on
xlabel({'$time_{[s]}$'},'Interpreter','latex'), hold on
ylabel({'$vel_{[rad/s]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

subplot(2,2,4)
plot(t_ime', q_dd(:,1), 'r', 'LineWidth',lw), hold on
xlabel({'$time_{[s]}$'},'Interpreter','latex'), hold on
ylabel({'$acc_{[rad/s^2]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

figure('Name', 'Dyn-EL')
subplot(2,2,1)
plot(tip_el(:,1), tip_el(:,2), 'r', 'LineWidth',lw), hold on
xlabel({'$x_{[m]}$'},'Interpreter','latex'), hold on
ylabel({'$y_{[m]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

subplot(2,2,2)
plot(t_ime', q(:,2), 'r', 'LineWidth',lw), hold on
xlabel({'$time_{[s]}$'},'Interpreter','latex'), hold on
ylabel({'$q_{[rad]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

subplot(2,2,3)
plot(t_ime', q_d(:,2), 'r', 'LineWidth',lw), hold on
xlabel({'$time_{[s]}$'},'Interpreter','latex'), hold on
ylabel({'$vel_{[rad/s]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor

subplot(2,2,4)
plot(t_ime', q_dd(:,2), 'r', 'LineWidth',lw), hold on
xlabel({'$time_{[s]}$'},'Interpreter','latex'), hold on
ylabel({'$acc_{[rad/s^2]}$'},'Interpreter','latex'), hold on
set(gca,'FontSize', fs)
xlim auto
ylim auto
grid on
grid minor
