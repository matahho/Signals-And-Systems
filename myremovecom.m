function [newPIC , OBJECT_NEW]=myremovecom(picture,n)
[row,column]=find(picture==1);
POINTS=[row';column'];
current_obj_num=1;
POINTS_NUM=size(POINTS,2);

while POINTS_NUM>0
    
   point_ini=POINTS(:,1);  
   POINTS(:,1)=[];
   [POINTS,newpoints]=close_points(point_ini,POINTS);
   current_obj=[point_ini newpoints];
   newpoints_len=size(newpoints,2);
   
   while newpoints_len>0
       newpoints2=[];
   for i=1:newpoints_len
       [POINTS,newpoints1]=close_points(newpoints(:,i),POINTS);
        newpoints2=[newpoints2 newpoints1];
   end
       current_obj=[current_obj newpoints2];
       newpoints=newpoints2;
       newpoints_len=size(newpoints,2);
   end
   
   OBJECT{current_obj_num}=current_obj;
   current_obj_num=current_obj_num+1;
   POINTS_NUM=size(POINTS,2);
end
% OBJECT_NEW
z=1;
current_obj_num=current_obj_num-1;
for i=1:current_obj_num
    if size(OBJECT{i},2)>n 
        OBJECT_NEW{z}=OBJECT{i};
        z=z+1;
    end
end

newPIC=zeros(size(picture));
for i=1:size(OBJECT_NEW , 2 )
    ind=sub2ind(size(picture),OBJECT_NEW{i}(1,:),OBJECT_NEW{i}(2,:));
    newPIC(ind)=1;
end

imshow(logical(newPIC))






        

