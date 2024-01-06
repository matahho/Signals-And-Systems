
tstart=0;

fs=8000;
ts=1/fs;
tend=0.5;
tau=0.025;

t=tstart:ts:tend-ts;
t2=tstart:ts:tau-ts;


silence=zeros(size(t2));



characters=["B" , "A#" , "A" , "G#" , "G" , "F#" , "F" , "E" , "D#" , "D" , "C#" , "C"];
characters_freq=[987.77 , 932.33 , 880 ,830.61 ,783.99,739.99,698.46 , 659.25 , 622.25 , 587.33 , 554.37 , 523.25]


given_song={'D','D','G','F#','D','D','E','E','D','F#','D','E','D','E','F#','E','D','E','E','D','F#','D','E','D','E','D','F#','E','D','E','D','F#','E','D','D','E','F#','E','F#','F#','E','F#','F#','D'
            ;0.5,0.5,1,1,1,0.5,0.5,0.5,0.5,0.5,0.5,1,1,1,1,1,0.5,0.5,0.5,0.5,0.5,0.5,1,1,0.5,0.5,1,1,1,0.5,0.5,1,1,0.5,0.5,1,0.5,0.5,1,0.5,0.5,1,1,1};
song=[];
for i=1:length(given_song)

    [,num]=find(characters==given_song{1,i});
    y=sin(2*pi*characters_freq(num)*t);


    dur=given_song{2,i}*size(t,2);
    song=[song y(1:dur) silence];

end
%sound(song)
audiowrite('given_song.wav',song,fs)
