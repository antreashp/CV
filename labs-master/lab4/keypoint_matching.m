function [fa,fb,matches] = keypoint_matching(im_a,im_b)
%KEYPOINT_MATCHING Summary of this function goes here
%   find matches 
if length(size(im_a))==2
ia=im2single(im_a);

ib=im2single(im_b);
else
ia=im2single(rgb2gray(im_a));

ib=im2single(rgb2gray(im_b));
    
end

[fa,da] = vl_sift(ia);
[fb,db] = vl_sift(ib);


[matches,scores]=vl_ubcmatch(da,db);
end

