function pars1=windkessel_1(d_wave,f,R)
%f=1000;
%估计模型中的未知参数L;C1;C2

L=length(d_wave);
t=1:1:L;
t=t/f;
peak=max(d_wave);
trough=min(d_wave);
%待估参数初始值设定
x2(1,1:7)=0;
x2(1)=0.7*(peak-trough)+trough;
x2(2)=-log(trough/x2(1))/t(1,L);
x2(3)=0.3*(peak-trough);
x2(4)=-log(0.1)/t(1,L);
x2(5)=2.5*pi/t(1,L);
x2(6)=0;
x2(7)=1;
options=statset('MaxIter',1000,'TolFun',1e-20,'TolX',1e-20,'FunValCheck','off');
%优化函数
%b2为参数估计的结果，r2为拟合波形与实际波形间的误差
[b2,r2] = nlinfit(t,d_wave,@myfun2,x2,options);
% [b2,r2] =lsqcurvefit(@myfun2,x2,t,d_wave); %确定待定系数
%b2计算C1，C2，L的中间过程，计算a1-a7
k(1,1:3)=0;
k(1)=b2(2)*(b2(4)^2+b2(5)^2);%p
k(2)=2*b2(2)*b2(4)+b2(4)^2+b2(5)^2;%n
k(3)=(2*b2(4)+b2(2));%m
pars1(1,1:3)=0;
pars1(3)=1/(R*k(3));%C2
pars1(2)=(k(3)*k(2)-k(1))/(k(3)*k(1)*R);%C1
pars1(1)=R*(k(3)^2)/(k(3)*k(2)-k(1));%L
%总体误差计算
err=sum(abs(r2))/length(r2);
waveout=myfun2(b2,t);
%输出拟合波形与原始波形
figure(1)
plot(waveout,'g');
hold on
 plot(d_wave,'r');
% q0=(1/R)*(b2(1)+b2(3)*cos(b2(6)))+pars(3)*(-b2(1)*b2(2)-b2(3)*b2(4)*cos(b2(6))-b2(3)*b2(5)*sin(b2(6)))
% p1=b2(1)+b2(3)*cos(b2(6))+(pars(1)/R)*(-b2(1)*b2(2)-b2(3)*b2(4)*cos(b2(6))-b2(3)*b2(5)*sin(b2(6)))+pars(1)*pars(3)*(b2(1)*(b2(2)^2)+b2(3)*cos(b2(6))*((b2(4)^2)-(b2(5)^2))+2*b2(3)*b2(4)*b2(5)*sin(b2(6)))
% p2=b2(1)+b2(3)*cos(b2(6))
save pars1.mat pars1;

