function Mapset=MapSet()
    Mapset=cell(2,32);
    alphabet = 'abcdefghijklmnopqrstuvwxyz .,!";';
    for i = 1:32
        Mapset{1,i} = alphabet(i);
        Mapset{2,i} = dec2bin(i-1, 5); 
    end
    
end