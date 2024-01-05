


function [bpic] = mybinaryfun(grayPic,th)
% This function make the gray pic to white and black using threshhold
    bpic = grayPic > th;
    bpic = ~bpic ;
    
end