clc
clear
format compact
layout1 = [2 0 3; 1 5 6; 4 7 8];
state1 = Eight(layout1);
layout2 = [0 2 3; 1 5 6; 4 7 8];
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
traceGoaltoInit(state1, goalstate);
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
traceGoaltoInit(state2, goalstate);
timeArray = [timeArray, time];
iterationArray = [iterationArray, numOfIterations];
save('testSaveFile');

disp('')
disp(goalstate.layout)
disp(goalstate.pathcost)

save('testSaveFile');
