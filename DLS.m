function [goalstate, hasFoundGoal, exploredStates] = DLS(start_state, hasFoundGoal, exploredStates )
%DLS returns the goal state along with a boolean that states whether or
%the goal has been found. This second return value is used in order to
%break out of the recursion loop. 
    %%import hasBeenExplored;
    goalstate = [];
    if start_state.isGoalState()
        goalstate = start_state;
    end
    
    disp(start_state.pathcost)
    
    
    %The following if loops check if the current state can make any of the
    %available moves and if it can then it adds the state to the list of
    %explored states. Then it tests if the next state is a goal state and
    %if it is then it updates the hasFoundGoal value, and returns. 
    
    %If the next state is not a goal state, then it recursively calls DLS 
    %on the next state.
    if start_state.canmovedown()
        nextstate = start_state.movedown();
        stateHasBeenExplored = hasBeenExplored(nextstate, exploredStates);
        %if ~stateHasBeenExplored
         %   exploredStates = [exploredStates, nextState.layout];
        stateUnexplored = hasBeenExplored(nextstate, exploredStates);
        if stateUnexplored
            exploredStates = [exploredStates, nextstate.layout];
            if nextstate.isGoalState()
                goalstate = nextstate; 
                hasFoundGoal = 1;
                disp('Here') %used for debugging
                return;
            elseif nextstate.pathcost < 31 && hasFoundGoal == 0
                [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates);
            end
        end
    end

    if start_state.canmoveup()
        nextstate = start_state.moveup();
        stateHasBeenExplored = hasBeenExplored(nextstate, exploredStates);
        %if ~stateHasBeenExplored
         %   exploredStates = [exploredStates, nextState.layout];

        stateUnexplored = hasBeenExplored(nextstate, exploredStates);
        if stateUnexplored
            exploredStates = [exploredStates, nextstate.layout];
            if nextstate.isGoalState()
                goalstate = nextstate; 
                hasFoundGoal = 1;
                disp('Here')
                return;
            elseif nextstate.pathcost < 31 && hasFoundGoal == 0
                [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates);
            end
        end
    end

    if start_state.canmoveright()
        nextstate = start_state.moveright();
        %stateHasBeenExplored = hasBeenExplored(nextstate, exploredStates);
        %if ~stateHasBeenExplored
        %    exploredStates = [exploredStates, nextState.layout];
        stateUnexplored = hasBeenExplored(nextstate, exploredStates);
        if stateUnexplored
            exploredStates = [exploredStates, nextstate.layout];
            if nextstate.isGoalState()
                goalstate = nextstate; 
                hasFoundGoal = 1;
                disp('Here')
                return;
            elseif nextstate.pathcost < 31 && hasFoundGoal == 0
                [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates);
            end
        end
    end

    if start_state.canmoveleft()
        nextstate = start_state.moveleft();
        %stateHasBeenExplored = hasBeenExplored(nextstate, exploredStates);
        %if ~stateHasBeenExplored
        %    exploredStates = [exploredStates, nextState.layout];
        stateUnexplored = hasBeenExplored(nextstate, exploredStates);
        if stateUnexplored
            exploredStates = [exploredStates, nextstate.layout];
            if nextstate.isGoalState()
                goalstate = nextstate; 
                hasFoundGoal = 1;
                disp('Here')
                return;
            elseif nextstate.pathcost < 31 && hasFoundGoal == 0
                [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates);
            end
        end
    end
end