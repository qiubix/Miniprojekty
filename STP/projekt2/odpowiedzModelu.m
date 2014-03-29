function [ yw ] = odpowiedzModelu( w, u, y )

    if size(w, 2) == 2
          yw = w(1) * u(1) + w(2) * y(1);
    elseif size(w, 2) == 4
          yw = w(1) * u(2) + w(2) * u(1) + w(3) * y(2) + w(4) * y(1);
    end
end

