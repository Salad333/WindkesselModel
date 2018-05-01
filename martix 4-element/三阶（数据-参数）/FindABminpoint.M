function [nmax,xmax,nmin,xmin]=FindABminpoint(Data_pulse_Debaseline,th)
% clc;clear all;fs=1000;
% [filename,pathname]=uigetfile({'*.txt'},'选取数据文件');
% str=[pathname filename]; % read the data from the file
% Data_All=load(str);
% Data_Pulse=Data_All(2:6:end); % read pulse data only 
% Data_pulse_Debaseline=0.2539*Data_Pulse-91.5087; 
% transform the unit of pulse from mv to g
% Data_Pulse_Denoise=(Aavefilter(Data_Pulse_Tran));
% Data_pulse_Debaseline=DeBaseline(Data_Pulse_Denoise,fs);
% average filtering:7 point for a average 
% Data_pulse_Debaseline0=load('matlab.mat');th=0.2;
% Data_pulse_Debaseline=Data_pulse_Debaseline0.pulse_pspd;
nn=floor(length(Data_pulse_Debaseline)/800);
mp=max(Data_pulse_Debaseline)';
Apulse1=Data_pulse_Debaseline;
a=th*mp; %设置阈值0.2
b=mp-a;
i=length(Apulse1)
for n=1:i
    if Apulse1(n)>b
         Apulse1(n)=b;
    else 
        Apulse1(n)=0;
    end
end
for n=(floor(length(Data_pulse_Debaseline)/(2*nn))):i 
if (Apulse1(n-1)==0)&& (Apulse1(n)~=0)
      for m=(n-floor((length(Data_pulse_Debaseline)/(2*nn)))):n
              if (Apulse1(m+1)==0)&& (Apulse1(m-1)~=0)
                  if n-m>floor((length(Data_pulse_Debaseline)/20))
                   Apulse1(n)=b;  
                  else
                      for mm=n:(n+200)
                          Apulse1(mm)=0;  
                      end
                  end
              end
            end
end
end
%figure(2)
%plot(Apulse1);
%figure;
%plot(x);xlabel('n');ylabel('x(n)');
Apulse2=diff(Apulse1); %对信号进行差分
 %figure(3)
%plot(Apulse2,'r')
%figure;
%plot(pulse2);
%xlabel('t');ylabel('pulse2(t)');
s=find(Apulse2>0);%找到信号的升支点（大于0为升支，小于0为降支）
b=length(s);
for j=2:b-1
    %峰值
    jj=j-1;
  ymax(jj)=max(Data_pulse_Debaseline(s(1,j):s(1,1+j)));
  xmax(jj)=max(find(Data_pulse_Debaseline(s(1,j):s(1,1+j))==max(Data_pulse_Debaseline(s(1,j):s(1,1+j)))))+s(1,j)-1;
  % 主波的横坐标
  % 始射点
  ymin(jj)=min(Data_pulse_Debaseline(s(1,j):s(1,1+j)));
  xmin(jj)=max(find(Data_pulse_Debaseline(s(1,j):s(1,1+j))==min(Data_pulse_Debaseline(s(1,j):s(1,1+j)))))+s(1,j)-1; 
  % pulse_ReDenoise=Aavefilter(Data_Pulse_Denoise(nmax(j):min(j)));
end
%figure;
%plot(Data_pulse_Debaseline);   
%hold on
%plot(xmin,ymin,'r.');
%hold on;
%plot(xmax,ymax,'r.');
 save minpo.mat xmin;
 save maxpo.mat xmax;
 save minypo.mat ymin;
 save maxypo.mat ymax;