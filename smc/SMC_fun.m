function T_c = SMC_fun(qe,qe_dot,T_d,omega_r,omega,omega_dot)
%% restore constant parameters
Params = Prams_fun;
Jt     = Params.Jt;
Irw    = Params.Irw;
G      = Params.G;
k      = Params.k;
dela   = Params.dela;
%% transform to Orbital frame
omega_o     = omega;    
omega_o_dot = omega_dot;
%% compute controller
omegaS = [          0, -omega_o(3),  omega_o(2);
           omega_o(3),           0, -omega_o(1);
          -omega_o(2),  omega_o(1),          0];
%
omega_e = omega_o; 
S = omega_e + k*qe;

T_c = (omegaS)*(Jt*omega_o + Irw*omega_r) - T_d - Jt*omega_o_dot - ...
                Jt*k*qe_dot - Jt*G*tanh(S/dela); 
