clc
clear all
close all
%%
syms e0 e1 e2 e3 
syms de0 de1 de2 de3
syms Ixx Iyy Izz Ixy Ixz Iyz

I=[Ixx -Ixy -Ixz;-Ixy Iyy -Iyz;-Ixz -Iyz Izz];


R=[e0^2+e1^2-e2^2-e3^2 2*(e1*e2+e0*e3) 2*(e1*e3-e0*e2);
    2*(e1*e2-e0*e3) e0^2-e1^2+e2^2-e3^2 2*(e2*e3+e0*e1);
    2*(e1*e3+e0*e2) 2*(e2*e3-e0*e1) e0^2-e1^2-e2^2+e3^2];

w=2*[-e1 e0 e3 -e2;-e2 -e3 e0 e1;-e3 e2 -e1 e0]*[de0;de1;de2;de3];

H=I*w;
T=0.5*w.'*H;
T_Q=simplify(T);

V=0;

L=T_Q-V;

%%
q=[e0;e1;e2;e3];
dq=[de0;de1;de2;de3];

dL_dq=jacobian(L,q);
dL_ddq=jacobian(L,dq);

M=jacobian(dL_ddq,dq);
B=jacobian(dL_ddq,q)*dq-dL_dq.';

M_Q=simplify(M);
B_Q=simplify(B);

H_global_Q=simplify(R'*H);

%%

MFunc_Q=matlabFunction(M_Q,'File','MFunc_Q');
BFunc_Q=matlabFunction(B_Q,'File','BFunc_Q');

HFunc_Q=matlabFunction(H_global_Q,'File','HFunc_Q');
TFunc_Q=matlabFunction(T_Q,'File','TFunc_Q');






