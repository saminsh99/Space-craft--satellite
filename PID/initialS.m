close all
clear
clc

%%inertia matrices
Jt=[0.185 0 0; 0 0.144 0; 0 0 0.061];
Irw=5.7e-5*eye(3);
Iw=5.7e-5;



%omR_dot=[176; 176; 176];
omega0=[0; 0; 0];
% T=[0; 0; 0];

% desired euler angles
roll  = 30;
pitch = 20;
yaw   = 40;
eulerD = [roll pitch yaw];

% desired quaternion
quatD = eul2quat(eulerD,'ZYX');

% %rotational matrix
rotm = quat2rotm(quatD);
% disturbance torque
Re = 12742/2;
mu=3.986e14;
r=(600 + Re)*1e3;
omegao=sqrt(mu/r^3);
A=Jt*rotm(:,3);
T_d=3*omegao^2*(cross(rotm(:,3),A));
%%initial conditions
Q=[0; 0; 0; 0];
eul0=[0; 0; 0];




