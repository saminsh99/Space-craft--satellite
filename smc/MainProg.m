%% Main Program 
clear, clc
close all
%% restore parameters
Params = Prams_fun;
%% initial values
R_bo   = Params.rotm;                   % Rotation matrix
q_d    = Params.qd;                     % desired quaternion
q      = Params.q0;                     % initial quaternion
omega  = Params.omega_0;                % initial omega
omega_dot = Params.omega_dot0;          % initial rate of omega
omegaR    = Params.omegaR_0;            % initial omegaR (dc motor rotating speed)
omega_d   = Params.omega_d;             % desired omega
qe = zeros(3,1);                        % initial quaternion error
qedot = zeros(3,1);                     % initial rate of quaternion error
T_d = Td_fun(R_bo);                     % initial disturbance torque
sT_c = Params.sT_c;                     % limit of input torque
%% restore data for plot
hq = []; hqd = [];
homega = []; homegad = [];
hTc = []; hTd = [];
%% main loop
for i = 1:length(Params.t)
    % SMC controller 
    T_c = SMC_fun(qe,qedot,T_d,omegaR,omega,omega_dot);
    % limit input torques
    T_c = satTau(T_c,sT_c);
    % DC motor dynamic 
    omegaR_dot = dc_motor(T_c);                         % to be integrated
    % Satellite Dynamic 
    omega_dot = SatEoM_func(T_c,T_d,omegaR,omega);      % to be integrated
    % Rate of Quaternion calculation 
    q_dot = qdot_fun(q,omega);                          % to be integrated
    % Quaternion error and its rate calculation
    qedot = qe_dot(q,q_d,omega,omega_d);
    % qedot = qe_dot(qe,omega);
    %% one step ahead integration
    omega  = omega + omega_dot*Params.dt;
    omegaR = omegaR + omegaR_dot*Params.dt;
    q  = q + q_dot*Params.dt;
    qe  = qe + qedot*Params.dt;
    %% transformations
    R_bo = quat2rotm(q);
    % Input disturbance
    T_d = Td_fun(R_bo);
    %% save data for plot
    hq = [hq,q]; hqd = [hqd,q_d];
    homega = [homega,omega]; homegad = [homegad,omega_d];
    hTc = [hTc,T_c];hTd = [hTd,T_d];
end
%% plot results
t = Params.t;
figure(1)
subplot(4,1,1)
plot(t,[hqd(1,:);hq(1,:)],'linewidth',2)
title('Quaternion Tracking Performance')
legend('q_{d1}','q_1','location','northeast','FontSize',10)
subplot(4,1,2)
plot(t,[hqd(2,:);hq(2,:)],'linewidth',2)
legend('q_{d2}','q_2','location','northeast','FontSize',10)
subplot(4,1,3)
plot(t,[hqd(3,:);hq(3,:)],'linewidth',2)
legend('q_{d3}','q_3','location','northeast','FontSize',10)
subplot(4,1,4)
plot(t,[hqd(4,:);hq(4,:)],'linewidth',2)
legend('q_{d4}','q_4','location','northeast','FontSize',10)
xlabel('t [sec]')
exportgraphics(figure(1),'q_qd.png','Resolution',150)

figure(2)
subplot(3,1,1)
plot(t,[homegad(1,:);homega(1,:)],'linewidth',2)
title('Angular Velocity Performance')
ylabel('[rad/s]','FontSize',12)
legend('\omega_{d1}','\omega_1','location','northeast','FontSize',12)
subplot(3,1,2)
plot(t,[homegad(2,:);homega(2,:)],'linewidth',2)
ylabel('[rad/s]','FontSize',12)
legend('\omega_{d2}','\omega_2','location','northeast','FontSize',12)
subplot(3,1,3)
plot(t,[homegad(3,:);homega(3,:)],'linewidth',2)
ylabel('[rad/s]','FontSize',12)
legend('\omega_{d3}','\omega_3','location','northeast','FontSize',12)
xlabel('t [sec]')
exportgraphics(figure(2),'w_wd.png','Resolution',150)

figure(3)
subplot(3,1,1)
plot(t,hTc(1,:),'linewidth',2)
title('Control Torques')
ylabel('T_{c1} [N.m]','FontSize',12)
subplot(3,1,2)
plot(t,hTc(2,:),'linewidth',2)
ylabel('T_{c2} [N.m]','FontSize',12)
subplot(3,1,3)
plot(t,hTc(2,:),'linewidth',2)
ylabel('T_{c3} [N.m]','FontSize',12)
xlabel('t [sec]')
exportgraphics(figure(3),'T_c.png','Resolution',150)

figure(4)
subplot(3,1,1)
plot(t,hTd(1,:),'linewidth',2)
title('Disturbance Torques')
ylabel('T_{d1} [N.m]','FontSize',12)
subplot(3,1,2)
plot(t,hTd(2,:),'linewidth',2)
ylabel('T_{d2} [N.m]','FontSize',12)
subplot(3,1,3)
plot(t,hTd(2,:),'linewidth',2)
ylabel('T_{d3} [N.m]','FontSize',12)
xlabel('t [sec]')
exportgraphics(figure(4),'T_d.png','Resolution',150)


