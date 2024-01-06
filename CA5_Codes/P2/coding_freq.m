function encoded_message=coding_freq(message,bit_rate)
    Mapset=MapSet();
    binaryMessage=[];
    n=(strlength(message)*5)/bit_rate;

    fs=100;
    for i=1:strlength(message)
        for j=1:32
            if strcmp(extract(message,i),Mapset(1,j))==1
                binaryMessage=[binaryMessage  Mapset(2,j)];
            end
        end
    end


    binaryMessage=cell2mat(binaryMessage);




    stringLength = length(binaryMessage);
    loopCounter = 1;
    for k = 1 : bit_rate : stringLength
        index1 = k;
        index2 = min(k + bit_rate - 1, stringLength);
        out{loopCounter} = binaryMessage(index1 : index2);
        loopCounter = loopCounter + 1;
    end

    binaryMessage = out ;




    x = cell(1, 2^bit_rate);
    for i=0:2^bit_rate-1
        x{i+1} = dec2bin(i,bit_rate);
    end
    y=zeros(1,2^bit_rate);
    w=fix(50/(2^bit_rate)+1);
    z=fix(w/2);
    for i=1:2^bit_rate
        y(1,i)=z;
        z=z+w;
        
    end
    t1=zeros(n,100); 
    for i=1:n
        t1(i,:)=linspace(i-1,i,fs); 
    end 
    ts=1/fs;
    t=0:ts:1-ts; 
    f=[];
    for i=1:n
        for j=1:2^bit_rate
            if strcmp(binaryMessage(1,i),x(1,j))==1
                f=[f y(1,j)];
            end
        end
    end
    encoded_message=zeros(n,100);
    for i=1:n
        encoded_message(i,:)=sin(2*pi*f(1,i)*t);
    
    end

    figure()
    colors = {'r', 'g', 'b', 'c', 'm', 'y', 'k'};
    for k=1:n
        colorID = mod(k , 7) + 1 ;
        plot(t1(k,:),encoded_message(k,:) ,'Color', colors{colorID}); 
        title('BitRate is :',bit_rate)
        hold on 
    end
end
