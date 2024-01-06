function [finalR] = convolute(sent,recieved)
    ts = 1e-9;  % Sampling time
    tau = 1e-6; % Time constant
    speedOfLight = 3e8;

    ro=conv(sent,recieved);
    
    [MAXRO,positionOfMax]=max(ro);
    
    finalTd=(positionOfMax - round(tau/ts) )*ts;
    finalR=finalTd*speedOfLight/2 ;

end