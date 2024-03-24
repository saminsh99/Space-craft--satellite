function omegaR_dot = dc_motor(Tc)
%% restore parametes
Params = Prams_fun;
Iw = Params.Iw;
% dc motor dynamic
omegaR_dot = Tc./Iw;