function [histog] = get_hist(dir_path,im_path,ds,clusters,k)
%GET_HIST Summary of this function goes here
%   Detailed explanation goes here
    img_path=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(im_path)));

    img=imread(img_path);
    [fa,da]=sift(img);
    da=double(da);
    da=permute(da,[2,1]);
    counts=zeros(400,1);

    Idx = knnsearch(ds,da);
    for i =1:size(Idx,1)
       counts(clusters(Idx(i)),1)=counts(clusters(Idx(i)),1) +1; 
    end
    histog=hist(counts,k);
    normA = histog - min(histog(:));
    histog = normA ./ max(normA(:)); % *
    histog=reshape(histog,1,1,400);
end

