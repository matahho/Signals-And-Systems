

function message=decoding(image , mapset)
    
    

    message_bin = '';
    for i = 1:size(image,1)
        pixel = image(i);
        pixel_bin = dec2bin(pixel);
        message_bin = [message_bin pixel_bin(end)]; 
    end
    
    message_decoded = '';
    while length(message_bin) > 4
        char_bin = message_bin(1:5);
        message_bin = message_bin(6:end);
        
        index = find(strcmp(char_bin, mapset(2,:)));
        char = mapset{1,index};
        
        if char == ';'
            break;
        end
        message_decoded = [message_decoded char];
    end
     
    disp(message_decoded)
    
end