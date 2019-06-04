function [ Rz ] = rotz( angle )

Rz = [cos(angle) -sin(angle);
      sin(angle) cos(angle) ];
end

