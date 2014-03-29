function [E] = sumaKwB(ymod, y, tau)

    y1 = ymod(1:end-1, 1);
    E = (y1(tau:end) - y(tau:end))' * (y1(tau:end) - y(tau:end));
end

