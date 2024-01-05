function newX = p4_4(inputFile, speed)  
    
    if speed < 0.5 || speed > 2 
        error('speed input is invalid .');
    end
    

    

    [x, Fs] = audioread(inputFile);
        
    %correct speed to a float number that has only one digit after
    %floationg point 
    speed = round( speed , 1 );
     
    newX = x( round ( linspace (1 , size(x , 1 ) , size(x , 1)/speed) ) ) ;
        

    audiowrite("newVoice.wav", newX , Fs);
    
    fprintf("Done");
end
