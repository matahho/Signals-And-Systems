function decodedMessage=decoding_freq(encodedMessage,bit_rate)

    x = cell(1,(2^bit_rate)); 

    for i=0:2^bit_rate-1 
        x{i+1} = dec2bin(i,bit_rate); 
    end 

    Mapset=MapSet();
    num=size(encodedMessage);
    fs=100;
    y=zeros(1,2^bit_rate);
    w=fix(50/(2^bit_rate)+1);
    z=fix(w/2);

    for i=1:2^bit_rate
        y(1,i)=z;
        z=z+w;  
    end  


    freq=-fs/2:1:fs/2-1; 
    I=[];


    for k=1:num(1)
        emF=abs(fftshift(fft(encodedMessage(k,:)))); 
        [~,loc]=max(emF); 
        fhat=abs(freq(loc));
        I=[I fhat];
    end


    y_m=zeros(1,2^bit_rate);
    for l=1:2^bit_rate-1
        y_m(1,l+1)=(y(1,l+1)-y(1,l))/2+y(1,l);
    end
    w=[];



    for i=1:num(1)
        for h=1:2^bit_rate-1
            if (I(1,i)>= y_m(1,h) && I(1,i)< y_m(1,h+1))|| I(1,i)==y_m(1,h)
                w=[w x(1,h)];
            end
        end
        if I(1,i)>y_m(1,2^bit_rate)
            w=[w x(1,2^bit_rate)];
        end
    end



    w=cell2mat(w);


    eachCharacterRepresentedBy5Bit = 5;

    stringLength = length(w);
    loopCounter = 1;
    for k = 1 : eachCharacterRepresentedBy5Bit : stringLength
        index1 = k;
        index2 = min(k + eachCharacterRepresentedBy5Bit - 1, stringLength);
        out{loopCounter} = w(index1 : index2);
        loopCounter = loopCounter + 1;
    end

    w = out ;


    
    decodedMessage=[];
    Mapset_length=size(Mapset);



    for m=1:num(1)*bit_rate/5
        for n=1:Mapset_length(1,2)
            if strcmp(w(1,m),Mapset(2,n))==1
                decodedMessage=[decodedMessage  Mapset(1,n)];
            end
        end
    end

    decodedMessage=strjoin(decodedMessage,'');

    disp(decodedMessage)
end
