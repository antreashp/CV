function [histog] = get_hist(dir_path,im_path,k,C,colorspaces,type,stepOrSIFTsamples)
%GET_HIST Summary of this function goes here
%   Detailed explanation goes here
    img_path=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(im_path)));

    img=imread(img_path);
       da=[];
       
    if length(size(img))>2
              
%         img=rgb2gray(img);
       
      d=get_descriptors_for_image(img,colorspaces,type,stepOrSIFTsamples);
        d=double(d);
        d=permute(d,[2,1]);
        da=cat(1,da,d);
   else
        d=get_descriptors_for_image(img,colorspaces,type,stepOrSIFTsamples);
        d=double(d);
        d=permute(d,[2,1]);
        da=cat(1,da,d);


  end

    
    
    
    
    
%     [fa,da]=sift(img);
    da=double(da);
    da=permute(da,[2,1]);
%     disp(size(da));
    counts=zeros(k,1);
%     disp(size(C));
%     disp(size(da));
    Idx = dsearchn(C,da);
%     for i =1:size(Idx,1)
%        counts(Idx(i))=counts(Idx(i),1) +1; 
%     end
    histog=hist(Idx,1:k);
    
    histog=histog ./ size(Idx,1);
%     
%     normA = histog - min(histog(:));
%     histog = normA ./ max(normA(:));
%     histog=reshape(histog,1,k);
end

