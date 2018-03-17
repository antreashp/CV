function [fa,da] = sift(img)
%SIFT Summary of this function goes here
if length(size(img))==2
ia=im2single(img);

else
ia=im2single(rgb2gray(img));
    
end

[fa,da] = vl_dsift(ia,'step',15);


end

