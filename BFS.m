function goalstate = BFS( start_state )
    import CQueue
    goalstate = [];
    listOfExploredStates = [];
    queue = CQueue();
    queue.push(start_state);
    listOfExploredStates = [listOfExploredStates, start_state];
    while queue.isempty() == 0
        state = queue.pop();
        
        if state.canmovedown()
            newstate = state.movedown();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            queue.push(state.movedown())
        end
        
        if state.canmoveup()
            newstate = state.moveup();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            queue.push(state.moveup())
        end
        
        if state.canmoveleft()
            newstate = state.moveleft();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            queue.push(state.moveleft())
        end
        
        if state.canmoveright()
            newstate = state.moveright();
            if newstate.isGoalState()
                goalstate = newstate;
                break;
            end
            queue.push(state.moveright())
        end
    end
end

