function [goalstate] = aStar(state)
%ASTAR This is the implementation of the aStar search

%set goal state to an empty array
    goalstate = [];
    frontierNodes = [state];
    numElements = 1;
    hasFoundGoal = 0;
    %if at goal state, don't enter loop and return goal state
    if state.isGoalState()
        goalstate = state;
        hasFoundGoal = true;
    end
    
    %continue loop until goal has been found
    while hasFoundGoal == 0
        i = 1;
        heuristicPos = 1;
        %If there is only one element lowest heuristic must be that one
        %element
        if numElements == 1
            lowHeuristic = frontierNodes.heuristic;
        %if there is more than one element set lowest heuristic to first
        %child
        else
            lowHeuristic = frontierNodes(1).heuristic;
        end
        %Check to see if there is a lower heuristic to continue with and
        %find its position
        while i < numElements
            if frontierNodes(i).heuristic < lowHeuristic
                lowHeuristc = frontierNodes(i).heuristic;
                heuristicPos = i;
            end
            i = i + 1;
        end
        %copy the state at which the heuristic is lowest and set to state
        state = frontierNodes(heuristicPos).copyState();
        %remove the state from the frontier nodes and decrement numElements
        %by one
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
        
        %If state is the goal mark goal found and set to goalstate
        if state.isGoalState()
            goalstate = state;
            hasFoundGoal= true;
        %if goal state is not found, do all possible moves, add to the
        %frontier and increment numElements for each added state
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

