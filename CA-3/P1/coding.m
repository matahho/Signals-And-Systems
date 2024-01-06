

function EncodedPic = coding(message , pic , mapset)
    
    % [a , b ] = size(pic);
    % if length(message) > a*b
    %      disp("Cant coded"); 
    
    message_binary=cell(1,length(message));
    
    for i = 1:length(message)
        current_char=message(i);
        index=strcmp(current_char,mapset(1,:));
        message_binary(i) = mapset(2,index);
    end
    
    
    binarymessage_encoded=cell2mat(message_binary);
    binarymessage_len=length(binarymessage_encoded);
    encoded_image =pic;
    
    for i = 1:binarymessage_len
        vals=pic(i);
        valsbin1=dec2bin(vals);
        valsbin1(end)=binarymessage_encoded(i);
        encoded_image (i)=bin2dec(valsbin1);
    end
    EncodedPic = encoded_image;
        
end
    
    
    
    
    
    
    

