function message_with_noise=addingNoise(coded , sigma)
    num=size(coded);
    fs=100;
    encoded_message_size=size(coded);
    
    noise=sigma*randn(encoded_message_size(1),encoded_message_size(2));
    
    message_with_noise=coded+noise;
    t=zeros(num(1),fs);
    figure()

    for i=1:num(1)
        t(i,:)=linspace(i-1,i,fs);
    end
    
    for k=1:num(1)
        plot(t(k,:),message_with_noise(k,:),'b');
        hold on 
    end
end

