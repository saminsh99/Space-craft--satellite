function H_global_Q = HFunc_Q(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,de0,de1,de2,de3,e0,e1,e2,e3)
%HFUNC_Q
%    H_GLOBAL_Q = HFUNC_Q(IXX,IXY,IXZ,IYY,IYZ,IZZ,DE0,DE1,DE2,DE3,E0,E1,E2,E3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    26-Jul-2018 10:58:07

t2 = abs(e0);
t3 = t2.^2;
t4 = abs(e1);
t5 = t4.^2;
t6 = abs(e2);
t7 = t6.^2;
t8 = abs(e3);
t9 = t8.^2;
t10 = de0.*e1.*2.0;
t11 = de3.*e2.*2.0;
t23 = de1.*e0.*2.0;
t24 = de2.*e3.*2.0;
t12 = t10+t11-t23-t24;
t13 = de0.*e2.*2.0;
t14 = de1.*e3.*2.0;
t25 = de2.*e0.*2.0;
t26 = de3.*e1.*2.0;
t15 = t13+t14-t25-t26;
t16 = de0.*e3.*2.0;
t17 = de2.*e1.*2.0;
t27 = de1.*e2.*2.0;
t28 = de3.*e0.*2.0;
t18 = t16+t17-t27-t28;
t19 = 1.0./e0;
t20 = 1.0./e1;
t21 = 1.0./e2;
t22 = 1.0./e3;
t29 = Ixy.*t12;
t30 = Iyz.*t18;
t55 = Iyy.*t15;
t31 = t29+t30-t55;
t32 = 1.0./e0.^2;
t33 = t3.^2;
t34 = t32.*t33;
t35 = 1.0./e1.^2;
t36 = t5.^2;
t37 = t35.*t36;
t38 = 1.0./e2.^2;
t39 = t7.^2;
t40 = 1.0./e3.^2;
t41 = t9.^2;
t42 = e0.*e3.*t5.*t7;
t43 = Ixy.*t15;
t44 = Ixz.*t18;
t53 = Ixx.*t12;
t45 = t43+t44-t53;
t46 = Ixz.*t12;
t47 = Iyz.*t15;
t49 = Izz.*t18;
t48 = t46+t47-t49;
t50 = t38.*t39;
t51 = e0.*e2.*t5.*t9;
t52 = e1.*e3.*t3.*t7;
t54 = e2.*e3.*t3.*t5;
H_global_Q = [t45.*(t34+t37-t38.*t39-t40.*t41)+t19.*t20.*t21.*t22.*t31.*(t42-e1.*e2.*t3.*t9).*2.0+t19.*t20.*t21.*t22.*t48.*(t51+t52).*2.0;t31.*(t34-t37+t50-t40.*t41)+t19.*t20.*t21.*t22.*t45.*(t42+e1.*e2.*t3.*t9).*2.0-t19.*t20.*t21.*t22.*t48.*(t54-e0.*e1.*t7.*t9).*2.0;t48.*(t34-t37-t50+t40.*t41)+t19.*t20.*t21.*t22.*t45.*(t51-t52).*2.0+t19.*t20.*t21.*t22.*t31.*(t54+e0.*e1.*t7.*t9).*2.0];
