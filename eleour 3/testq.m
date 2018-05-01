Ts=0.35;
Tc=1;
tstep = 1e-3;
tend=10;
q0 = 439.3256;

t=[0:tstep:tend]

for i=1:length(t)
    thelp = mod(t(i)/Tc,1);
     if thelp <= Ts      
                Qin(i)= q0*sin(pi*thelp*(1/Ts))^2;
          else
             Qin(i) = 0;
                
    
     end
end
     plot(t, Qin)