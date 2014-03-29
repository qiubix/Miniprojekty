% Karol Kater¿awa
% Zadanie 7, punkt pierwszy

M = load('dane7.txt');
u = M(:, 1);
y = M(:, 2);

Tau_zak = 8;
w = zeros(Tau_zak, 2);
Ymodhist = zeros(size(y, 1) + 1, Tau_zak);
Ehist = zeros(Tau_zak, 1);

%model pierwszego rzêdu
for Tau = 1:1:Tau_zak
    w(Tau, :) = wyznacz_w(M, Tau, 1);
    ymod = testModelu(y, u, Tau, w(Tau, :));
    Ymodhist(:, Tau) = ymod;
    %tutaj siê w³¹cza wyœwietlanie wykresów
    if false
        figure; hold on;
        title(['Model pierwszego rzêdu, Tau = ', num2str(Tau)]); 
        stairs(y, 'r');
        stairs(ymod, 'b');
        grid;
    end
    E = sumaKwB(ymod, y, Tau);
    Ehist(Tau) = E;
    if false
        display(['Tau = ', num2str(Tau), ' B³¹d iloœciowy = ', num2str(E)]);
    end
end

if Tau_zak ~= 0 && false
    [minE, index] = min(Ehist)
else
    [minE, index] = min(Ehist);
end

%model drugiego rzêdu
Tau_zak2 = 8;
w2 = zeros(Tau_zak, 4);
Ymodhist2 = zeros(size(y, 1) + 1, Tau_zak);
Ehist2 = zeros(Tau_zak, 1);

for Tau = 1:1:Tau_zak2
    w2(Tau, :) = wyznacz_w(M, Tau, 2);
    ymod = testModelu(y, u, Tau, w2(Tau, :));
    Ymodhist(:, Tau) = ymod;
    %tutaj siê w³¹cza wyœwietlanie wykresów
    if false
        figure; hold on;
        title(['Model drugiego rzêdu, Tau = ', num2str(Tau)]); 
        stairs(y, 'r');
        stairs(ymod, 'b');
        grid;
    end
    E = sumaKwB(ymod, y, Tau);
    Ehist2(Tau) = E;
    if false
        display(['Tau = ', num2str(Tau), ' B³¹d iloœciowy = ', num2str(E)]);
    end
end

if Tau_zak2 ~= 0 && false
    [minE2, index2] = min(Ehist2)
else
    [minE2, index2] = min(Ehist2);
end

if true
    display(['Drugi rz¹d, Tau = 4, E = ', num2str(Ehist2(4))]);
    figure; hold on;
    title('Model drugiego rzêdu, Tau = 4'); 
    stairs(y, 'r');
    stairs(Ymodhist(:, 4), 'b');
    grid;
    display(['Drugi rz¹d, Tau = 5, E = ', num2str(Ehist2(5))]);
    figure; hold on;
    title('Model drugiego rzêdu, Tau = 5'); 
    stairs(y, 'r');
    stairs(Ymodhist(:, 5), 'b');
    grid;
    display(['Drugi rz¹d, Tau = 6, E = ', num2str(Ehist2(6))]);
    figure; hold on;
    title('Model drugiego rzêdu, Tau = 6'); 
    stairs(y, 'r');
    stairs(Ymodhist(:, 6), 'b');
    grid;
end


wwyb = w2(5,:);
TAU = 4;
z = tf('z', 'Variable', 'z^-1');
Gz = (wwyb(1) * z^(-TAU) + wwyb(2) * z^(-TAU-1))/(1 + wwyb(3) * z^(-1) + wwyb(4) * z^(-2))

Kz = dcgain(Gz);
display(['Wzmocnienie statyczne modelu Ks = ', num2str(Kz)]);

