function out = rysuj(fig_title, y_dmc, u_dmc)
	figure; hold on;
    title(fig_title);
    stairs(y_dmc, 'r');
    stairs(u_dmc, 'b');
    grid;
end