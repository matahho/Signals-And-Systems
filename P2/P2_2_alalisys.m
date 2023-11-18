
[a,Fs]=audioread("y.wav");
data=cell(2,16);
fLow=[697 ,770 ,852 ,941];
fUp=[1209 ,1336 ,1477 ,1633];
fs=8000;
Ts=1/fs;

Ton=0.1;
t=0:Ts:Ton;

Toff=0.1;
on=Ton*fs;

s=size(a);
dataLabel=['1','2','3','A','4','5','6','B','7','8','9','C','*','0','#','D'];

output=[];


for n=1:length(dataLabel)
    num=n;
    row=ceil(num/4);
    column=rem(num,4);
    if column==0
        column=4;
    end

    disp([row, column]);
    y1=sin(2*pi*fLow(row)*t);
    y2=sin(2*pi*fUp(column)*t);
    
    y=(y1+y2)/2;
    
    data(1,n)={dataLabel(n)};
    data(2,n)={y(1:on)};
end

for n=0:(s(1)/(0.2*Fs))-1
    samples=[(2*n*Fs*0.1)+1,(2*n*Fs*0.1)+on];
    
    [b,Fs]=audioread("y.wav",samples);
    ro=zeros(1,16);
    
    for i=1:16
        ro(i)=corr2(data{2,i},transpose(b));
    end
    [MAXRO,pos]=max(ro);
    na=cell2mat(data(1,pos)); 
    
    output=[output na];
end
disp(output);

