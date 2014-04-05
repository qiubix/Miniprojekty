function plot2features(ts, f1, f2)
	plot(ts(ts( :,1 )==4, f1), ts(ts( :,1 )==4,f2),"k*");
	hold on;
	plot(ts(ts( :,1 )==3, f1), ts(ts( :,1 )==3,f2),"r*");
	plot(ts(ts( :,1 )==2, f1), ts(ts( :,1 )==2,f2),"m+");
	plot(ts(ts( :,1 )==1, f1), ts(ts( :,1 )==1,f2),"b+");
	hold off;