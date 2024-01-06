function ICrecognition(ICpath , PCBpath)
    IC = imread(ICpath);
    PCB = imread(PCBpath);
    grayIC = rgb2gray(IC);
    grayPCB = rgb2gray(PCB);
    rotatedGrayIC = imrotate(grayIC , 180);
    out = twoImageCorrolation(grayPCB , grayIC);
    outRotated = twoImageCorrolation(grayPCB , rotatedGrayIC);
    plotRect(PCB , IC , {out , outRotated});
       
end