function tab = testAlt2(ok,er,ev,ok2,er2,ev2)

tab = zeros(3,3);


tab(1,1) = 1 - abs(ok2-ok)/ok;
tab(1,2) = 1 - (ok-abs(er-er2))/ok;
tab(1,3) = 1 - (ok-abs(ev-ev2))/ok;

tab(2,1) = (abs(ok-ok2)-abs(ev-ev2) )/er;
%tab(2,2) = 1 - abs(er2-er)/er;
tab(2,3) = 0;
%tab(2,1) = 1 - (er - abs(ev-ev2))/er;
tab(2,2) = 1 - abs(er2-er)/er;
%tab(2,3) = (abs(ev-ev2)-abs(ok-ok2))/er;

tab(3,1) = 1 - (ev2 -abs(ok-ok2) )/ev2;
tab(3,2) = 1 - (ev2 - abs(er-er2))/ev2;
tab(3,3) = 1 - abs(ev2-ev)/ev2;


end
