function [ Beta, Theta_F, Theta3, Theta0, Alpha] = angles( phi, rO, rC, rA, rB, rP, rQ, rOelb )

% Beta    --  +OX ^ AP
% Theta_F --  +OX ^ QP
% Theta3  --  +OX ^ CB
% Theta0  --  -OX ^ OC
% Alpha   --  +OX ^ OOelb

% ground(+OX) --> OA

Beta    = link_plane(rO, rA, rA, rP  );
Theta_F = link_plane(rO, rA, rQ, rP );
Theta3  = link_plane( rO, rA,rC, rB );
Theta0  = link_plane(rC, rO, rA, rO );
Alpha   = link_plane(rA, rO, rO, rOelb );

end