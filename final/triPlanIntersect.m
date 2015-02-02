% ==========================================================
% Copyright (C) Damien Berget 2013
% This code is only usable for non-commercial purpose and 
% provided as is with no guaranty of any sort
% ==========================================================
% 
% Matlab STL Slicer step 1.
% See http://exploreideasdaily.wordpress.com for details.

function intersectCoo = triPlanIntersect(triCoo, currZ)

%point status relative to currZ
status = [0; 0; 0];
status(triCoo(:,3) > currZ) = 1;
status(triCoo(:,3) < currZ) = -1;

inPlan = find(status == 0);
outPlan = find(status ~= 0);
switch numel(inPlan)
    case 3
        %the triangle is aligned with plan, return the 3 points
        intersectCoo = triCoo;
    case 2
        %One side of the triangle is aligned with plan, 
        % return these 2 points/segment
        intersectCoo = triCoo(inPlan, :);
    case 1
        %check if 2 other points are on the same side of curr z
        if prod(outPlan) > 0
            %same side, so triangle is only touching on 1 inplan vertex
            intersectCoo = triCoo(inPlan, :);
        else
            %both side, so project intersection to get vector
            intersectCoo = [triCoo(inPlan, :); ...
                            vectPlanIntersect(triCoo(outPlan, :), currZ)];
        end
    case 0
        intersectCoo = [];
        intersectCoo = [intersectCoo; vectPlanIntersect(triCoo([1 2], :), currZ)];
        intersectCoo = [intersectCoo; vectPlanIntersect(triCoo([2 3], :), currZ)];
        intersectCoo = [intersectCoo; vectPlanIntersect(triCoo([1 3], :), currZ)];
end

function intersect = vectPlanIntersect(vectCoo, currZ)

%if both point are on the same side os the plan, abort
if sign(vectCoo(1,3) - currZ) == sign(vectCoo(2,3) - currZ)
    intersect = [];
    return;
end

xIntersect = (currZ - vectCoo(1,3)) * (vectCoo(2,1) - vectCoo(1,1)) / (vectCoo(2,3) - vectCoo(1,3)) + vectCoo(1,1);
yIntersect = (currZ - vectCoo(1,3)) * (vectCoo(2,2) - vectCoo(1,2)) / (vectCoo(2,3) - vectCoo(1,3)) + vectCoo(1,2);
zIntersect = currZ;

intersect = [xIntersect yIntersect zIntersect];


