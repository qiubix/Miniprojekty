
%znane: wwyb, TAU
getout = false;
T = 1;
ymax = [];
horyzont = 150;
max_oscylacji = 3; %liczba oscylacji + 1 na przesterowanie
for Kk = 0.3:0.01:2
   y = odpowiedzPID(TAU, wwyb, Kk, T, 1e6, 0, horyzont);
   
   if y(end-1) ~= y(end)
       y(end);
       for i = numel(y)-1:-1:2
           if y(i) > y(i-1) && y(i) > y(i+1) && y(i) > 1.01 * y(end)
               ymax = [ymax; y(i) i];
           end
           
           if ~isempty(ymax) &&  size(ymax, 1) > max_oscylacji;
               getout = true;
               break;
           end
       end
   end
   
   if getout
       break
   else
       ymax = [];
   end
end

Kk;
Tk = (ymax(end-2,2) - ymax(end-1,2)) * T;
display(['K_kryt = ', num2str(Kk), ' T_kryt = ', num2str(Tk)]);

if true
    figure; hold on;
    title(['K = ', num2str(Kk)]);
    stairs(y, 'r');
    grid
    %stairs(u, 'b');
end

K = 0.6 * Kk;
Ti = 0.5 * Tk;
Td = 0.12 * Tk;
y_zn = odpowiedzPID(TAU, wwyb, K, T, Ti, Td, horyzont);
display(['Nastawy ZN: K = ', num2str(K), ' Ti = ', num2str(Ti), ' Td = ', num2str(Td)]);

if true
    figure; hold on;
    title(['K = ', num2str(K), ' Ti = ', num2str(Ti), ' Td = ', num2str(Td)]);
    stairs(y_zn, 'r');
    grid
    %stairs(u, 'b');
end
