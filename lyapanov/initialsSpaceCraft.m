clear
clc
close all
%% Part1
Irw=(5.7e-5)*eye(3);
Jt=[0.185 0 0;0 0.144 0;0 0 0.061];
RWvel=0.*ones(3,1);
omegadotdes=zeros(3,1);
omegades=zeros(3,1);
W=[eye(3) zeros(3);zeros(3) 1e14*eye(3)];
omega=zeros(3,1);
Q=[0;0;0;1];
K=2*eye(3);

Td = [7.47573281216648e-23
7.76925014229414e-22
7.18658039594224e-23];
%% Part2
% 
% Irw=(1e-4)*eye(3);
% Jt=[0.185 0 0;0 0.144 0;0 0 0.061];
% RWvel=0.*ones(3,1);
% omegadotdes=zeros(3,1);
% omegades=zeros(3,1);
% W=[eye(3) zeros(3);zeros(3) 1e14*eye(3)];
% omega=zeros(3,1);
% Q=[0;0;0;1];
% K=1.31*eye(3);


