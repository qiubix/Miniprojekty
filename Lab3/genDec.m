function res = genDec (class1, class2)
% wyliczenie parametrow plaszczyzny decyzyjnej klasyfikatora one-vs-one
% metoda perceptronowa

% class1, class2 - klasy rozdzielane plaszczyzna decyzyjna
% res - wektor z parametrami płaszczyzny decyzyjnej

	
set = [ ones(size(class1, 1),1) class1; 
	   -ones(size(class2, 1),1) -class2];
	
res = rand(1, size(set, 2)) -0.5;
mi = 1;
do
	J = set*res';
	grad = sum(set(J<0,:))/sqrt(mi);
	res = res + grad;
	mi = mi+1;
until (norm(grad)<0.01 || mi>1000)
res = res/norm(res);
%sum(J<0)
