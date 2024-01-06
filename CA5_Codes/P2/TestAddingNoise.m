

r1 = coding_freq("signal" , 1);
r5 = coding_freq("signal" , 5);


sigma = 3;


r1n = AddNoise(r1 , sigma);
r5n = AddNoise(r5 , sigma);


decoding_freq(r1n , 1);
decoding_freq(r5n , 5);
