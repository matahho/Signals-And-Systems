function [output] = decodeMusic(music_address)


    tstart=0;
    fs=8000;
    ts=1/fs;
    tend=0.5;
    tau=0.025;
    t=tstart:ts:tend-ts;
    t2=tstart:ts:tau-ts;
    silence=zeros(size(t2));


    [amp,Fs]=audioread(music_address);



    characters=["B" , "A#" , "A" , "G#" , "G" , "F#" , "F" , "E" , "D#" , "D" , "C#" , "C"];
    characters_freq=[987.77 , 932.33 , 880 ,830.61 ,783.99,739.99,698.46 , 659.25 , 622.25 , 587.33 , 554.37 , 523.25]




    notes={};
    en=length(amp);
    n=1;
    while en~=0
        for i=2:en
            if amp(i)==0 && amp(i+1)==0 
                break        
            end
        end
        y=amp(1:i-1);
        notes(n)={y};
        n=n+1;
        amp=amp(i+200:en);
        en=length(amp);

    end

    for i=1:length(notes)
    
        y=cell2mat(notes(i));
        N=length(y);
        m=abs(fftshift(fft(y)));
        [row,col]=find(m==max(m));
        frq=(row(2)-N/2-1)*fs/N;
        for n=1:length(characters_freq)
            trsh=2;
            if abs(characters_freq(n)-frq)<trsh
                output(1,i)=characters(n);
                output(2,i)=N/4000;
            end
        end
    end
    
end