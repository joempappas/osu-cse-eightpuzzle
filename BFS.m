function goalstate = BFS( start_state )
    import CQueue
    import hasBeenExplored;
    goalstate = [];
    listOfExploredStates = [];
    queue = CQueue();
    queue.push(start_state);
    listOfExploredStates = [listOfExploredStates, start_state];
    while queue.isempty() == 0
        state = queue.pop();
        listOfExploredStates = [state, listOfExploredStates];
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
                queue.push(newstate())
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

