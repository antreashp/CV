function [clusters_idx,counts,ds] = find_codewords(train_data,dir_path,k)
%FIND_CODEWORDS Summary of this function goes here
%   Detailed explanation goes here

    fs=[];
    ds=[];
    c=0;
    for i=1:size(train_data,1)
            img_path=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(train_data(i))));

            img=imread(img_path);
            [f,d]=sift(img);
            d=double(d);
            d=permute(d,[2,1]);
        %     clusters_idx=kmeans(d,128);


            %     imshow(img);
        %     fs=cat(1,fs,f);
        %     disp(size(d));
           ds=cat(1,ds,d);

    c=c+1
    end
    options = statset('UseParallel',1);
    tic
    clusters_idx=kmeans(ds,k,'Options',options,'MaxIter',10000);
   toc
    counts=zeros(k);
    for j=1:size(clusters_idx,1)
        counts(clusters_idx(j))=counts(clusters_idx(j))+1;
    end
   
    
end

