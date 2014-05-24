function M = testAlt(Q,Q2,n)

M = zeros(3,3);

er = Q(11,3)*n;
ev = Q(11,4)*n;
ok = n - er - ev;

er2 = Q2(11,3)*n;
ev2 = Q2(11,4)*n;
ok2 = n - er2 - ev2;

M(1,1) = 1 - abs(ok-ok2)/ok;
M(1,2) = 1 - abs(ok-er2)/ok;
M(1,3) = 1 - abs(ok-ev2)/ok;
M(2,1) = 1 - abs(er-ok)/er;
M(2,2) = 1 - abs(er-er2)/er;
M(2,3) = 1 - abs(er-ev2)/er;
M(3,1) = 1 - abs(ev-ok)/ev;
M(3,2) = 1 - abs(ev-er2)/ev;
M(3,3) = 1 - abs(ev-ev2)/ev;




end
tab(1,1) = 1 - abs(ok2-ok)/ok;
tab(1,2) = 1 - abs(ok2-er)/ok;
tab(1,3) = 1 - abs(ok2-ev)/ok;
tab(2,1) = 1 - abs(er2-ok)/er;
tab(2,2) = 1 - abs(er2-er)/er;
tab(2,3) = 1 - abs(er2-ev)/er;
tab(3,1) = 1 - abs(ev2-ok)/ev;
tab(3,2) = 1 - abs(ev2-er)/ev;
tab(3,3) = 1 - abs(ev2-ev)/ev;