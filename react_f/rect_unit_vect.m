% react_f(j,:)       = [rfB, rfA, rfO, rfC, rfP];
%                       rf = [M_z, R_x, R_y]

B_uv = rfB(2:3)/norm(rfB(2:3));
A_uv = rfA(2:3)/norm(rfA(2:3));
O_uv = rfO(2:3)/norm(rfO(2:3));
C_uv = rfC(2:3)/norm(rfC(2:3));
P_uv = rfP(2:3)/norm(rfP(2:3));

B1_uv = rfB_1(2:3)/norm(rfB_1(2:3));
A1_uv = rfA_1(2:3)/norm(rfA_1(2:3));
O1_uv = rfO_1(2:3)/norm(rfO_1(2:3));
C1_uv = rfC_1(2:3)/norm(rfC_1(2:3));
P1_uv = rfP_1(2:3)/norm(rfP_1(2:3));
