%znane: wwyb, TAU

horyzont = 400;
t = 0;
y_odpskok = zeros(horyzont + 1, 1);
u = [zeros(t, 1); ones(horyzont - t, 1)];
for i = TAU+2:horyzont
    y_odpskok(i+1) = odpowiedzModelu(wwyb, u(i-1-TAU:i-TAU), y_odpskok(i-1:i));
end

if true
    figure; hold on;
    stairs(y_odpskok, 'r');
    stairs(u, 'b');
    grid;
end