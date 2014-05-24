function [tvec tlab tstv tstl] = readSets(dla)
% funkcja czyta zbiory ucz�cy i testowy
% powsta�a, bo zm�czy�o mnie wpisywanie potwornych nazw plik�w

	fnames = { 'train-images.idx3-ubyte'; 'train-labels.idx1-ubyte';  
				't10k-images.idx3-ubyte'; 't10k-labels.idx1-ubyte' };

	[tlab tvec] = readmnist(fnames(1,1), fnames(2,1));
	[tstl tstv] = readmnist(fnames(3,1), fnames(4,1));
