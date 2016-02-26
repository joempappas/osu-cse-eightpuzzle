function [exploredLayouts, finalObjects] = createTests(obj, exploredLayouts, pathCost, finalObjects)
%CREATETESTS This function returns all objects with pathcost equal to the
%given pathcost as well as all of the layouts that have been explored which
%is used to ensure that layout is not used again
isNotMember = true;
%generate random integer between 1 and 4
randNum = (4.49-0.5)*rand(1)+0.5;
randNum = round(randNum);

%continue if pathcost is less than given pathcost
if (obj.pathcost < pathCost)
    
    %if blank can move left, move left
    %Make sure last move was not right so move is backtracked
    %Limit recursion with random number, if random num is not 1, continue
    if (obj.canmoveleft && (strcmp(obj.lastMove,'right') == 0) && randNum ~= 1)
        obj2 = obj.moveleft;
        %make sure new object has not been explored before
        isNotMember = hasBeenExplored(obj2, exploredLayouts);
        if(isNotMember)
            exploredLayouts = [exploredLayouts, obj2.layout];
            %add object to final objects array if its path cost is less
            %than supplied pathcost
            if (isequal(obj2.pathcost,pathCost))
                finalObjects = [finalObjects, obj2];
            end
            
            %if the object has not been explored, call function again with
            %new object
            [exploredLayouts, finalObjects] = createTests(obj2, exploredLayouts, pathCost, finalObjects);
        end
    end
   
    %if blank can move down, move downward
    %Make sure last move was not right so move is backtracked
    %Limit recursion with random number, if random num is not 2, continue
    if (obj.canmovedown && (strcmp(obj.lastMove, 'up')==0) && randNum ~= 2)
        obj2 = obj.movedown;
        %make sure new object has not been explored before
        isNotMember = hasBeenExplored(obj2, exploredLayouts);
        if(isNotMember)
            %add object to final objects array if its path cost is less
            %than supplied pathcost            
            exploredLayouts = [exploredLayouts, obj2.layout];
            if (isequal(obj2.pathcost,pathCost))
                finalObjects = [finalObjects, obj2];
            end
            %if the object has not been explored, call function again with
            %new object
            [exploredLayouts, finalObjects] = createTests(obj2, exploredLayouts, pathCost, finalObjects);
        end

    end
    
    %if blank can move right, move right
    %Make sure last move was not right so move is backtracked
    %Limit recursion with random number, if random num is not 3, continue
    if (obj.canmoveright && (strcmp(obj.lastMove, 'left')==0) && randNum ~= 3)
        obj2 = obj.moveright;
        %make sure new object has not been explored before
        isNotMember = hasBeenExplored(obj2, exploredLayouts);
        if(isNotMember)
            %add object to final objects array if its path cost is less
            %than supplied pathcost            
            exploredLayouts = [exploredLayouts, obj2.layout];
            if (isequal(obj2.pathcost,pathCost))
                finalObjects = [finalObjects, obj2];
            end
            %if the object has not been explored, call function again with
            %new object
            [exploredLayouts, finalObjects] = createTests(obj2, exploredLayouts, pathCost, finalObjects);
        end

    end  
    
    %if blank can move up, move upward
    %Make sure last move was not right so move is backtracked
    %Limit recursion with random number, if random num is not 4, continue
    if (obj.canmoveup && (strcmp(obj.lastMove, 'down') == 0) && randNum ~=4)
        obj2 = obj.moveup;
        %make sure new object has not been explored before
        isNotMember = hasBeenExplored(obj2, exploredLayouts);
        if(isNotMember)
            %add object to final objects array if its path cost is less
            %than supplied pathcost            
            exploredLayouts = [exploredLayouts, obj2.layout];
            if (isequal(obj2.pathcost,pathCost))
                finalObjects = [finalObjects, obj2];
            end
            
            %if the object has not been explored, call function again with
            %new object
            [exploredLayouts, finalObjects] = createTests(obj2, exploredLayouts, pathCost, finalObjects);
        end
    end

exploredLayouts = exploredLayouts;
finalObjects = finalObjects;
end

