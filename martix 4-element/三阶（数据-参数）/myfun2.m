function waveout=myfun2(y0,tspan,tstep)

 t = [tspan(1) : tstep : tspan(end)];
  N = length(t);
  
  % Intialize solution vector
  waveout    = zeros(size(y0,1),N);
  waveout(:,1) = y0;
  
  for i = 1:N-1  
    % et df/dt: evaluate function odefun at appropriate t
    f_i    = feval(@odefuncst,t(i),waveout(:,i));
    waveout(:,i+1) = waveout(:,i) + tstep * f_i;
  end  
