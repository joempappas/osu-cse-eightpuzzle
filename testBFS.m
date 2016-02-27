clc
clear
format compact
layout = [0 2 3; 1 5 6; 4 7 8];
state = Eight(layout);
goalstate = BFS(state);

disp(goalstate.layout)