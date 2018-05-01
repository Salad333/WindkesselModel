function f = odefuncst(t,y)     
      %c1 =0.171437;                             
      %c2  =0.0487833;                                  
      %L  =0.0369288;
      %R=0.971319;
      load cs.mat
      load pars1.mat
      L=pars1(1);
      c1=pars1(2);
      c2=pars1(3);
       
q0 = 0;         %flow onset
ts = 0.01;      %systolic onset
tp=ts + 0.09;   %time of peak systole
td=ts + 0.3;    %diastolic onset
tc=0.03;        %aortic valve closing time
Tc=1;
q_p=(2*sv1)/td;
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

                                      
      f = [0 -1/c1 0; 1/L 0 -1/L; 0 1/c2 -1/(R*c2)]*y+[1/c1;0;0]*qt; 
      save matrix.mat f
end

