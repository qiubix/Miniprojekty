function [ ymod ] = testModelu(y, u, Tau, w)

    ymod = zeros(numel(y) + 1, 1);
    if Tau > size(w,2)/2
        helper = Tau;
    else
        helper = size(w,2)/2;
    end
    
    for i = 1:helper
       ymod(i) = y(i); 
    end
    
    u = [zeros(Tau - 1, 1); u(1:end-Tau + 1)];
    
    for k = (i + 1):1:(numel(y)+1)
       if size(w, 2) == 2
          ymod(k) = w(1) * u(k-1) + w(2) * ymod(k-1);
       elseif size(w, 2) == 4
           ymod(k) = w(1) * u(k-1) + w(2) * u(k-2) + w(3) * ymod(k-1) + w(4) * ymod(k-2);
       end
    end

end

