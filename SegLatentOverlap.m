function [ latentOverlapRegion  ifLatentOverlap noOverlapRegion] = SegLatentOverlap( newAllRegion, percentage)
%SEGLATENTOVERLAP Summary of this function goes here
%   Detailed explanation goes here

%   this function finds the connect region that region convex is bigger than
%   actual region
%   'newAllregion' is the connected region in the picture

%    for all latent overlap region, top 'percentage' will be identified as 
%    cluster and get into next process
%    larger percentage will make more region to be processed


if (size(newAllRegion,1) == 0)
    ifLatentOverlap = true;
    latentOverlapRegion = struct([]);
    return;
end

% method1
area = [newAllRegion.Area];
convexArea = [newAllRegion.ConvexArea];
subArea = convexArea - area;
[sortRes,idx] = sort(subArea,'descend');
if sortRes(1) > 20
    ifLatentOverlap = true;
else
    ifLatentOverlap = false;
end
idxLatentOverlap = idx(1 : size(idx,2)*percentage);
latentOverlapRegion = newAllRegion(idxLatentOverlap);
idxNoLatentOverlap = idx(size(idx,2)*percentage: size(idx,2));
noOverlapRegion = newAllRegion(idxNoLatentOverlap);


