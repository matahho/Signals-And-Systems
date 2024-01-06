ts = 1e-9;  % Sampling time
T = 1e-5;   % Total time duration
tau = 1e-6; % Time constant
t=0:ts:T;
tlen=length(t);
sent=zeros(1,tlen);
sent(1:round(tau/ts))=1;


plot(t,sent);
xlabel("time");
ylabel("Signal Amp");
hold on;


alpha = 0.5 ;
recieved = zeros(1,tlen);
speedOfLight = 3e8;
R = 450;
td = 2 * R / speedOfLight; 
recieved(round(td/ts) : round((td+tau)/ts)-1 ) = 1 * alpha;


plot(t , recieved);
legend("Send signal" , "Recieved Signal");
hold on;
