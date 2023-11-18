

mapset = MapSet();
inputImage = imread("image.jpeg");
inputImage = rgb2gray(inputImage);
encodedImage = coding ('signal;' , inputImage , mapset);


decoding(encodedImage , mapset);