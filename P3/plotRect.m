
function result=plotRect(PCB,IC,M_cell)

    [IC_row,IC_col , dim]=size(IC);
    threshold=0.94;
    figure,imshow(PCB);
    hold on 
    for l=1:length(M_cell)
        M_1=cell2mat(M_cell(1,l));
        M=find(M_1>threshold);
        [rows, columns]=ind2sub(size(M_1),M);
        for k=1:length(rows)
            disp([columns(k) rows(k) IC_col IC_row ])
            rectangle('Position',[columns(k) rows(k) IC_col IC_row],'EdgeColor','b');
        end
    end
    F=getframe(gcf);
    result=frame2im(F);
end