function [ BwOriginal ] = PreProces( filename, binaryThreshold)
%PREPROCES Summary of this function goes here
%   Detailed explanation goes here
%   read file & binary image & adaptiveThreshold
%   'binaryThreshold' is a scale working on Otsu global threshold.
%   Generally using 1, while could adjust according to image.
%   Small scale will make binarization image white parts larger and 
%   have more connection;
%   Big scale will make binarization image white parts smaller and have
%   less connection.

FileName=strcat(filename);
original_uint16 = imread(filename); 
original= imread(filename); 
if size(original_uint16,3) == 3
    original_uint16 = rgb2gray(original_uint16);    
    original = rgb2gray(original);
end

f = fspecial('gaussian',[3 3],10);      %gaussian
original = imfilter(original,f,'same');

original = imadjust(original);

level = graythresh(original);
BwOriginal = im2bw(original,level*binaryThreshold);
end
