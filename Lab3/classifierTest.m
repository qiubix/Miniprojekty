function quality = classifierTest(A, tstv, tstl)
% Funkcja generujaca macierz porownujaca jakosc poszczegolnych klasyfikatorow one-vs-one

n=1;
for i = 0 : 8
	for j = i+1 : 9
		J1 = [ones(size(tstv(tstl==i), 1),1) tstv(tstl==i,:)]*A(n,:)';
		J2 = [ones(size(tstv(tstl==j), 1),1) tstv(tstl==j,:)]*A(n,:)';
		error = (sum(J1<0) + sum(J2>=0))/(size(tstv(tstl==i),1) + size(tstv(tstl==j),1));
		quality(n,:)= [i j 1-error error];
		n = n+1;
	end
end
