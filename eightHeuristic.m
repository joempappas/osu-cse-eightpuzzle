classdef eightHeuristic < handle
    %EIGHT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        layout
        pathcost
        pathToGoal
        heuristic
        parent = eightHeuristic.empty;
        lastMove
    end
    
    methods

        function obj = eightHeuristic(layout)
            obj.layout = layout;
            obj.pathcost = 0;
            obj.parent;
            obj.lastMove;
            obj.heuristic;
            obj.pathToGoal;
            
        end
        
        function copy = copyState(object)
            copy = eightHeuristic(object.layout);
            copy.pathcost = object.pathcost;
            copy.parent = object.parent;
            copy.lastMove = object.lastMove;
            copy.heuristic = object.heuristic;
            copy.pathToGoal = object.pathToGoal;
        end
        
        function calculateHeuristic(obj)
            i = 1;
            sum = 0;
            while i <= 8
                [row, col] = find(obj.layout == i);
                sum = sum + heuristic(row, col, i);
                i = i + 1;
            end
            [row, col] = find(obj.layout == 0);
            sum = sum + heuristic(row, col, 0);
            obj.pathToGoal = sum;
            obj.heuristic = obj.pathToGoal + obj.pathcost;
        end
        
        function visitnode(newNode, parent, move)
            newNode.parent = parent;
            newNode.lastMove = move;
            newNode.pathcost = parent.pathcost + 1;
            calculateHeuristic(newNode);
        end
        
        function u = canmoveup(obj)
            [row, ~] = find(obj.layout ==0);
            if (isequal(row,2)||isequal(row,3))
                u = true;
            else
                u = false;
            end
        end
        
        function d = canmovedown(obj)
            [row, ~] = find(obj.layout ==0);
            if (isequal(row,1)||isequal(row,2))
                d = true;
            else
                d = false;
            end
        end
        
        function r = canmoveright(obj)
            [~, col] = find(obj.layout ==0);
            if (isequal(col,1)||isequal(col,2))
                r = true;
            else
                r = false;
            end
         end
        
         function l = canmoveleft(obj)
            [~, col] = find(obj.layout ==0);
            if (isequal(col,2)||isequal(col,3))
                l = true;
            else
                l = false;
            end
         end
         
         function obj2 = moveleft(obj)
             if canmoveleft(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row,col-1);
                obj2 = eightHeuristic(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row, col-1) = 0;
                visitnode(obj2, obj, 'left');
             end
         end
         
        function obj2 = moveright(obj)
             if canmoveright(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row,col+1);
                obj2 = eightHeuristic(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row, col+1) = 0;
                visitnode(obj2, obj, 'right');
             end
        end
        function obj2 = moveup(obj)
             if canmoveup(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row-1,col);
                obj2 = eightHeuristic(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row-1, col) = 0;
                visitnode(obj2, obj, 'up');
             end
        end
         
         function obj2 = movedown(obj)
             if canmovedown(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row+1,col);
                obj2 = eightHeuristic(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row+1, col) = 0;
                visitnode(obj2, obj, 'down');
             end
         end
         
         function x = isGoalState(obj)
             goalState = [1 2 3; 4 5 6; 7 8 0];
             x = isequal(obj.layout, goalState);
         end
         
    end
    
end

