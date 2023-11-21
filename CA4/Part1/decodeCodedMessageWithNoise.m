

r1 = coding_amp("signal" , 1);
r2 = coding_amp("signal" , 2);
r3 = coding_amp("signal" , 3);

sigma = 2;

r1n = addingNoise(r1 , sigma);
r2n = addingNoise(r2 , sigma);
r3n = addingNoise(r3 , sigma);

decoding_amp(r1n , 1);
decoding_amp(r2n , 2);
decoding_amp(r3n , 3);
