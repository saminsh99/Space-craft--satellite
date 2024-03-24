function dZ=dyn_Euler(t,Z)

dZ=Z;

global Ixx Iyy Izz Ixy Ixz Iyz

q1=Z(1); q2=Z(2); q3=Z(3);
dq1=Z(4); dq2=Z(5); dq3=Z(6);

M = MFunc(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,q2,q3);
B = BFunc(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,dq1,dq2,dq3,q2,q3);


dZ(1:3)=Z(4:6);

dZ(4:6)=-M\B;