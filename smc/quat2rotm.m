function R_bo = quat2rotm(q)
% Convert Quaternion to Rotation Matrix for Point Rotation
% q : 1x4 row vector
if ~isequal(size(q,1),1)
    q = q';
end
%% compute transformation matrix
q = normalize(quaternion(q));
R_bo = rotmat(q,'point');