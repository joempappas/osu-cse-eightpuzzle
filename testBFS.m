clc
clear
format compact
layout = [1 2 3; 4 5 6; 7 0 8];
state = Eight(layout);
hasFoundGoal = 0;
exploredStates = [];
goalstate = DLS(state, hasFoundGoal, exploredStates);

disp(goalstate.layout)
disp(goalstate.pathcost)