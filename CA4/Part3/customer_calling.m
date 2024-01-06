function customer_calling(number,budget)
    if (budget < 1) || (budget > 9)
        disp("The budget is NOT valid :(");
        return;
    end
    if (number < 1) || (number > 99)
        disp("Your Input number is NOT valid :(");
        return;
    end
    
    directory = dir('VoiceDataSet');

    files = {directory.name};
    % Dar inja . and .. ro hazf mikonim
    files = files(3:end);
    
    voices = containers.Map;
    
    for i = 1:length(files)
        addrr = fullfile('VoiceDataSet', files{i}) ;
        [audioData, sampleRate] = audioread(addrr);
    
         % bedoone .wav suffix
        voices(files{i}(1:end-4)) = audioData;
    end

    if (number < 21) 
        concatenatedVoice = [voices('Shomareye'); voices(int2str(number)); voices('BeBadgeye'); voices(int2str(budget))];
    end
    if (mod(number, 10) == 0)
        concatenatedVoice = [voices('Shomareye'); voices(int2str(number)); voices('BeBadgeye'); voices(int2str(budget))];
    end
    if ~((number < 21) || (mod(number, 10) == 0)) 
        concatenatedVoice = [voices('Shomareye'); voices(int2str(number - mod(number, 10))); voices('va'); voices(int2str(mod(number, 10)));voices('BeBadgeye'); voices(int2str(budget))];
    end

    sound(concatenatedVoice , sampleRate);
    %audiowrite("./output.wav" , concatenatedVoice , sampleRate);  
 end