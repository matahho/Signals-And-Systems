
alpha = 2.6;
beta = 7.1;

% x values
testx = 1 : 0.1 :5 ;


% noise and scale it between 0 to 1 
noise = randn (1 , length(testx));

min_noise = min(noise);
max_noise = max(noise);

scaled_noise = (noise - min_noise) / (max_noise - min_noise);

% y values with noise and linear fucntion 
testy = alpha*testx + beta + scaled_noise;

plot (testx , testy);
fprintf ("real Alpha is %f and real Beta is %f" , alpha , beta);
ans = p2_4(testx , testy);
