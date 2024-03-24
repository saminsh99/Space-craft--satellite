function qedot = qe_dot(q,qd,omega,omega_d)
%% reform q & qd to row vectors
% qd : 1x4 row vector
if ~isequal(size(qd,1),1)
    qd = qd';
end
qd_quat = quaternion(qd);
% q : 1x4 row vector
if ~isequal(size(q,1),1)
    q = q';
end
q = quaternion(q);
%% compute inverse of qd
inv_qd = conj(qd_quat)./norm(qd_quat);
%% compute qe_dot
qe = quatmultiply(inv_qd,q);
[qe1,qe2,qe3,qe4] = parts(qe); 
E_qe = [ qe1, -qe4,  qe3
         qe4,  qe1, -qe2
        -qe3,  qe2,  qe1];
omega_e = omega - omega_d;
qedot = 0.5*E_qe*omega_e;
