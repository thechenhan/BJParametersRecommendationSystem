function  intersectlayers=slicelayer(fileName,layerthickness)
dbstop if error

[vertices, tessellation] = readStl(fileName);

layerThickness = layerthickness;

%define layer index
layerindex=1;

%build top amd bottom Z triangle list
[triBottomList, triTopList] = buildTopBotLists(vertices, tessellation);

%for display get limits
xLimits = [min(vertices(:,1)) max(vertices(:,1))];
yLimits = [min(vertices(:,2)) max(vertices(:,2))];
zLimits = [min(vertices(:,3)) max(vertices(:,3))];

assignin('base','xLimits',xLimits);
assignin('base','yLimits',yLimits);
assignin('base','yLimits',zLimits);

return ( - xLimits(1, 1) + xLimits(1, 2) );

end