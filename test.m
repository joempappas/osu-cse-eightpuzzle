clc
clear
format compact
state = [1 2 3; 4 5 6; 7 0 8];
obj = Eight(state);
obj.layout = state;
y = obj.canmoveup()
a = obj.canmovedown()
b = obj.canmoveright()
c = obj.canmoveleft()
obj7 = obj.moveright()
state1 = [1 2 3; 4 5 0; 7 8 6];
obj2 = Eight;
obj2.layout = state1;
y = obj2.canmoveup()
a = obj2.canmovedown()
b = obj2.canmoveright()
c = obj2.canmoveleft()
obj3 = obj2.moveleft()
obj4 = obj2.moveup()
obj5 = obj2.movedown()
state2 = [1 2 3; 4 5 6; 7 8 0];
objjj = Eight;
objjj.layout = state2;
x = objjj.isGoalState


