function [fa, fb, matches] = keypoint_matching(im_a, im_b)
    %KEYPOINT_MATCHING Summary of this function goes here
    %   find matches 
    
    % convert color to grayscale
    if length(size(im_a)) ~= 2
        im_a = rgb2gray(im_a);
    	im_b = rgb2gray(im_b);  
    end

    % convert to single
    im_a = im2single(im_a);
    im_b = im2single(im_b);

    % match the keypoints using sift
    [fa, da] = vl_sift(im_a);
    [fb, db] = vl_sift(im_b);
    [matches, ~] = vl_ubcmatch(da, db);
end

