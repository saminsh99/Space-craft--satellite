function dZ=dyn_Quat(t,Z)

dZ=Z;

global Ixx Iyy Izz Ixy Ixz Iyz

e0=Z(1); e1=Z(2); e2=Z(3); e3=Z(4);
de0=Z(5); de1=Z(6); de2=Z(7); de3=Z(8);

M_Q = MFunc_Q(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,e0,e1,e2,e3);
B_Q = BFunc_Q(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,de0,de1,de2,de3,e0,e1,e2,e3);

a=[e0 e1 e2 e3];
a_dot=[de0 de1 de2 de3];

F_aug=[-B_Q;a_dot*Z(5:8)];
M_aug=[M_Q -a';-a 0];

dZ(1:4)=Z(5:8);

dzz=M_aug\F_aug;

dZ(5:8)=dzz(1:4);






