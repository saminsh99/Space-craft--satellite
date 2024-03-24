function q_dot = qdot_fun(q,omega)
%% compute q_dot
q_dot = 0.5*([        0,  omega(3), -omega(2), omega(1)
              -omega(3),         0,  omega(1), omega(2)
               omega(2), -omega(1),         0, omega(3)
              -omega(1), -omega(2), -omega(3),        0])*q;

