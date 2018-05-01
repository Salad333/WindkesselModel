function f = odefuncss(t,y)     
      c1 =0.1644;                             
      c2  =0.0329;                                  
      L  =0.0512;
      R=1.95697;
       

      Ts = 0.3;                                         % systolic time period
      Tc = 0.8;                                           % cardiac cycle time
      q0 = 500;
%      p=0;

     
thelp = mod(t/Tc,1);
     if thelp <= Ts      
                Qin= q0*sin(pi*thelp*(1/Ts))^2;
          else
              Qin = 0;
                
    
     end
                                      
      f = [0 -1/c1 0; 1/L 0 -1/L; 0 1/c2 -1/(R*c2)]*y+[1/c1;0;0]*Qin; 
      save pars2.mat f
end
