x=0:0.01:0.15;
y=(10000/3)*x;
x1=0.15:0.01:0.3;
y1=-(10000/3)*x1+1000;

figure
    plot(x,y)
    hold o 
    plot(x1,y1)
    hold on
    title('Triganle law')
    xlabel('t [s]');
    ylabel('q [ml/s]')