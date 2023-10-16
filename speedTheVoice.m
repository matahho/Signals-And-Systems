
function speedTheVoice(inputFile, speed)  
    
    if speed ~= 0.5 && speed ~= 2
        error('speed input is invalid .');
    
    end
    
    [x, Fs] = audioread(inputFile);
    
    if speed == 2
        x = x (1 : 2 : end);

    end


    if speed == 0.5 
    
        newX = zeros(2*length(x)-1, size(x, 2));
        newX(1:2:end ) = x; 
        newX(2:2:end-1) = (x(1:end-1) + x(2:end)) / 2;
        
        x=newX;
    
    end
 
    audiowrite("newVoice.wav" , x , Fs);

end
