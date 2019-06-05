function [Alpha_1, Alpha_2, Alpha_3, Theta_1, Theta_2, Theta_F, Beta, Lamda_3, Lamda_1 ]= angles( rO, rA, rB1, rB2, rB3, rC1, rC2, rP, rQ );

% Alpha_1 - +OX ^ B3B1
% Alpha_2 - -OX ^ B2B1
% Alpha_3 - -OX ^ B2B3
% Theta_1 - +OX ^ B3C1
% Theta_2 - +OX ^ B2C2
% Theta_F - +OX ^ PQ
% Beta    - -OX ^ PA
% Lamda_3 - +OX ^ C1O
% Lamda_1 - -OX ^ C2O

% ground(OX) --> OA


Alpha_1 = link_plane( rB3, rB1, rA, rO );
Alpha_2 = link_plane( rB2, rB1, rO, rA );
Alpha_3 = link_plane( rB2, rB3, rO, rA );

Theta_1 = link_plane( rB3, rC1, rA, rO );
Theta_2 = link_plane( rB2, rC2, rA, rO );

Lamda_3 = link_plane( rC1, rO,  rA, rO );
Lamda_1 = link_plane( rC2, rO,  rO, rA );

Beta    = link_plane( rP, rA, rO, rA );
Theta_F = link_plane( rP, rQ, rA, rO );

end