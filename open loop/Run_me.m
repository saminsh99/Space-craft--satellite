clc
close all
clear all
%%

global Ixx Iyy Izz Ixy Ixz Iyz

Ixx=1000; Iyy=800; Izz=700; Ixy=5; Ixz=8; Iyz=3;
I=[Ixx -Ixy -Ixz;-Ixy Iyy -Iyz;-Ixz -Iyz Izz];

z0=[pi/3;0;pi/6;0.3;-0.5;0.4];

timespan=[0:0.01:10];
options=odeset('maxstep',1e-2);

t0=clock;
[t,Z]=ode45(@dyn_Euler,timespan,z0,options);
Time_Euler=etime(clock,t0)

q1=Z(:,1); q2=Z(:,2); q3=Z(:,3);
dq1=Z(:,4); dq2=Z(:,5); dq3=Z(:,6);

%%
T=t;
Hx=t;
Hy=t;
Hz=t;

for i=1:length(t)
    
    T(i) = TFunc(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,dq1(i),dq2(i),dq3(i),q2(i),q3(i));
    
    H_global = HFunc(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,dq1(i),dq2(i),dq3(i),q1(i),q2(i),q3(i));
    Hx(i)=H_global(1);
    Hy(i)=H_global(2);
    Hz(i)=H_global(3);
    
end


%% Quaternions

z0_Q(1:4)=angle2quat(z0(1),z0(2),z0(3));

w_dq=[        -sin(z0(2)),        0, 1;
cos(z0(2))*sin(z0(3)),  cos(z0(3)), 0;
cos(z0(2))*cos(z0(3)), -sin(z0(3)), 0];

w0=w_dq*z0(4:6);

e0=z0_Q(1); e1=z0_Q(2); e2=z0_Q(3); e3=z0_Q(4);
z0_Q(5:8)=0.5*[-e1 -e2 -e3;e0 -e3 e2;...
    e3 e0 -e1; -e2 e1 e0]*w0;

t0=clock;
[t,Z_Q]=ode45(@dyn_Quat,timespan,z0_Q,options);
Time_Quat=etime(clock,t0)

e0=Z_Q(:,1); e1=Z_Q(:,2); e2=Z_Q(:,3); e3=Z_Q(:,4);
de0=Z_Q(:,5); de1=Z_Q(:,6); de2=Z_Q(:,7); de3=Z_Q(:,8);


for i=1:length(t)
    
[q1Q(i) q2Q(i) q3Q(i)]=quat2angle([e0(i),e1(i),...
    e2(i),e3(i)]);

end





for i=1:length(t)
    
T_Q(i) = TFunc_Q(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,de0(i),de1(i),de2(i),de3(i),e0(i)...
    ,e1(i),e2(i),e3(i));

H_global_Q = HFunc_Q(Ixx,Ixy,Ixz,Iyy,Iyz,Izz,de0(i),de1(i),de2(i),de3(i)...
    ,e0(i),e1(i),e2(i),e3(i));
Hx_Q(i)=H_global_Q(1);
Hy_Q(i)=H_global_Q(2);
Hz_Q(i)=H_global_Q(3);
    
end

%%
figure
hold on
plot(t,(T-T(1))/T(1))
plot(t,(T_Q-T_Q(1))/T_Q(1))
legend('Euler','Quaternions')
title('Kinetic Energy Error')


figure
hold on
plot(t,(Hx-Hx(1))/Hx(1))
plot(t,(Hx_Q-Hx_Q(1))/Hx_Q(1))
legend('Euler','Quaternions')
title('Angular momentum in x direction Error')


figure
hold on
plot(t,(Hy-Hy(1))/Hy(1))
plot(t,(Hy_Q-Hy_Q(1))/Hy_Q(1))
legend('Euler','Quaternions')
title('Angular momentum in y direction Error')

figure
hold on
plot(t,(Hz-Hz(1))/Hz(1))
plot(t,(Hz_Q-Hz_Q(1))/Hz_Q(1))
legend('Euler','Quaternions')
title('Angular momentum in z direction Error')


figure
hold on
plot(t,q1,'linewidth',4)
plot(t,q1Q,'r','linewidth',1)
legend('Euler','Quaternions')
title('q_1')

figure
hold on
plot(t,q2,'linewidth',4)
plot(t,q2Q,'r','linewidth',1)
legend('Euler','Quaternions')
title('q_2')

figure
hold on
plot(t,q3,'linewidth',4)
plot(t,q3Q,'r','linewidth',1)
legend('Euler','Quaternions')
title('q_3')























