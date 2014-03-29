function [ M ] = budujM( S, N, Nu )
    
    M = zeros(N, Nu);
    for j = 1:Nu
        for i = j:N
            %display([num2str(i), ' ', num2str(j)]);
            if i - j + 1 > size(S, 1)
                M(i, j) = S(end);
            elseif i - j + 1 < 1
                M(i, j) = 0;
            else
                M(i, j) = S(i - j + 1);
            end
        end
    end
end

