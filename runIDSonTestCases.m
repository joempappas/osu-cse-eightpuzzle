clc
clear
format compact

disp('running testCases');
testCases
disp('done running testCases');

iterationArray = [];
timeArray = [];

for i = 1:length(finalTenObjects)
    tic
    disp('running IDS on initial state');
    state = finalTenObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    disp('FOUND GOAL')
    time = toc;
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
end
save('IDStimeAndIterations')
for i = 1:length(finalFifteenObjects)
    tic
    disp('running IDS on initial state');
    state = finalFifteenObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    disp('FOUND GOAL')
    time = toc;
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
end
save('IDStimeAndIterations')
for i = 1:length(finalTwentyObjects)
    tic
    disp('running IDS on initial state');
    state = finalTwentyObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    disp('FOUND GOAL')
    time = toc;
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
end
save('IDStimeAndIterations')
for i = 1:length(finalTwentyFiveObjects)
    tic
    disp('running IDS on initial state');
    state = finalTwentyFiveObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    disp('FOUND GOAL')
    time = toc;
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
end
save('IDStimeAndIterations')
for i = 1:length(finalThirtyObjects)
    tic
    disp('running IDS on initial state');
    state = finalThirtyObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    disp('FOUND GOAL')
    time = toc;
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
end
save('IDStimeAndIterations')