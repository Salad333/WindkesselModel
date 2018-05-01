function f = odefuncss(t,y)     
      c1 =0.171437;                             
      c2  =0.0487833;                                  
      L  =0.0369288;
      R=0.971319;
       

      Ts = 0.35;                                         % systolic time period
      Tc = 1;                                           % cardiac cycle time
      q0 = 439.3246;
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

