clc;close all;clearvars;
% Question 1 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[file,path]=uigetfile({'*.jpg;*.bmp;*.png;*.tif;*.jpeg'},'Please Choose your PELAK ');
source = [path file];
% source = '/MATLAB Drive/untitled/image1.jpg';
picture=imread(source);
figure
subplot(1,2,1)
imshow(picture);




% Question 2 :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
picture=imresize(picture,[300 500]);
subplot(1,2,2)
imshow(picture);




% Question 3 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
picture=mygrayfun(picture);
figure
imshow(picture)




% Question 4 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%T = graythresh(I) computes a global threshold T from grayscale image I, using Otsu's method [1].
% Otsu's method chooses a threshold that minimizes the intraclass variance of the thresholded black and white pixels. 
% The global threshold T can be used with imbinarize to convert a grayscale image to a binary image.
th = graythresh(picture);


picture= mybinaryfun (picture , 127);
figure
imshow(picture)



% Question 5 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pixel_numbmer_for_noise = 500 ;
picture_without_noise = myremovecom(picture , pixel_numbmer_for_noise);
figure

subplot(1,2,1)
imshow(picture_without_noise)

pixel_number_for_frame = 5000 ;
frame = myremovecom(picture , pixel_number_for_frame);

subplot(1,2,2)
imshow(frame)

picture = picture_without_noise - frame ;
imshow(picture);


figure
imshow(picture)

% Question 6 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[L,Ne] = mysegmentation(picture);

% [LL,NNe]=bwlabel(picture);
% isequal(L , LL)
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off




% Question 7 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load PERSIANSET;
totalLetters=size(TRAIN,2);


figure
final_output=[];
t=[];
for n=1:Ne
    [r,c]=find(L==n);
    Y=picture(min(r):max(r),min(c):max(c));

    Y=imresize(Y,[60,50]);


    
    
    ro=zeros(1,totalLetters);
        for k=1:totalLetters   
            ro(k)=corr2(TRAIN{1,k},Y);
        end

    [MAXRO,pos]=max(ro);
    if MAXRO>.50
        out=cell2mat(TRAIN(2,pos));       
        final_output=[final_output , out];
    end
end

final_output

% Question 8 : 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
file = fopen('number_Plate.txt', 'wt');
fprintf(file,'Car tag is equal to :\n%s\n',final_output);
fclose(file);

















