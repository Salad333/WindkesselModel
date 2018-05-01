function pars1=windkessel_1(d_wave)


tstep = 1e-3;
tend=10;
tspan = [0 : tstep : tend];
%L=length(d_wave);
%tspan=1:1:L;
%tspan=tspan/1000;
%tstep=1/1000;


y0     = [0; 0;0];  


waveout = myfun2(y0,tspan,tstep); % Output y for Euler method
q1=waveout(2,:);
p1=waveout(1,:);
p2=waveout(3,:);
%R1=mean(p2/q1);
save pq.mat p2 q1 p1

pulseq1=q1(5080:5901);
pulsep2=p2(5080:5901);
save pqs.mat pulseq1 pulsep2

%figure
%plot(q1);
%figure
%plot(p1);
figure
plot(pulsep2);
hold on 
title('Output pressure in four-element Windkessel system')
xlabel('t [0.1ms]')
ylabel('P [mmHg]')

ma=max(waveout(3,:));
mi=min(waveout(3,:));
gy=(waveout(3,:)-mi)/(ma-mi);
bpd=81.4;
bps=119;
hg=gy*(bps-bpd)+bpd;
waveout1=hg;
save waveout1.mat waveout1
figure
t=size(d_wave);
x=(1:1:t(2))/1000;
save x.mat x
t1=size(waveout1(5080:5901));
x1=(1:1:t1(2))/1000;
save x1.mat x1
plot(x,d_wave,'r');
pulser=d_wave;
save pulser.mat pulser
hold on;
%figure
plot(x1,waveout1(5080:5901),'--*g');
hold on
title('Pressure')
xlabel('t [s]')
ylabel('P [mmHg]')
pulsef=waveout1(5080:5901);
save pulsef.mat pulsef


%hold on;
%plot(tspan(5050:5090)-5,waveout1(5050:5090)-5,'g');

 






