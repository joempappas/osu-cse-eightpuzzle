clc
clear
format compact
layout = [1 0 3; 4 2 5; 7 8 6];
state = eightHeuristic(layout);
hasFoundGoal = 0;
exploredStates = [];
%%goalstate = DLS(state, hasFoundGoal, exploredStates);
[goalstate] = aStar(state);
disp(goalstate.layout)
disp(goalstate.pathcost)