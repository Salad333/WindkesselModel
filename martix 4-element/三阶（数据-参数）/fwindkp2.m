function f = fwindkp2(par)

global qao pao t

f = windkp2(qao, t, par(1) , par(2), par(3),par(4) ) - pao;
f = sum(f.^2);
