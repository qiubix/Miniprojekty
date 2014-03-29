function [ ] = plot1( )
% Program rysujacy wykres funkcji do zadania 1
% wraz z zaznaczeniem przedzialow i punktow zerowych

  x = [-5:0.1:5];
  f = '1.4*sin(x)-exp(x)+6*x-0.5';
  plot(x,eval(f));
  hold on;
  plot(x,0,'k-');
  plot(-1,-140:20,'g-');
  plot(2,-140:20,'g-');
  plot(3.5,-140:20,'g-');
  x = [0.2397 2.8270];
  plot(x,eval(f),'ro')
  hold off;
end

