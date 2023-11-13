

function [POINTS,newpoints]=close_points(point_ini,POINTS)

POINTS_NUM=size(POINTS,2);
diff= abs(repmat(point_ini,1,POINTS_NUM)-POINTS);
index=find(diff(1,:)<=1 & diff(2,:)<=1);
newpoints=POINTS(:,index);
POINTS(:,index)=[];
end

