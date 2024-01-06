function decoded_message=decoding_amp(encoded_message,bit_rate)

    Mapset=MapSet();
    
    
    
    correlation=[];
    num=size(encoded_message);
    fs=100;
    t=zeros(num(1),100);
    for i=1:num(1)
        t(i,:)=linspace(i-1,i,fs);
    end
    % Calculating correlation 
    for k=1:num(1)
        corr_2d=0.01*sum((2*sin(2*pi*t(k,:))).*(encoded_message(k,:)));
        correlation=[correlation corr_2d];
        correlation=double(correlation);
    end
    y=zeros(1,2^bit_rate);
    for i=1:2^bit_rate
        y(1,i)=(i-1)/(2^bit_rate-1);
    end
    
    y_m=zeros(1,2^bit_rate-1);
    for l=1:2^bit_rate-1
        y_m(1,l)=(y(1,l+1)-y(1,l))/2+y(1,l);
    end
    
    x = cell(1, 2^bit_rate);
    for i=0:2^bit_rate-1
        x{i+1} = dec2bin(i,bit_rate);
    end
    w=[];
    % Decision Making
    for i=1:num(1)
        for h=1:2^bit_rate-1
            if abs(correlation(1,i))>y_m(1,h) && abs(correlation(1,i))<= y(1,h+1)
                w=[w x(1,h+1)];
            end
            if abs(correlation(1,i))< y_m(1,h) && abs(correlation(1,i))>= y(1,h)
                w=[w x(1,h)];
            end
            if abs(correlation(1,i))>1
                w=[w x(1,2^bit_rate)];
            end
               
        end
    end
    w=cell2mat(w);


    stringLength = length(w);
    loopCounter = 1;
    for k = 1 : 5 : stringLength
        index1 = k;
        index2 = min(k + 5 - 1, stringLength);
        out{loopCounter} = w(index1 : index2);
        loopCounter = loopCounter + 1;
    end
    w = out ;


    decoded_message=[];
    Mapset_length=size(Mapset);
    message_length=num(1)*bit_rate/5;
    for m=1:message_length
        for n=1:Mapset_length(1,2)
            if strcmp(w(1,m),Mapset(2,n))==1
                decoded_message=[decoded_message  Mapset(1,n)];
            end
        end
    end
    decoded_message=strjoin(decoded_message,'');
    disp(decoded_message)
end
