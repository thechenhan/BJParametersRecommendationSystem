function [Layerarea,Xlimits,Ylimits]=slicebar(intersectionlayer)


if  size(intersectionlayer,2)==0
     Layerarea=0;
     Xlimits=[0,0];
     Ylimits=[0,0];
     return;
end

k=1;
 for i=1:size(intersectionlayer,2)
       for j=1:size(intersectionlayer{i},1)
       line(i,j)=k;
       point(k,1)=intersectionlayer{i}(j,1);
       point(k,2)=intersectionlayer{i}(j,2);
%      point(k,3)=intersec{i}(j,3);
       k=k+1;
       end
 end


 
% get the list of upper points of lines and the lower points of lines
Yline=[point(line(:,1),2) point(line(:,2),2)];
minY=min(Yline,[],2);
maxY=max(Yline,[],2);
%sort out the line end point by position.
[val, idx] = sort(minY);
LineBottomList=[val, idx];
[val, idx] = sort(maxY);
LineTopList=[val, idx];






%get the limit for display
Xlimits=[min(point(:,1)) max(point(:,1))];
Ylimits=[min(point(:,2)) max(point(:,2))];

%define slicethickness
SliceWidth=0.1;

%search from the lowest Y point
currY=LineBottomList(1,1)+SliceWidth;
%at least, search for one time
botIdx=0; topIdx=0;

%total area of printing 
TPA=0;
currLine=[];

%other variables
%number of entries in an array
NOA=0;


while currY < LineTopList(end, 1)
LPA=0;
if botIdx < size(LineBottomList,1)
       while LineBottomList(botIdx + 1, 1) <= currY
           %if LineBottomList(botIdx + 1, 1) < currY
           currLine(end + 1)=LineBottomList(botIdx + 1, 2);
           %end
           botIdx=botIdx + 1;
           if botIdx==size(LineBottomList,1)
               break;
           end
       end
end

if topIdx < size(LineTopList,1)
        remList=[];
        while LineTopList(topIdx + 1, 1) <= currY
            remList(end + 1)=LineTopList(topIdx + 1, 2);
            topIdx=topIdx + 1;
            if topIdx==size(LineTopList,1)
                break;
            end
        end
        
        currLine=setdiff(currLine, remList);
end

%calculate the intersecting point
currIntersect={};
for idxLine=1:numel(currLine)
        LineCoo=point(line(currLine(idxLine),:), :);
        intersectX=(LineCoo(2,1)-LineCoo(1,1))*(currY-LineCoo(1,2))/(LineCoo(2,2)-LineCoo(1,2))+LineCoo(1,1);
        intersecPoint=[intersectX currY];
        currIntersect{end + 1}=intersecPoint;
end



%get the array of X coordinates.
currIntersectX=[];
for i= 1:size(currIntersect,2)
    currIntersectX(i)=currIntersect{i}(1,1);
end

NOA=size(currIntersectX,2);
NOA=fix(NOA/2);
%calculate the area of printing
currIntersectX=sort(currIntersectX);
for i= 1:NOA
    LPA=LPA+currIntersectX(2*i)-currIntersectX(2*i-1);
end
TPA=TPA+LPA;
currY=currY+SliceWidth;
end
Layerarea=TPA*SliceWidth;


