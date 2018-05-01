function f = odefuncss(t,y)     
      load cs.mat
      load pars1.mat
      L=pars1(1);
      c1=pars1(2);
      c2=pars1(3);
       

      Ts = 0.3;                                         % systolic time period
      Tc = 0.8;                                           % cardiac cycle time
      q0 = 366.519;
%      p=0;

     
thelp = mod(t/Tc,1);
     if thelp <= Ts      
                Qin= q0*sin(pi*thelp*(1/Ts));
          else
              Qin = 0;
                
    
     end
                                      
      f = [0 -1/c1 0; 1/L 0 -1/L; 0 1/c2 -1/(R*c2)]*y+[1/c1;0;0]*Qin; 
      save matrixs.mat f
end

