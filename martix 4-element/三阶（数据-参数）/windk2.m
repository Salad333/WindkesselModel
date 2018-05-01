function es=windk2(pao,qao,t)

% load pressure and flow

%load pqs.mat;
%pao=pulsep2;
%qao=pulseq1;
load pulser.mat
load qint.mat
pao=pulser;
qao=qintriangle;

% define time axis and plot

nt = length(pao);
t = 0:1/(nt-1):1;
subplot(211)
plot(t,qao);

% define initial values for R and C and L

R = mean(pao)/mean(qao);
%R = 1/25;
C1 = 0.171437;
C2=0.0487833;
L=0.0369288;

% compute pressure from qao, R and C and L

pw = windkp2(qao, t, R, C1,C2, L);

subplot(212)
plot(t,pao,t,pw,'o');

% estimate C

guess = [R C1 C2 L];
options(1) = 1;
%options=optimset ('MaxIter',100000000000','MaxFunEvals',100000000000);
est = fminsearch('fwindkp2',guess,options);

R
R = est(1)
C1
C1 = est(2)
C2
C2 = est(3)
L
L = est(3)

pw = windkp2(qao, t, R, C1,C2, L);
pw0 = windkp2(qao, t, R, C1,C2, 0);

subplot(212)
plot(t,pao,t,pw,'o',t,pw0,'--');

subplot(211)
qest1=(max(qao)-min(qao))*(pao-pw-min(pao-pw))/max((pao-pw)-min(pao-pw));
qest=qest1-mean(qest1)+mean(qao);
plot(t,qest,'o',t,qao);
save parameters.mat C1 C2 L R
end
