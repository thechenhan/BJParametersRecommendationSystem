function intersectlayer=deletevoidcell(intersectlayer)
intersectlayer=intersectlayer(~cellfun('isempty',intersectlayer));
layerNum=size(intersectlayer,2);
for i=1:layerNum
    id = cellfun('length',intersectlayer{i});
    intersectlayer{i}(id==0)=[];
end