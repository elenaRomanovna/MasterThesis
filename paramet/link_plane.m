function [ beta ] = link_plane( p1, p2, gr1, gr2 )
gr1 = gr1(1:2);
gr2 = gr2(1:2);

p1 = p1(1:2);
p2 = p2(1:2);

vector1 = (gr2 - gr1); % horizontal vector
vector2 = (p2 - p1); % link

beta = atan2(( det( [vector2', vector1'] )), dot( vector2', vector1' ));

% figure(3)
% clf
% plot([p1(1), p2(1)],   [p1(2), p2(2)]),   hold on
% plot([gr1(1), gr2(1)], [gr1(2), gr2(2)]), hold on
% xlim( [-0.45, 0.5] )
% ylim( [-0.45, 0.5] )
% grid on
% grid minor

end
