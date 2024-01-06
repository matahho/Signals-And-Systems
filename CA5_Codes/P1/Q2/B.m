y1=fftshift(fft(x4));
f1=-50:1:49;
plot(f1,abs(y1)/max(abs(y1)))
xlabel('Frequency')
ylabel('F(x1)')
title("cos(30*pi*t+(pi/4))")