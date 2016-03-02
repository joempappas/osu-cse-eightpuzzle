function [ ] = traceGoaltoInit( initialstate, goalstate )
%traceGoaltoInit Saves the list of moves taken to get to the goal state and
%if run, will let the user step through the moves taken, showing the resulting
%state after each step. 

listOfMoves = {};
lastMove = goalstate.lastMove;
state = goalstate.parent;
listOfMoves = [lastMove, listOfMoves];
i = 0;
while i < goalstate.pathcost
    lastMove = state.lastMove;
    listOfMoves = [lastMove, listOfMoves];
    state = state.parent;
    i = i + 1;
end
disp(listOfMoves)
disp(initialstate.layout)
state = Eight(initialstate.layout);
for j = 1:length(listOfMoves)
    str = input('press enter to continue');
    if (strcmp(listOfMoves(j),'right'))
        state = state.moveright();
        disp('right')
    end
    
    if (strcmp(listOfMoves(j),'left'))
        state = state.moveleft();
        disp('left')
    end
    
    if (strcmp(listOfMoves(j),'up'))
        state = state.moveup();
        disp('up')
    end
    
    if (strcmp(listOfMoves(j),'down'))
        state = state.movedown();
        disp('down')
    end
    
    disp(state.layout)
end
