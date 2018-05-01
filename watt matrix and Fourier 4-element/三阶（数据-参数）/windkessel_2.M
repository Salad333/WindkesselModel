function pars1=windkessel_2(d_wave)


tstep = 1e-3;
tend=10;
tspan = [0 : tstep : tend];
%L=length(d_wave);
%tspan=1:1:L;
%tspan=tspan/1000;
%tstep=1/1000;


y0     = [0; 0;0];  


waveout = elour(y0,tspan,tstep); % Output y for Euler method
q1=waveout(2,:);
p1=waveout(1,:);
p2=waveout(3,:);
%R1=mean(p2/q1);
save pq.mat p2 q1



%figure
%plot(q1);
%figure
%plot(p1);
%figure
%plot(waveout(3,:));
peak=max(d_wave);
trough=min(d_wave);
ma=max(waveout(3,:));
mi=min(waveout(3,:));
gy=(waveout(3,:)-mi)/(ma-mi);
bpd=trough;
bps=peak;
hg=gy*(bps-bpd)+bpd;
waveout1=hg;
save waveout1.mat waveout1
t=size(d_wave);
x=(1:1:t(2))/1000;
N=length(x);
%figure
waveoutr=waveout(3,:);
pulseraw=waveoutr(5060:5060+(N-1));
%plot(pulseraw);
save pulseraw.mat pulseraw
save x.mat x
t1=size(waveout1(5060:5060+(N-1)));
x1=(1:1:t1(2))/1000;
save x1.mat x1
figure
plot(x,d_wave,'r');
pulser=d_wave;
save pulser.mat pulser
hold on;
%figure
plot(x1,waveout1(5060:5060+(N-1)),'g');
pulsef=waveout1(5060:5060+(N-1));
save pulsef.mat pulsef


%hold on;
%plot(tspan(5050:5090)-5,waveout1(5050:5090)-5,'g');

