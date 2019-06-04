function rB3 = btw_lines( rC1, rB1, B3C1, B3B1, val, ind, log)
% val - relocate with respect to what point
% ind - with respect to val's 1x or y
% log - relocate from what side (0up-1down for y; 0right-1left for x)

eqn_C1B3  = '( rC1(1) - xB3sol )^2 + ( rC1(2) - yB3sol )^2 = B3C1^2';
eqn_B3B1 = '( xB3sol - rB1(1) )^2 + ( yB3sol - rB1(2) )^2 = B3B1^2';
solB3 = solve(eqn_C1B3, eqn_B3B1, 'xB3sol, yB3sol');
xB3_pos = eval(solB3.xB3sol);
yB3_pos = eval(solB3.yB3sol);

xB31 = xB3_pos(1);
xB32 = xB3_pos(2);
yB31 = yB3_pos(1);
yB32 = yB3_pos(2);

if ind == 1
    ref = xB31;
else
    ref = yB31;
end

if log
    if ref < val(ind)
        xB3 = xB31; yB3=yB31;
    else
        xB3 = xB32; yB3=yB32;
    end
    rB3 = [xB3 yB3 0];
    
else
    if ref > val(ind)
        xB3 = xB31; yB3=yB31;
    else
        xB3 = xB32; yB3=yB32;
    end
    rB3 = [xB3 yB3 0];
end

end
