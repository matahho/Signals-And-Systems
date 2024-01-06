
tstart=0;
tend=1;
fs=100;
ts=1/fs;
t=tstart:ts:tend-ts;


fc=5;
sent=cos(2*pi*fc*t);
plot(sent)
title('sent signal')

