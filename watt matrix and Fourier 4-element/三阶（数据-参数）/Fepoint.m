function [minX,minY,maxX,maxY,cminX,cminY,cmaxX,cmaxY]=Fepoint(wave)
% load data.mat;
p1=wave;%4
% p1=p1(15290:length(wave));
le=length(p1);
maxX=0;
maxY=p1(1);
minY=p1(1);
cminY=0;
cmaxY=0;
cminX=0;
cminX=0;
%最高点P1
for i=1:1:length(p1)
   if(p1(i)>maxY)
        maxY=p1(i);
   end
end
for i=1:length(p1)
    if(p1(i)==maxY)
        maxX=i;
    end
end
    
%最低点P4
for i=1:length(p1)
    if(p1(i)<minY)
        minY=p1(i);
    end
end
for i=1:length(p1)
    if(p1(i)==minY)
        minX=i;
    end
end

%次低点p2
for i=2:(length(p1)-1)
    if((p1(i-1)-p1(i)>0)&&(p1(i)-p1(i+1)<0))
        cminY=p1(i);
    end
end
for i=1:length(p1)
    if(p1(i)==cminY)
        cminX=i;
    end
end
    
%次高点
cmaxY=p1(cminX);
for i=cminX:(length(p1)-1)
    if(p1(i)>cmaxY)
        cmaxY=p1(i);
    end
end
for i=cminX:length(p1)
    if(p1(i)==cmaxY)
        cmaxX=i;
    end
end
fa=[minX,minY,maxX,maxY,cminX,cminY,cmaxX,cmaxY];

save Feature.mat fa;

plot(p1,'b');
hold on;
plot(maxX,maxY,'ro');
hold on;
plot(cmaxX,cmaxY,'bo');
hold on;
plot(minX,minY,'gs');
% hold on;
% plot(cminX,cminY,'ys');
% ylabel('Amplitude');
% h = legend('Orignal pulse','Feature points',0);
% set(h,'Interpreter','none')

