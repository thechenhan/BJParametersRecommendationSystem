% ==========================================================
% Copyright (C) Damien Berget 2013
% This code is only usable for non-commercial purpose and 
% provided as is with no guaranty of any sort
% ==========================================================
% 
% Matlab STL Slicer step 1.
% See http://exploreideasdaily.wordpress.com for details.
function [triBottomList, triTopList] = buildTopBotLists(vertices, tessellation)

%find min and maz z for each triangle
ZTri = [vertices(tessellation(:,1),3) vertices(tessellation(:,2),3) vertices(tessellation(:,3),3)];
minZ = min(ZTri,[], 2);
maxZ = max(ZTri,[], 2);

%build top & bottom list
[val, idx] = sort(minZ);
triBottomList = [val idx];
[val, idx] = sort(maxZ);
triTopList = [val idx];
