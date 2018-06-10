function [ finalRes resGroup ] = FindOverlapFunction(filename, bwThreshold, atWinSize,atThreshold,...
    latentOverlapProportion1, latentOverlapProportion2, eatCandyThreshold,ose1,ose2)
%%FINDOVERLAPFUNCTION Summary of this function goes here
%   Detailed explanation goes here
%   The main implementation 
%   PrePocess() function do the Image Binarization using Otsu's method
%   SegLatentOverlap() function is to identify clusters
%   CaveProcess() is to add binarization and adaptive threshold image
%   EatCandyShell() is to implement outline-etching method
%   All the parameters could modified according to image circustance
%   Pls refer to the function files for details
%%
groupNum = 5;
%% Image Pre-Process get binary
rawOriginal = imread(filename);
if size(rawOriginal,3) == 3
    rawOriginal = rgb2gray(rawOriginal);
end
BwOriginal = PreProcess(filename,bwThreshold);
%% clean too small region and uncomplete region(cell at the boundary of image)
areaThreshold = 100;
[BwOriginal newAllRegion] = EliminateNoisy(BwOriginal,areaThreshold);

resGroupWithoutAlgo = cell(1,1);
resGroupWithoutAlgo{1} = [newAllRegion];       
%% Cluster Identification to Seek the region that may have cell-overlap 
%   pls adjust the parameter according to the performance SegLatentOverlap(region, percentage);
%   for all regions, top 'latentOverlapProportion1' will be treated as region really have overlap;
%   'latentOverlapProprotion1' could be adjust in user interface or could
%   adjust lop1 in main file. 
[latentOverlapRegion ifLatentOverlap] = SegLatentOverlap(newAllRegion, latentOverlapProportion1);

%%  In order to make the concave between overlap cell more clear
%   method: binary image add threshold image
%   'ose1' 'ose2' could be adjusted in main file.
%   'atWinSize' 'atThreshold' could be ajusted in main file or in user
%   interface
BwOriginal = CaveProcess(BwOriginal,rawOriginal,latentOverlapRegion,ose1,ose2,atWinSize,atThreshold);

%% filter too small regions again, because the binary image is modified
BwOriginal = bwareaopen(BwOriginal,areaThreshold);
newAllRegion = regionprops(BwOriginal,'all');

%% Seek the region that may have cell-overlap for further processing
%   pls adjust the parameter according to the performance SegLatentOverlap(region, percentage);
%   for all regions, top 'latentOverlapProportion2' will be treated as region really have overlap;
%   'latentOverlapProprotion2' could be adjust in user interface or could
%   adjust lop2 in main file. 
[latentOverlapRegion ifLatentOverlap noOverlapRegion] = SegLatentOverlap(newAllRegion,latentOverlapProportion2);


%% divide whole image as 5 region
%   save the information of cell certainly does not have overlap into 'resGroup'
resCentroid = [noOverlapRegion.Centroid];
resCentroid = reshape(resCentroid,2,size(resCentroid,2)/2 );
resCentroid = resCentroid';
resCentroidY = resCentroid(:,2);
resGroup = cell(groupNum,1);
for j = 1:groupNum
    idx = find(resCentroidY < size(BwOriginal,1)/groupNum*j & resCentroidY > size(BwOriginal,1)/groupNum*(j-1));  
    resGroup{j} =[resGroup{j};noOverlapRegion(idx)];
end

%% If need the information and data from region maybe have overlap, use this part code
%   'eatCandyThreshold' could be adjusted in main file to determine when to
%   stop outline etching process for a region
resGroup = EatCandyShell(latentOverlapRegion, BwOriginal, resGroup, groupNum,eatCandyThreshold);


finalRes = zeros(size(rawOriginal));
for ii = 1:size(resGroup,1) 
    for jj = 1:size(resGroup{ii},1)  
            bb = resGroup{ii}(jj).BoundingBox;
            bb = ceil(bb);
            bb = int16(bb);
                finalRes(bb(2) : bb(2) + bb(4)-1, bb(1) : bb(1) + bb(3)-1) = resGroup{ii}(jj).Image;
    end 
end


end
