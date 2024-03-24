clc
clear all
close all
%%
% q1=rotation about z, q2=rotation about y, q3=rotation about x

syms q1 q2 q3 
syms dq1 dq2 dq3 
syms Ixx Iyy Izz Ixy Ixz Iyz

I=[Ixx -Ixy -Ixz;-Ixy Iyy -Iyz;-Ixz -Iyz Izz];

Rz=[cos(q1) sin(q1) 0;-sin(q1) cos(q1) 0;0 0 1];
Ry=[cos(q2) 0 -sin(q2); 0 1 0;sin(q2) 0 cos(q2)];
Rx=[1 0 0;0 cos(q3) sin(q3);0 -sin(q3) cos(q3)];

R=Rx*Ry*Rz;

w=R*[0;0;dq1]+Rx*Ry*[0;dq2;0]+Rx*[dq3;0;0];

H=I*w;
T=0.5*w.'*H;
T=simplify(T);

V=0;

L=T-V;

%%
q=[q1;q2;q3];
dq=[dq1;dq2;dq3];

dL_dq=jacobian(L,q);
dL_ddq=jacobian(L,dq);

M=jacobian(dL_ddq,dq);
B=jacobian(dL_ddq,q)*dq-dL_dq.';

M=simplify(M);
B=simplify(B);
Q=[0;0;0];


H_global=simplify(R'*H);

%%
MFunc=matlabFunction(M,'File','MFunc');
BFunc=matlabFunction(B,'File','BFunc');

HFunc=matlabFunction(H_global,'File','HFunc');
TFunc=matlabFunction(T,'File','TFunc');

















































