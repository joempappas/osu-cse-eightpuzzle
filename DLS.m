function [goalstate, hasFoundGoal, exploredStates] = DLS(start_state, hasFoundGoal, exploredStates, i )
%DLS returns the goal state along with a boolean that states whether or
%the goal has been found. This second return value is used in order to
%break out of the recursion loop. 
    goalstate = [];
    if ~hasFoundGoal && start_state.pathcost < i
        if start_state.isGoalState()
            goalstate = start_state;
            return
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

            stateUnexplored = hasBeenExplored(nextstate, exploredStates);
            if stateUnexplored && hasFoundGoal == 0
                exploredStates = [exploredStates, nextstate.layout];
                if nextstate.isGoalState()
                    goalstate = nextstate; 
                    hasFoundGoal = 1;
                    disp('Here') %used for debugging
                elseif nextstate.pathcost < i
                    [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates, i);
                end
            end
        end

        if start_state.canmoveup()
            nextstate = start_state.moveup();

            stateUnexplored = hasBeenExplored(nextstate, exploredStates);
            if stateUnexplored && hasFoundGoal == 0
                exploredStates = [exploredStates, nextstate.layout];
                if nextstate.isGoalState()
                    goalstate = nextstate; 
                    hasFoundGoal = 1;
                    disp('Here')
                elseif nextstate.pathcost < 31
                    [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates, i);
                end
            end
        end

        if start_state.canmoveright()
            nextstate = start_state.moveright();

            stateUnexplored = hasBeenExplored(nextstate, exploredStates);
            if stateUnexplored && hasFoundGoal == 0
                exploredStates = [exploredStates, nextstate.layout];
                if nextstate.isGoalState()
                    goalstate = nextstate; 
                    hasFoundGoal = 1;
                    disp('Here')
                elseif nextstate.pathcost < 31
                    [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates, i);
                end
            end
        end

        if start_state.canmoveleft()
            nextstate = start_state.moveleft();

            stateUnexplored = hasBeenExplored(nextstate, exploredStates);
            if stateUnexplored && hasFoundGoal == 0
                exploredStates = [exploredStates, nextstate.layout];
                if nextstate.isGoalState()
                    goalstate = nextstate; 
                    hasFoundGoal = 1;
                    disp('Here')
                elseif nextstate.pathcost < 31
                    [goalstate, hasFoundGoal, exploredStates] = DLS(nextstate, hasFoundGoal, exploredStates, i);
                end
            end
        end
        
        if hasFoundGoal
            return
        end
    end
end