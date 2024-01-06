
tstart=0;
tend=1;
fs=100;
ts=1/fs;
t=tstart:ts:tend-ts;


fc=5;
V=180*10/36;
R=250*1000;
beta=0.3;
alpha=0.5;
fd=beta*V;
c=3*1e9;
ro=2/c;
td=ro*R;
received=alpha*cos(2*pi*(fc+fd)*(t-td));
plot(received)
title('received signal')
