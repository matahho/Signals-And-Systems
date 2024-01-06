

function [grayPic] = mygrayfun(pic)
% This function make the pic to gray and white :

% Gray channel is : 0.299 * RedChannel + 0.578 * GreenChannel + 0.114 * BlueChannel

    grayPic = 0.299 * pic(:,:,1) + 0.578 * pic(:,:,2) + 0.114 * pic(:,:,3);

end