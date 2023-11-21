function EncodedMessage=coding_amp(message,rate)


    Mapset = MapSet();
    binaryMessage=[];
    
    lengthOfMessage=strlength(message);
    
    n=(strlength(message)*5)/rate;
    % Ba tavajoh be Farz soal Fs = 100 Hz 
    fs=100;
    
    for i=1:lengthOfMessage
        for j=1:32
            if strcmp(extract(message,i),Mapset(1,j))==1
                binaryMessage=[binaryMessage  Mapset(2,j)];
            end
        end
    end
    
    
    binaryMessage=cell2mat(binaryMessage);
    
    
    
    
    stringLength = length(binaryMessage);
    loopCounter = 1;
    for k = 1 : rate : stringLength
        index1 = k;
        index2 = min(k + rate - 1, stringLength);
        out{loopCounter} = binaryMessage(index1 : index2);
        loopCounter = loopCounter + 1;
    end
    
    binaryMessage = out ;
    
    
    x = cell(1, 2^rate);
    
    for i=0:2^rate-1
        x{i+1} = dec2bin(i,rate);
    end

    y=zeros(1,2^rate);
    for i=1:2^rate
        y(1,i)=(i-1)/(2^rate-1);
    end


    
    t=zeros(n,100);
    for i=1:n
        t(i,:)=linspace(i-1,i,fs);
    end
    encoded_message_coef=[];
    for i=1:n
        for j=1:2^rate
            if strcmp(binaryMessage(1,i),x(1,j))==1
                encoded_message_coef=[encoded_message_coef y(1,j)];
            end
        end
    end



    EncodedMessage=zeros(n,100);
    for i=1:n
            EncodedMessage(i,:)=encoded_message_coef(1,i).*sin(2*pi*t(i,:)); 
    end
    
    
    for k=1:n
        title(["Bit-Rate = " , int2str(rate) ]);
        plot(t(k,:),EncodedMessage(k,:),'b');
        hold on 
    end
end