ts=0.05;
tp=ts+0.05;
td=ts+0.3;
Tc=1;
tstep = 1e-3;
tend=10;
q0 = 0;
q_p=439.3246;
tc=0.03;

t=[0:tstep:tend];

for i=1:length(t)
    thelp = mod(t(i)/Tc,1);
    if thelp<= ts
            qt(i) = q0;
        elseif
 help <= tp
            qt(i) = q_p/(tp-ts)*(thelp-ts);
elseif thelp<td
            qt(i) = q_p-q_p/(td-tp-tc)*(thelp-tp);
else
    qt(i)=0;
end
end
save qt.mat qt
qintriangle=qt(5080:5901);
save qint.mat qintriangle
figure
plot(qintriangle)
    % plot(t(5040:6013), qintriangle)
    figure
    plot(t,qt)
     grid on
     hold on
     title('Aortic Flow')
     xlabel('t [s]')
     ylabel('q [ml/s]')

