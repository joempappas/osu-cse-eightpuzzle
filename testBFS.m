clc
clear
format compact
layout3 = [2 0 3; 1 5 6; 4 7 8];
state3 = Eight(layout3);
layout4 = [0 2 3; 1 5 6; 4 7 8];
state4 = Eight(layout4);
layout7 = [2 3 6; 0 5 8; 1 4 7];
state7 = Eight(layout7);
layout8 = [2 3 6; 1 5 8; 0 4 7];
state8 = Eight(layout8);
exploredStates = [];
goalstate = [];
iterationArray = [];
timeArray = [];
numOfIterations = 0;
tic
%{
for i = 0:30
    [goalstate, foundGoal, numOfIterations] = IDS(state3, i, numOfIterations);
    if foundGoal
        break;
    end
end
%}
[goalstate, numOfIterations] = BFS(state3);
time = toc;
traceGoaltoInit(state3, goalstate);
timeArray = [timeArray, time];
iterationArray = [iterationArray, numOfIterations];
save('testSaveFile');
numOfIterations = 0;
tic
%{
for i = 0:30
    [goalstate, foundGoal, numOfIterations] = IDS(state4, i, numOfIterations);
    if foundGoal
        break;
    end
end
%}
[goalstate, numOfIterations] = BFS(state4);
time = toc;
traceGoaltoInit(state4, goalstate);
timeArray = [timeArray, time];
iterationArray = [iterationArray, numOfIterations];
save('testSaveFile');
numOfIterations = 0;
%{
for i = 0:30
    [goalstate, foundGoal, numOfIterations] = IDS(state7, i, numOfIterations);
    if foundGoal
        break;
    end
end
%}
[goalstate, numOfIterations] = BFS(state7);
traceGoaltoInit(state7, goalstate);
numOfIterations = 0;
%{
for i = 0:30
    [goalstate, foundGoal, numOfIterations] = IDS(state8, i, numOfIterations);
    if foundGoal
        break;
    end
end
%}
[goalstate, numOfIterations] = BFS(state8);
traceGoaltoInit(state8, goalstate);

disp('')
disp(goalstate.layout)
disp(goalstate.pathcost)

save('testSaveFile');
