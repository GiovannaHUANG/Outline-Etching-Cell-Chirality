function [ resGroup ] = EatCandyShell( latentOverlapRegion, BwOriginal, resGroup, groupNum, eatCandyThreshold)
%EATCANDYSHELL Summary of this function goes here
%   Detailed explanation goes here
%   Outline etching method implementation
%   when to stop outline etching is determined by 'eatCandyThreshold'. when
%   the region solidity is higher than 'eatCandyThreshold' the process
%   could stop.
for i = 1:size(latentOverlapRegion,1) 

    bb = latentOverlapRegion(i).BoundingBox;
    bb = ceil(bb);
    bb = int16(bb);
      [ENum ERegion] = EllipseFindImg(latentOverlapRegion(i).Image, eatCandyThreshold);    
    if size(ERegion,1) <= 9

        for m = 1:size(ERegion,1)
            
            ERegion(m).Centroid(1) = ERegion(m).Centroid(1) + double(bb(1));
            ERegion(m).Centroid(2) = ERegion(m).Centroid(2) + double(bb(2));
            ERegion(m).BoundingBox(1) = ERegion(m).BoundingBox(1) + double(bb(1));
            ERegion(m).BoundingBox(2) = ERegion(m).BoundingBox(2) + double(bb(2));
            groupNo = ceil(ERegion(m).Centroid(2) / ceil(size(BwOriginal,1)/groupNum));
            resGroup{groupNo} = [resGroup{groupNo};ERegion(m)];
        end

    else
        
        continue;
    end
end
end

