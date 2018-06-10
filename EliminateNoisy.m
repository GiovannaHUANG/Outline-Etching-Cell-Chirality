function [ BwOriginal newAllRegion] = EliminateNoisy( BwOriginal, areaThresthold )
%ELIMINATENOISY Summary of this function goes here
%   Detailed explanation goes here
%   Get all connect regions and filter small regions
%   filter the region do not fit the constraints
%   if the region at the boundary of image or the region is too small that should be treated as noisy
%   black these region in BwOriginal

allRegion = regionprops(BwOriginal,'all');
newAllRegion = struct([]);
for i=1:size(allRegion,1) 
   bb = allRegion(i).BoundingBox;
   bb = ceil(bb);
   bb = int16(bb);
   if bb(1) == 1 || bb(2) == 1 || bb(2) + bb(4)-1 == size(BwOriginal,1) || bb(1) + bb(3)-1 == size(BwOriginal,2)
       BwOriginal(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1) = zeros(bb(4),bb(3));
       continue;
   end
   if (allRegion(i).ConvexArea > areaThresthold)
       newAllRegion = [newAllRegion;allRegion(i)];
   else
       BwOriginal(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1) = zeros(bb(4),bb(3));
   end

end

end

