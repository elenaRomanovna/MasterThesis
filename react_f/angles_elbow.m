function [ Beta, Theta_F, Theta3, Theta0, Alpha ] = angles_elbow( rO, rOelb, rC, rA, rB, rP, rH, rQ )

% Beta    --  -OX ^ AP
% Theta_F --  +OX ^ QP
% Theta3  --  +OX ^ CB
% Theta0  --  +OX ^ OA
% Alpha   --  +OOelb ^ OH

% ground(+OX) --> CO

Beta    = link_plane( rA, rP, rOelb, rC );
Theta_F = link_plane( rC, rOelb, rQ, rP );
Theta3  = link_plane( rC, rOelb, rC, rB );
Theta0  = -(link_plane( rOelb, rA, rC, rOelb ));
Alpha   = link_plane( rO, rOelb, rOelb, rH );

end