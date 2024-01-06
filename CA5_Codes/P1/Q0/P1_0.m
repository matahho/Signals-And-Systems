f1=-10:1:9;
t1= 0:1/20:0.95;
x1=exp(1i*2*pi*5*t1)+exp(1i*2*pi*8*t1);
y1=fftshift(fft(x1));
plot(f1,abs(y1),LineWidth=1)
xlabel('Frequency')
ylabel('Fourire')
title('exp(1i*2*pi*5*t1)+exp(1i*2*pi*8*t1)')
figure()
x2=exp(1i*2*pi*5*t1)+exp(1i*2*pi*5.1*t1);
y2=fftshift(fft(x2));
plot(f1,abs(y2),LineWidth=1)
xlabel('Frequency')
ylabel('Fourire')
title('exp(1i*2*pi*5*t1)+exp(1i*2*pi*5.1*t1)')


