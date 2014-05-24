function wynik = zad3()

% =================== PRZYGOTOWANIE DANYCH ===================================

% Zaladowanie zbiorow danych MNIST
[tvec tlab tstv tstl] = readSets();
% tvec - macierz zawierajaca cechy obrazow zbioru uczacego
% tlab - macierz zawierajaca etykiety obrazow zbioru uczacego
% tstv - macierz zawierajaca cechy obrazow zbioru testowego
% tstl - macierz zawierajaca etykiety obrazow zbioru testowego

% Policzenie transformacji do przestrzeni PCA ( n - wymiarowej)
[mu trmx] = prepTransform(tvec, 40);
% mu - wartosc srednia zbioru uczacego
% trmx - macierz transformacji do n-wymiarowej przestrzeni PCA

% Przeksztalcenie zbiorow uczacego i testowego do przestrzeni PCA
tvec = pcaTransform(tvec, mu, trmx);
tstv = pcaTransform(tstv, mu, trmx);

% Wygenerowanie na podstawie zbioru uczacego macierzy wspolczynnikow plaszczyzn decyzyjnych
A = genA(tvec,tlab);

% Klasyfikacja metoda one-vs-one, korzystajac z klasyfikatorow porownujacych
% kazda cyfre z kazda, a nastepnie przeprowadzajac glosowanie, ktora cyfra uzyskala najwieksza liczbe glosowanie
% Tworzona jest nastepnie macierz pomylek 
[M, E, Q] = classificationOVO(A, tstv, tstl)


B = genB(tvec,tlab);


[M2 E2 Q2] = classificationOVO2(A,B,tstv,tstl)
