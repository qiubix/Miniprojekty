function [ u ] = pid_m( u_prev, k, Ti, Td, T, e )


    if numel(e) ~= 3
        display('B£¥D! Podano nieprawid³owy uchyb');
    end
    
    r0 = K * (1 + (T/(2*Ti)));
    r1 = K * ((T/Ti) - 2 * (Td/T) - 1);
    r2 = (K * Td)/T;
    u = u_prev + r0 * e(3) + r1 * e(2) + r2 * e(1);

end

