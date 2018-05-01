function pw = windkp2(qao, t, R1, C1,C2, L)

% compute pressure from qao, R and C and L

nt = length(t);
fq = fft(qao)/nt;

qtot = zeros(size(t))+real(fq(1));
pw = qtot*R1;
nh = floor(nt/2);

f1=1/t(nt);
for ih = 1:nh,
   f(ih) = ih*f1;                           		% define frequency(1:nh)
   omega(ih) = 2*pi*f(ih);                      	% define omega (1:nh)
   q(ih,:) = real(2*fq(ih+1)*exp(i*omega(ih)*t));       % flow (nh:nt)
  % z = i*omega(ih)*L+1/(i*omega(ih)*C+1/R);
  k=i*omega(ih);
  z=R1/(L*C1*C2*R1*k^3+L*C1*k^2+(C1*R1+C2*R1)*k+1);
   fpw(ih+1) = fq(ih+1)*z;
   p(ih,:) = real(2*fpw(ih+1)*exp(i*omega(ih)*t));       % flow (nh:nt)
   pw = pw + p(ih,:);                       % total flow
end

