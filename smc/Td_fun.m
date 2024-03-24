function Td = Td_fun(R_b2o)
%% restore constant parameters
Params = Prams_fun;
Jt  = Params.Jt;
omegao = Params.omegao;
%% resotr inputs
%C       = reshape(In(1:9),3,3)';
%% compute input disturbance torque
Td = 3*omegao*(cross(R_b2o(:,3),Jt*R_b2o(:,3))); 
Td = R_b2o*Td;