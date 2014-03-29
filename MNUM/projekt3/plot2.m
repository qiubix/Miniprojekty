function [] = plot2()
% Program rysujacy wykres funkcji do zadania 2
% wraz z zaznaczeniem punktow zerowych

  x = [-6:0.1:4];
  f = 'x.^4 +3*x.^3 -8*x.^2 +4*x+2';
  plot(x,eval(f));
  hold on;
  plot(x,0,'k-');
  x=[-4.8158 -0.3007];
  plot(x,eval(f),'ko')
  hold off;
end
