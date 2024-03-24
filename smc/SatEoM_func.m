% function omega_dot = SatEoM_func(In)
function omega_dot = SatEoM_func(T_c,T_d,omegaR,omega)
%% restore constant parameters
Params = Prams_fun;
Jt     = Params.Jt;
Irw    = Params.Irw;
%% compute Satellite dynamics
omegaS = [        0, -omega(3),  omega(2);
           omega(3),         0, -omega(1);
          -omega(2),  omega(1),        0];
omega_dot = Jt \ (T_d + T_c - (omegaS)*(Jt*omega + Irw*omegaR));   

