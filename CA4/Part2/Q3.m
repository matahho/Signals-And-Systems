ts = 1e-9;  % Sampling time
T = 1e-5;   % Total time duration
tau = 1e-6; % Time constant
t=0:ts:T;
tlen=length(t);
sent=zeros(1,tlen);
sent(1:round(tau/ts))=1;


plot(t,sent);
xlabel("power of noise");
ylabel("error of distance emstimation ");
hold on;


alpha = 0.5 ;
recieved = zeros(1,tlen);
speedOfLight = 3e8;
R = 450;
td = 2 * R / speedOfLight; 
recieved(round(td/ts) : round((td+tau)/ts)-1 ) = 1 * alpha;

powers = 0 : 0.05 : 1 ;
errorsOfPowers = [];

for power= 0 : 0.05 : 1
    allErrorsOfThisPower = [];
    for iteration=1:10
        
        noise = power*randn(1 , tlen);
        recieved = recieved + noise;
        
        
        
        distance = convolute(sent , recieved);  
        
        realDistance = 450;
    
        allErrorsOfThisPower = [allErrorsOfThisPower , abs(realDistance - distance) ];
        
            
    end
    
    errorsOfPowers = [errorsOfPowers , mean(allErrorsOfThisPower)];
end

plot(powers, errorsOfPowers);

% Add a vertical line at x = 10
yline(10, '--', 'LineWidth', 2 , 'Color', 'r');

hold off;

