function Params = Prams_fun()
%% inertia matrices [kg.m^2]
Params.Jt  = diag([10,10,10]); 
Params.Irw = 5.7e-4*eye(3); 
Params.Iw  = 5.7e-4;        
%% rotatational velocities initial values [rad/s]
Params.omegaR_0   = [0; 0; 0];
Params.omega_0    = [0.5; 1; -0.5];
Params.omega_dot0 = [0; 0; 0];
Params.omega_d    = [0; 0; 0];
%% desired omega in body frame
Params.omega_d    = [0; 0; 0];
%% desired euler angles
roll  = deg2rad(40);
pitch = deg2rad(30);
yaw   = deg2rad(20);
eulerD = [roll pitch yaw];
%% desired quaternion
Params.qd = eul2quat(eulerD,'ZYX')';
Params.qd = [1; 0; 0; 0];
%% quaternions initial condition
Params.q0  = [0.5985; 0.4288; 0.5235; 0.4288];
Params.qe0 = zeros(4,1);
%% rotational matrix
Params.rotm = quat2rotm(Params.qd');
%% disturbance torque parameter
Re = 12742/2;               % Earth radius [km]
mu = 3.986e14;              % [m^3/s^2]
r  = (600 + Re)*1e3;        % [m]
Params.omegao = mu/r^3;     % [1/s^2]
%% sliding Mode controler gains
Params.k = diag([0.1,0.1,0.1]);
Params.G = diag([0.1,0.1,0.1]);
Params.dela = 0.01;         % sliding surface manifold
%% simulation time
Params.dt = 0.02;          % time resulosion [sec]
Params.tFinal = 60;         % final simulation time [sec]
Params.t = 0:Params.dt:Params.tFinal;   % simulatiob time vector
%% input limits
Params.sT_c = [5,5,5];   % [N.m]
