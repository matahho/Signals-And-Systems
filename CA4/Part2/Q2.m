ts = 1e-9;  % Sampling time
T = 1e-5;   % Total time duration
tau = 1e-6; % Time constant
t=0:ts:T;
tlen=length(t);
sent=zeros(1,tlen);
sent(1:round(tau/ts))=1;


alpha = 0.5 ;
recieved = zeros(1,tlen);
speedOfLight = 3e8;
R = 450;
td = 2 * R / speedOfLight; 
recieved(round(td/ts) : round((td+tau)/ts)-1 ) = 1 * alpha;



% conv instruciton :
ro=conv(sent,recieved);

[MAXRO,positionOfMax]=max(ro);

finalTd=(positionOfMax - round(tau/ts) )*ts;
finalR=finalTd*speedOfLight/2 ;

timeFrame = size(ro);
plot((1:timeFrame(2)),ro);
xlabel("time");
ylabel("Convoulotion (using CONV)");

disp(["Final R usign CONV is : " , int2str(finalR)])



