function [goalstate, numOfIterations] = runIDS( layout )
%RUNIDS is a function that is the iterative part of iterative deepening. It
%will run IDS up to 30 times with a different maximum depth each time. This
%will return the goalstate and the number of iterations.

    import IDS
    goalstate = [];
    state = Eight(layout);
    numOfIterations = 0;
    for i = 0:30
        [goalstate, foundGoal, numOfIterations] = IDS(state, i, numOfIterations);
        if foundGoal
            break;
        end
    end
    disp('FOUND GOAL')

end

