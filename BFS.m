function goalstate = BFS( start_state )
%BFS searches the 8 puzzle for a solution. The goal state is returned with
%updated properties that give the pathcost to get there, parent state, and
%the last move that got there.

    import CQueue
    import hasBeenExplored;
    goalstate = [];
    if start_state.isGoalState()
        goalstate = start_state;
    end
    listOfExploredStates = [];
    queue = CQueue();
    queue.push(start_state);
    listOfExploredStates = [listOfExploredStates, start_state.layout];
    
    %BFS will run until the queue is empty (i.e. all states have been
    %explored) or until a goal state is found. 
    while queue.isempty() == 0
        
        %current node being explored is popped off the top of the queue and
        %added to the listOfExploredStates
        state = queue.pop();
        listOfExploredStates = [listOfExploredStates, state.layout];
        
        
        %disp(listOfExploredStates(1).layout)
        
        
        %The following if loops check if the blank space can move a certain
        %way and if it can then it checks if the next state is the goal
        %state, and if it is not then it adds it to the queueif it has not
        %been explored yet
        
        if state.canmovedown()
            newstate = state.movedown();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            %if hasBeenExplored(newstate, listOfExploredStates) == 0
                queue.push(newstate)
            %end
        end
        
        if state.canmoveup()
            newstate = state.moveup();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            %if hasBeenExplored(newstate, listOfExploredStates) == 0
                queue.push(newstate)
            %end
        end
        
        if state.canmoveleft()
            newstate = state.moveleft();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            %if hasBeenExplored(newstate, listOfExploredStates) == 0
                queue.push(newstate)
            %end
        end
        
        if state.canmoveright()
            newstate = state.moveright();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            
            %if hasBeenExplored(newstate, listOfExploredStates) == 0
                queue.push(newstate)
            %end
        end
    end
end

