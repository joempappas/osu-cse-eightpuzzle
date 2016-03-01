function [goalstate, numOfIterations] = BFS( start_state )
%BFS searches the 8 puzzle for a solution. The goal state is returned with
%updated properties that give the pathcost to get there, parent state, and
%the last move that got there.

    import CQueue
    import hasBeenExplored;
    goalstate = [];
    if start_state.isGoalState()
        goalstate = start_state.copyState();
    end
    exploredStates = [];
    queue = CQueue();
    queue.push(start_state);
    exploredStates = [exploredStates, start_state.layout];
    numOfIterations = 0;
    %BFS will run until the queue is empty (i.e. all states have been
    %explored) or until a goal state is found. 
    while queue.isempty() == 0
        numOfIterations = numOfIterations + 1;
        
        %current node being explored is popped off the top of the queue and
        %added to the listOfExploredStates
        state = queue.pop();
        exploredStates = [exploredStates, state.layout];
        
        %disp(listOfExploredStates(1).layout)
        
        
        %The following if loops check if the blank space can move a certain
        %way and if it can then it checks if the next state is the goal
        %state, and if it is not then it adds it to the queueif it has not
        %been explored yet
        
        if state.canmovedown() && (strcmp(state.lastMove,'up') == 0)
            newstate = state.movedown();
            if newstate.isGoalState()
                goalstate = newstate.copyState();
                break;
            end
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                queue.push(newstate)
            end
        end
        
        if state.canmoveup() && (strcmp(state.lastMove,'down') == 0)
            newstate = state.moveup();
            if newstate.isGoalState()
                goalstate = newstate.copyState();
                break;
            end
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                queue.push(newstate)
            end
        end
        
        if state.canmoveleft() && (strcmp(state.lastMove,'right') == 0)
            newstate = state.moveleft();
            if newstate.isGoalState()
                goalstate = newstate.copyState();
                break;
            end
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                queue.push(newstate)
            end
        end
        
        if state.canmoveright() && (strcmp(state.lastMove,'left') == 0)
            newstate = state.moveright();
            if newstate.isGoalState()
                goalstate = newstate.copyState();
                break;
            end
            stateUnexplored = hasBeenExplored(newstate, exploredStates);
            if stateUnexplored
                exploredStates = [exploredStates, newstate.layout];
                queue.push(newstate)
            end
        end
    end
end

