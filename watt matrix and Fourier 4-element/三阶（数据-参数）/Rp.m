function Rp=Rp(wave,tp)
ma=max(wave);
mi=min(wave);
gy=(wave-mi)/(ma-mi);
bpd=80;
bps=120;
hg=gy*(bps-bpd)+bpd;
wave=hg;   %change the value let it be normal 80-120
%figure;
%plot(wave);
FindABminpoint(wave,0.2);
load minypo.mat;
load maxypo.mat;
load minpo.mat;
load maxpo.mat;
ps=mean(ymax);
pd=mean(ymin);
%plot(x(14486:15459),wave(14486:15459),'g');
[m,index]=min(abs(pd-ymin));
min_valuey=ymin(index);
min_valuex=xmin(index);
pewave=wave(xmin(index-1):xmin(index));
%figure;
%plot(pewave);
[m1,index1]=max(pewave);
jzd=pewave(index1:length(pewave));
%figure;
%plot(jzd); many data-just the diastolic time
save pulse1.mat pewave;
save pulsed.mat jzd;
pm=sum(wave(xmin(index-1):xmin(index)))/length(wave(xmin(index-1):xmin(index))); 
k=(pm-pd)/(ps-pd);
sv1=0.283*tp*(ps-pd)/(k^2);
co=(17/k^2)*(ps-pd);
pv=0;%静脉压
R=((pm-pv)/sv1)*tp;%外周阻力
c=(k*sv1)/(ps-pd) 

save cs.mat ps pd R c sv1 co
save pewave
%公示来源《心血管动力学常数分析》
