function [goalstate] = aStar(state)
%ASTAR Summary of this function goes here
%   Detailed explanation goes here
    goalstate = [];
    frontierNodes = [];
    frontierNodes = [state];
    numElements = 1;
    hasFoundGoal = 0;
    if state.isGoalState()
        goalstate = state;
        hasFoundGoal = true;
    end
    
    while hasFoundGoal == 0
        i = 1;
        heuristicPos = 1;
        if numElements == 1
            lowHeuristic = frontierNodes.heuristic;
        else
            lowHeuristic = frontierNodes(1).heuristic;
        end
        while i < numElements
            if frontierNodes(i).heuristic < lowHeuristic
                lowHeuristc = frontierNodes(i).heuristic;
                heuristicPos = i;
            end
            i = i + 1;
        end
        state = frontierNodes(heuristicPos).copyState();
        if numElements == 1
            frontierNodes = [];
            numElements = numElements -1;
        elseif heuristicPos == 1
            if heuristicPos+1 == numElements
                frontierNodes = frontierNodes(numElements);
            else
                frontierNodes = frontierNodes([heuristicPos+1:numElements]);
            end
            numElements = numElements -1;
        elseif heuristicPos == numElements
            if heuristicPos-1 == 1
                frontierNodes = frontierNodes(1);
            else
                frontierNodes = frontierNodes([1:heuristicPos-1]);
            end
            numElements = numElements -1;
        else
            if (heuristicPos - 1 == 1) && (heuristicPos + 1 == numElements)
                frontierNodes = frontierNodes([1, numElements]);
            elseif heuristicPos - 1 == 1
                frontierNodes = frontierNodes([1, heuristicPos+1:numElements]);
            elseif heuristicPos + 1 == numElements
                frontierNodes = frontierNodes([1:heuristicPos-1, numElements]);
            else
                frontierNodes = frontierNodes([1:heuristicPos-1, heuristicPos+1:numElements]);
            end
            numElements = numElements -1;
        end        
        if state.isGoalState()
            goalstate = state;
            hasFoundGoal= true;
        else
            if state.canmovedown()
                childState = state.movedown();
                frontierNodes = [frontierNodes, childState];
                numElements = numElements + 1;
            end
            if state.canmoveup()
                childState = state.moveup();
                frontierNodes = [frontierNodes, childState];
                numElements = numElements + 1;
            end
            if state.canmoveright()
                childState = state.moveright();
                frontierNodes = [frontierNodes, childState];
                numElements = numElements + 1;
            end
            if state.canmoveleft()
                childState = state.moveleft();
                frontierNodes = [frontierNodes, childState];
                numElements = numElements + 1;
            end
        end
    end
end

