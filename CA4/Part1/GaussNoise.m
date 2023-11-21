noise = randn(1 , 3000);


disp(["Mean for the Gaussian Noise is : " , mean(noise) ]);
disp(["Var for the Gaussian Noise is : " , var(noise) ]);
histogram(noise)