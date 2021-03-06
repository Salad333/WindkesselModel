function fd = Showdistance()
load x.mat
load x1.mat
load pulser.mat
load pulsef.mat

X1=x;
Y1=p ser;

X2=x1;
Y2=pulsef;

f12=frechet(X1',Y1',X2',Y2');
f11=frechet(X1',Y1',X1',Y1');
f22=frechet(X2',Y2',X2',Y2');

figure;
imagesc([[f11,f12];[f12,f22]])
xlabel('curve')
ylabel('curve')
cb1=colorbar('peer',gca);
set(get(cb1,'Ylabel'),'String','Frechet Distance')
axis equal tight


end

