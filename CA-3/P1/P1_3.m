

mapset = MapSet();
inputImage = imread("image.jpeg");
inputImage = rgb2gray(inputImage);
encodedImage = coding ('signal;' , inputImage , mapset);


subplot(1,2,1);
imshow(inputImage);
title("Original Image")
subplot(1,2,2);
imshow(encodedImage);
title("Encrypted Image")
