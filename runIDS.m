function [goalstate, numOfIterations] = runIDS( layout )

    import IDS
    goalstate = [];
    state = Eight(layout);
    for i = 0:30
        [goalstate, foundGoal, numOfIterations] = IDS(state, i);
        if foundGoal
            break;
        end
    end
    disp('FOUND GOAL')

end

