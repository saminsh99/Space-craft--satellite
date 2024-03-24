function T = TFunc(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,dq1,dq2,dq3,q2,q3)
%TFUNC
%    T = TFUNC(IXX,IXY,IXZ,IYY,IYZ,IZZ,DQ1,DQ2,DQ3,Q2,Q3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    26-Jul-2018 11:39:05

t2 = cos(q3);
t3 = cos(q2);
t4 = sin(q3);
t5 = sin(q2);
t12 = dq1.*t5;
t6 = dq3-t12;
t7 = dq2.*t2;
t8 = dq1.*t3.*t4;
t9 = t7+t8;
t10 = dq2.*t4;
t13 = dq1.*t2.*t3;
t11 = t10-t13;
T = (dq2.*t2.*(1.0./2.0)+dq1.*t3.*t4.*(1.0./2.0)).*(-Ixy.*t6+Iyy.*t9+Iyz.*t11)+(dq2.*t4.*(1.0./2.0)-dq1.*t2.*t3.*(1.0./2.0)).*(Ixz.*t6+Iyz.*t9+Izz.*t11)+(dq3.*(1.0./2.0)-dq1.*t5.*(1.0./2.0)).*(Ixx.*t6-Ixy.*t9+Ixz.*t11);