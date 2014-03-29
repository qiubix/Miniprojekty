function [ MP ] = budujMP( S, N )

    D = size(S,1);
    MP = zeros(N, D-1);
    for j = 1:D-1
        for i = 1:N
            if i+j > size(S, 1)
                MP(i, j) = S(end) - S(j);
            else
                MP(i, j) = S(i+j) - S(j);
            end
        end
    end
end

