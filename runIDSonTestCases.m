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
    time = toc;
    disp('FOUND GOAL')
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
    save('IDStimeAndIterations')
end

for i = 1:length(finalFifteenObjects)
    tic
    disp('running IDS on initial state');
    state = finalFifteenObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    time = toc;
    disp('FOUND GOAL')
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
    save('IDStimeAndIterations')
end

for i = 1:length(finalTwentyObjects)
    tic
    disp('running IDS on initial state');
    state = finalTwentyObjects(i);
    
    [goalstate, numOfIterations] = runIDS(state.layout);
    disp(goalstate.pathcost)
    time = toc;
    disp('FOUND GOAL')
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
    save('IDStimeAndIterations')
end