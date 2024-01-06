t = 0 : 0.01 : 1;
z1 = sin( 2 * pi * t );
z2 = cos( 2 * pi * t );


figure;
plot (t , z1 , '--b')
hold on;
plot (t , z2 , 'r')

x0 = [0.5 ; 0.25];
y0 = [0.2 ; -0.8];


s = ['sin(2 \pi t)' ;'cos(2 \pi t)']; 
text(x0 , y0 , s); %add a comment at (x0 , y0)


title('Sin and Cos'); % Title
legend('sin' , 'cos') % add legends


xlabel('time') % the name of X-axis
ylabel('amplitude') % the name of Y-axis 

grid on % add grid

