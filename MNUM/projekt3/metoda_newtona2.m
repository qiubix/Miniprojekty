function [] = metoda_newtona2()
  syms f x;
  f = -2*x^4+6*x^3+3*x^2+7*x+1;
  f = 'x.^4 +3*x.^3 -8*x.^2 +4*x+2';
  fprim = diff(f,'x');
  a = input('Podaj punkt startowy: ');
  eps = input('eps = ');
  i = 0; 
  Xn = a;
  x = Xn;
  fXn = eval(f);
  fprimXn = eval(fprim);
  while abs(fXn) > eps & abs(fprimXn) > 2*eps,

    Xn = Xn - (fXn ./ fprimXn);    

    i = i + 1
    x = Xn
    fXn = eval(f)
    fprimXn = eval(fprim);
  end
  if abs(fXn) > eps,
    error('Metoda rozbie¿na w tym przedziale');
  end
end
