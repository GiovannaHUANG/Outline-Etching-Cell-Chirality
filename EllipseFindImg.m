function [ EllipseNum EllipseRegion] = EllipseFindImg(latentOverlapImg, percentageThreshold)
%ELLIPSEFIND Summary of this function goes here
%   Detailed explanation goes here
%   continuously remove outline pixels in latentOverlapImg region and
%   recursive till the region separate
%   when the region solidity is higher than 'eatCandyThreshold' the process
%   could stop.

latentOverlapRegion = regionprops(latentOverlapImg, 'all');
latentCount = 0;
for i = 1:size(latentOverlapRegion,1)
        bb = latentOverlapRegion(i).BoundingBox;
        bb = ceil(bb);
        bb = int16(bb);
        
        
        if latentOverlapRegion(i).Area < 3
                latentOverlapImg(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1) = zeros(bb(4),bb(3));
       
        else if latentOverlapRegion(i).Area < 20 && latentOverlapRegion(i).Area > 2
                continue;
            end
        end
          if latentOverlapRegion(i).Solidity < percentageThreshold
            latentCount = latentCount + 1;
            
 
            [bound L] = bwboundaries(latentOverlapRegion(i).Image);
            for k = 1:length(bound)
                boundary = bound{k};
                boundary = boundary(1,1);
                row = bound{1,1}(:,1);
                col = bound{1,1}(:,2);
                for m = 1:size(row)
                    latentOverlapRegion(i).Image(row(m), col(m)) = 0;
                end
            end
%             se = strel('square',4);
%             latentOverlapRegion(i).Image = imerode(latentOverlapRegion(i).Image,se);
            latentOverlapImg(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1) = latentOverlapRegion(i).Image;
            
        else
  
            continue;
        end

      
end
   
if latentCount == 0;
    EllipseNum = size(latentOverlapRegion, 1);
    EllipseRegion = latentOverlapRegion;
    return;
else
    [EllipseNum EllipseRegion] = EllipseFindImg(latentOverlapImg, percentageThreshold);
end
% end
end

