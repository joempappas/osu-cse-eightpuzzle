function [goalstate, foundGoal, numOfIterations] = IDS( start_state, depth, numOfIterations )
%IDS searches the 8 puzzle for a solution. The goal state is returned with
%updated properties that give the pathcost to get there, parent state, and
%the last move that got there. These properties can then be used with the
%traceGoaltoInit function to go through the path that it takes to get to
%the goal

    import CStack
    import hasBeenExplored;
    goalstate = [];
    if start_state.isGoalState()
        goalstate = start_state;
    end
    exploredStates = [];
    stack = CStack();
    stack.push(start_state);
    exploredStates = [exploredStates, start_state.layout];
    foundGoal = 0;
    
    %IDS will run until the stack is empty (i.e. all states within the given depth
    %have been explored) or until a goal state is found. If If the loop
    %runs with no available moves, then that state is popped off the top of
    %the stack and the next state is explored to find an available move.
    while ~stack.isempty()
        numOfIterations = numOfIterations + 1;
        
        %state being explored
        state = stack.top();
        
        %used in order to see where the algorithm is at while running
        disp(state.pathcost);
        
        %The following if loops check if the blank space can move a certain
        %way and if it can then it checks if the next state is the goal
        %state, and if it is not then it pushes the move to the top of the
        %stack and this iteration is stopped and the algorithm is
        %continued
        
        if state.canmovedown() && ~strcmp(state.lastMove,'up')
            newstate = state.movedown();
            if newstate.isGoalState()
                goalstate = newstate;
                disp('FOUND')
                foundGoal = 1;
                break;
            end
            
            %check to see if the next state has been explored yet
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                if newstate.pathcost < depth
                    stack.push(newstate)
                    continue;
                end
            end
        end
        
        if state.canmoveup() && ~strcmp(state.lastMove,'down')
            newstate = state.moveup();
            if newstate.isGoalState()
                goalstate = newstate;
                disp('FOUND')
                foundGoal = 1;
                break;
            end
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                if newstate.pathcost < depth
                    stack.push(newstate)
                    continue;
                end
            end
        end
        
        if state.canmoveleft() && ~strcmp(state.lastMove,'right')
            newstate = state.moveleft();
            if newstate.isGoalState()
                goalstate = newstate;
                disp('FOUND')
                foundGoal = 1;
                break;
            end
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                if newstate.pathcost < depth
                    stack.push(newstate)
                    continue;
                end
            end
        end
        
        if state.canmoveright() && ~strcmp(state.lastMove,'left')
            newstate = state.moveright();
            if newstate.isGoalState()
                goalstate = newstate;
                disp('FOUND')
                foundGoal = 1;
                break;
            end
            
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                if newstate.pathcost < depth
                    stack.push(newstate)
                    continue;
                end
            end
        end
        stack.pop();
    end
end


