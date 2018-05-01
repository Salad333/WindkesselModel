function es=windk2(qao,pao)
global t
% load pressure and flow

%load pqs.mat;
%pao=pulsep2;
%qao=pulseq1;



% define time axis and plot

nt = length(pao);
t = 0:1/(nt-1):1;
%figure
%subplot(211)
%plot(t,qao);

% define initial values for R and C and L
load cs.mat
load pars1.mat

R = mean(pao)/mean(qao);
R1=R;
%R = 1/25;
%R1=R;
C1 = pars1(2);
C2 = pars1(3);
L  = pars1(1);

% compute pressure from qao, R and C and L

pw = windkp2(qao, t, R1, C1,C2, L);
figure
subplot(211)
plot(t,pao,'--b',t,pw,'*r');
hold on 
title('Fourier model with original parameter set')
xlabel('t [s]')
ylabel('P [mmHg]')

% estimate C

guess = [R1 C1 C2 L];
options(1) = 1;
%options=optimset ('MaxIter',100000000000','MaxFunEvals',100000000000);
est = fminsearch('fwindkp2',guess,options);

R1
R1 = est(1)
C1
C1 = est(2)
C2
C2 = est(3)
L
L = est(3)

pw = windkp2(qao, t, R1, C1,C2, L);
%pw0 = windkp2(qao, t, R1, C1,C2, 0);

subplot(212)
plot(t,pao,t,pw,'o');
hold on 
title('Fourier model with optimal parameter set')
xlabel('t [s]')
ylabel('P [mmHg]')
%subplot(211)
%qest1=(max(qao)-min(qao))*(pao-pw-min(pao-pw))/max((pao-pw)-min(pao-pw));
%qest=qest1-mean(qest1)+mean(qao);
%plot(t,qest,'o',t,qao);
save parameters.mat C1 C2 L R1
end

