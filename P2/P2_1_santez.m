
testNumber='1234567890*#ABCD1234567890**##ABCD';

fs=8000;
Ts=1/fs;
Ton=0.1;
Toff=0.1;
t=0:Ts:Ton;


fLow=[697 ,770 ,852 ,941];
fUp=[1209 ,1336 ,1477 ,1633];

silence=zeros(1,size(t,2)-1);


out=[];
for n=1:length(testNumber)
    
    switch testNumber(n)
        case 'A'
            row=1;
            column=4;
        case 'B'
            row=2;
            column=4;
        case 'C'
            row=3;
            column=4;
        case 'D'
            row=4;
            column=4;
        case '*'
            row=4;
            column=1;
        case '0'
            row=4;
            column=2;
        case '#'
            row=4;
            column=3;
        
        otherwise
            num=str2num(testNumber(n));
            row=ceil((num)/3);
            column=rem(num,3);
            
            if column==0
                column=3;
            end
    end
    disp([row , column]);
    y1=sin(2*pi*fLow(row)*t);
    y2=sin(2*pi*fUp(column)*t);
    y=(y1+y2)/2;
    on=Ton*fs;
    out=[out y(1:on) silence];
end

%sound(out,fs)
audiowrite('./y.wav',out,fs)