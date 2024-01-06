function [LabeledPic , Ne]=mysegmentation(picture)
    arr = sum(picture);
    %find subarray that are not zero in them 
    subarrayStart = 0;
    subarrayEnd = 0;
    insideSubarray = false;
    subarrayIndices = [];
    for i = 1:length(arr)
        if arr(i) == 0
            if insideSubarray
                subarrayEnd = i - 1;
                subarrayIndices = [subarrayIndices; subarrayStart, subarrayEnd];
                insideSubarray = false;
            end
        else
            if ~insideSubarray
                subarrayStart = i;
                insideSubarray = true;
            end
        end
    end
    
    if insideSubarray
        subarrayEnd = length(arr);
        subarrayIndices = [subarrayIndices; subarrayStart, subarrayEnd];
    end
    % Display the starting and ending indices of subarrays without zeros
    Ne = size(subarrayIndices , 1);         
    LabeledPic=zeros(size(picture));
    
    for i=1 :Ne
        theStart = subarrayIndices(i , 1 );
        theEnd = subarrayIndices(i , 2);

        % Extract the submatrix from column a to column b
        %picture(: , theStart:theEnd)
        [row,column]=find(picture(: , theStart:theEnd)==1);


        ind=sub2ind(size(picture),row',(column+theStart-1)');
        LabeledPic(ind)=i;

    end
end