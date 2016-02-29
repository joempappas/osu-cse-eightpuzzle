clc
clear
format compact
layout1 = [0 2 3; 4 1 6; 7 8 5];
state1 = Eight(layout1);
layout2 = [3 6 5; 2 1 0; 4 7 8];
state2 = Eight(layout2);
exploredStates = [];
goalstate = [];
iterationArray = [];
timeArray = [];
tic
for i = 0:30
    [goalstate, foundGoal, numOfIterations] = IDS(state1, i);
    if foundGoal
        break;
    end
end
time = toc;
timeArray = [timeArray, time];
iterationArray = [iterationArray, numOfIterations];
save('testSaveFile');
tic
for i = 0:30
    [goalstate, foundGoal, numOfIterations] = IDS(state2, i);
    if foundGoal
        break;
    end
end
time = toc;
timeArray = [timeArray, time];
iterationArray = [iterationArray, numOfIterations];
save('testSaveFile');

disp(goalstate.layout)
disp(goalstate.pathcost)

save('testSaveFile');
