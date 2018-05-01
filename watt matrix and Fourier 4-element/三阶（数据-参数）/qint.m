 load cs.mat
ts=0.01;
tp=ts+0.09;
td=ts+0.3;
Tc=1;
tstep = 1e-3;
tend=10;
q0 = 0;
q_p=(2*sv1)/td;
tc=0.03;
load x.mat

t=[0:tstep:tend];

for i=1:length(t)
    thelp = mod(t(i)/Tc,1);
    if thelp<= ts
           qt(i) = q0;
        elseif thelp <= tp
            qt(i) = q_p/(tp-ts)*(thelp-ts);
elseif thelp<td
            qt(i) = q_p-q_p/(td-tp-tc)*(thelp-tp);
else
    qt(i)=0;
end
end
N=length(x);
qintriangle=qt(5040:5040+(N-1));
%qintriangle=qt(5080:6060);
save Qint.mat qt qintriangle
     plot(qt)
     %plot(t,qt)


