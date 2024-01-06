tol = 1e-6;
y4(abs(y4) < tol) = 0;
theta = angle(y4);
plot(f4,theta/pi)
xlabel 'Frequency (Hz)'
ylabel 'Phase / \pi'
title("cos(30*pi*t+(pi/4))")
