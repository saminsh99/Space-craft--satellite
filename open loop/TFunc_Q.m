function T_Q = TFunc_Q(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,de0,de1,de2,de3,e0,e1,e2,e3)
%TFUNC_Q
%    T_Q = TFUNC_Q(IXX,IXY,IXZ,IYY,IYZ,IZZ,DE0,DE1,DE2,DE3,E0,E1,E2,E3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    26-Jul-2018 10:58:08

t2 = de0.*e1.*2.0;
t3 = de3.*e2.*2.0;
t11 = de1.*e0.*2.0;
t12 = de2.*e3.*2.0;
t4 = t2+t3-t11-t12;
t5 = de0.*e2.*2.0;
t6 = de1.*e3.*2.0;
t13 = de2.*e0.*2.0;
t14 = de3.*e1.*2.0;
t7 = t5+t6-t13-t14;
t8 = de0.*e3.*2.0;
t9 = de2.*e1.*2.0;
t15 = de1.*e2.*2.0;
t16 = de3.*e0.*2.0;
t10 = t8+t9-t15-t16;
T_Q = -(-Ixx.*t4+Ixy.*t7+Ixz.*t10).*(de0.*e1-de1.*e0-de2.*e3+de3.*e2)-(Ixy.*t4-Iyy.*t7+Iyz.*t10).*(de0.*e2-de2.*e0+de1.*e3-de3.*e1)-(Ixz.*t4+Iyz.*t7-Izz.*t10).*(de0.*e3-de1.*e2+de2.*e1-de3.*e0);
