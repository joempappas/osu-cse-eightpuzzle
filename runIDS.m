function [goalstate, numOfIterations] = runIDS( layout )

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

