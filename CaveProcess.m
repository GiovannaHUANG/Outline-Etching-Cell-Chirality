function [ BwOriginal ] = CaveProcess( BwOriginal,rawOriginal,latentOverlapRegion,ose1,ose2,atWinSize,atThreshold)
%CAVEPROCESS Summary of this function goes here
%   Detailed explanation goes here
%   For cluster region will get into this process to logical add 
%   adaptive threshold image and binarization image.
%   Adaptive threshold parameters could be ajusted.
%   open process structure element size(ose1, ose2) could also be adjusted
%   according to the performance
    preName = 's1\s1(2)\';
    for i=1:size(latentOverlapRegion,1)
        bb = latentOverlapRegion(i).BoundingBox;
        bb = ceil(bb);
        bb = int16(bb);
        
        latentRawOriginal = rawOriginal(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1);
        diskRadius = ose1;
        se = strel('disk',diskRadius);
        latentOpen = imopen(imadjust(latentRawOriginal),se);
        latentOpenAT = adaptivethreshold(latentOpen,atWinSize,atThreshold,0);
        latentOri = BwOriginal(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3) -1);
        latentOpenAT = ~latentOpenAT;
        latentOri = ~latentOri;
        latentComb = latentOpenAT + latentOri;
        latentComb = ~latentComb;

        se = strel('disk',ose2);
        latentCombOpen = imopen(latentComb,se);

        latentCombOpen = bwareaopen(latentCombOpen,20);

        BwOriginal(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1) = latentCombOpen;
    end

end

