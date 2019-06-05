function [ Beta, Theta_F, Theta3, Theta0, Alpha ] = angles_elbow( rO, rC, rA, rB, rP, rH, rQ )

% Beta    --  -OX ^ AP
% Theta_F --  +OX ^ QP
% Theta3  --  +OX ^ CB
% Theta0  --  +OX ^ OA
% Alpha   --  +OX ^ OH

% ground(OX) --> OC

Beta    = abs(link_plane( rA, rP, rC, rO ));
Theta_F = link_plane( rQ, rP, rO, rC );
Theta3  = link_plane( rC, rB, rO, rC );
Theta0  = link_plane( rO, rA, rO, rC );
Alpha   = link_plane( rO, rH, rO, rC );

end