%%This script produces 5 arrays each with 10 objects of 10,15,20,25,30
%%pathcosts. The goalstate is used as the starting point for each final
%%layout.
clc
clear
goalState = [1 2 3; 4 5 6; 7 8 0];
obj = Eight(goalState);
exploredLayouts = [];
%%generate pathcost = 10 layouts
finalObjects = [];
[exploredLayouts, finalObjects] = createTests(obj, exploredLayouts, 10, finalObjects);
finalObjects = finalObjects(randperm(length(finalObjects)));
finalTenObjects = finalObjects(1:10);

%%generate pathcost = 15 layouts
finalObjects = [];
i=1;
while i < 10
    [exploredLayouts, finalObjects] = createTests(finalTenObjects(i),  exploredLayouts, 15, finalObjects);
    i = i +1;
end
finalObjects = finalObjects(randperm(length(finalObjects)));
finalFifteenObjects = finalObjects(1:10);

%%generate pathcost = 20 layouts
finalObjects = [];
i = 1;
while i < 5
    [exploredLayouts, finalObjects] = createTests(finalFifteenObjects(i),  exploredLayouts, 20, finalObjects);
    i = i +1;
end
finalObjects = finalObjects(randperm(length(finalObjects)));
finalTwentyObjects = finalObjects(1:10);

%%generate pathcost = 25 layouts
finalObjects = [];
i = 1;
while i < 10
    [exploredLayouts, finalObjects] = createTests(finalTwentyObjects(i),  exploredLayouts, 25, finalObjects);
    i = i+1;
end
finalObjects = finalObjects(randperm(length(finalObjects)));
finalTwentyFiveObjects = finalObjects(1:10);

%%generate pathcost = 30 layouts
finalObjects = [];
i = 1;
while i < 10
    [exploredLayouts, finalObjects] = createTests(finalTwentyFiveObjects(i), exploredLayouts, 30, finalObjects);
    i = i +1;
end
finalObjects = finalObjects(randperm(length(finalObjects)));
finalThirtyObjects = finalObjects(1:10);

