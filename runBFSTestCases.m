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
    disp('running BFS on initial state');
    state = finalTenObjects(i);
    
    [goalstate, numOfIterations] = BFS(state);
    disp(goalstate.pathcost)
    time = toc;
    disp('FOUND GOAL')
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
    save('BFStimeAndIterations')
end

for i = 1:length(finalFifteenObjects)
    tic
    disp('running BFS on initial state');
    state = finalTenObjects(i);
    
    [goalstate, numOfIterations] = BFS(state);
    disp(goalstate.pathcost)
    time = toc;
    disp('FOUND GOAL')
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
    save('BFStimeAndIterations')
end

for i = 1:length(finalTwentyObjects)
    tic
    disp('running BFS on initial state');
    state = finalTenObjects(i);
    
    [goalstate, numOfIterations] = BFS(state);
    disp(goalstate.pathcost);
    time = toc;
    disp('FOUND GOAL')
    timeArray = [timeArray, time];
    iterationArray = [iterationArray, numOfIterations];
    save('BFStimeAndIterations')
end