function f = odefuncs(t,y)     
      c1 =0.795;                             
      c2  =0.051;
      c3 = 0.007;
      L1  =0.044;
      L2 = 0.03;
      R=1.602;
       
q0 = 0;         %flow onset
ts = 0.05;      %systolic onset
tp=ts + 0.05;   %time of peak systole
td=ts + 0.3;    %diastolic onset
tc=0.03;        %aortic valve closing time
Tc=1;
q_p=500;

thelp = mod(t/Tc,1);
    if thelp<= ts
            qt = q0;
        elseif thelp <= tp
            qt = q_p/(tp-ts)*(thelp-ts);
elseif thelp<td
            qt = q_p-q_p/(td-tp-tc)*(thelp-tp);
else
    qt=0;
end
                                      
       f = [0 -1/c1 0 0 0; 1/L1 0 -1/L1 0 0; 0 1/c2 0 -1/c2 0; 0 0 1/L2 0 -1/L2; 0 0 0 1/c3 -1/(R*c3)]*y+[1/c1;0;0;0;0]*qt; 
      save pars1.mat f
end

