function [goalstate, foundGoal, numOfIterations] = IDS( start_state, depth )
%IDS searches the 8 puzzle for a solution. The goal state is returned with
%updated properties that give the pathcost to get there, parent state, and
%the last move that got there.

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
    numOfIterations = 0;
    
    %IDS will run until the stack is empty (i.e. all states within the given depth
    %have been explored) or until a goal state is found. 
    while ~stack.isempty()
        numOfIterations = numOfIterations + 1;
        
        state = stack.top();
        disp(state.pathcost);
        
        %The following if loops check if the blank space can move a certain
        %way and if it can then it checks if the next state is the goal
        %state, and if it is not then it adds it to the queueif it has not
        %been explored yet
        
        if state.canmovedown() && strcmp(state.lastMove,'up') == 0
            newstate = state.movedown();
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
        
        if state.canmoveup() && strcmp(state.lastMove,'down') == 0
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
        
        if state.canmoveleft() && strcmp(state.lastMove,'right') == 0
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
        
        if state.canmoveright() && strcmp(state.lastMove,'left') == 0
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


