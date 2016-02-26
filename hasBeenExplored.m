function isMember = hasBeenExplored(object, array)
%HASBEENEXPLORED This function determines if an object has been explored
%before or not by checking each 3x3 matrix in the given array
    isMember = true;
    [row,col] = size(array);
    numMatrices = col/3;
    i = 1;
    colToCheck = 1;
    while (i <= numMatrices && isMember)
        %check each 3x3 matrix, if row of both is the same 1 is returned, so
        %the sum cannot be equal to 3 because that means the matrix exists
        if (sum(ismember(object.layout, array(:, colToCheck:colToCheck+2),'rows')) ~=3)
            isMember = true;
            i = i + 1;
            %increment column by three to be start column for next check
            colToCheck = colToCheck + 3;
        else
            isMember = false;
        end
    end

end

