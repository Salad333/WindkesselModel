function fd = Showdistance(X1,X2,Y1,Y2)


f12=frechet(X1',Y1',X2',Y2');
f11=frechet(X1',Y1',X1',Y1) ;
f22=frechet(X2',Y2',X2',Y2');
save distance.mat f12

%figure;
%imagesc([[f11,f12];[f12,f22]])
%xlabel('curve')
%ylabel('curve')
%cb1=colorbar('peer',gca);
%set(get(cb1,'Ylabel'),'String','Frechet Distance')
%axis equal tight


end

