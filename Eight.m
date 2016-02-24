classdef Eight < handle
    %EIGHT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        layout
        pathcost
    end
    properties (SetAccess = private)
        parent = Eight.empty;
        lastMove
    end
    
    methods
        function obj = Eight(layout)
            obj.layout = layout;
            obj.pathcost = 0;
            obj.parent;
            obj.lastMove;
        end
        
        function visitnode(newNode, parent, move)
            newNode.parent = parent;
            newNode.lastMove = move;
            newNode.pathcost = parent.pathcost + 1;
        end
        
        function u = canmoveup(obj)
            [row, ~] = find(obj.layout ==0);
            if (row==2||row==3)
                u = true;
            else
                u = false;
            end
        end
        
        function d = canmovedown(obj)
            [row, ~] = find(obj.layout ==0);
            if (row==1||row==2)
                d = true;
            else
                d = false;
            end
        end
        
        function r = canmoveright(obj)
            [~, col] = find(obj.layout ==0);
            if (col==1||col==2)
                r = true;
            else
                r = false;
            end
         end
        
         function l = canmoveleft(obj)
            [~, col] = find(obj.layout ==0);
            if (col==2||col==3)
                l = true;
            else
                l = false;
            end
         end
         
         function obj2 = moveleft(obj)
             if canmoveleft(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row,col-1);
                obj2 = Eight(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row, col-1) = 0;
                visitnode(obj2, obj, 'left');
             end
         end
         
        function obj2 = moveright(obj)
             if canmoveright(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row,col+1);
                obj2 = Eight(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row, col+1) = 0;
                visitnode(obj2, obj, 'right');
             end
        end
        function obj2 = moveup(obj)
             if canmoveup(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row-1,col);
                obj2 = Eight(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row-1, col) = 0;
                visitnode(obj2, obj, 'up');
             end
        end
         
         function obj2 = movedown(obj)
             if canmovedown(obj)
                [row, col] = find(obj.layout == 0);
                numToSwitch = obj.layout(row+1,col);
                obj2 = Eight(obj.layout);
                obj2.layout(row,col) = numToSwitch;
                obj2.layout(row+1, col) = 0;
                visitnode(obj2, obj, 'down');
             end
         end
         
         function x = isGoalState(obj)
             goalState = [1 2 3; 4 5 6; 7 8 0];
             x = true;
             for row = 1:3
                 for col = 1:3
                    if obj.layout(row,col) ~= goalState(row,col)
                        x = false;
                        break;
                    end
                 end
             end
         end
         
    end
    
end

