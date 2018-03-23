function [clusters_idx,counts,ds,C] = find_codewords(train_data,dir_path,k,colorspaces,type,stepOrSIFTsamples)
%FIND_CODEWORDS Summary of this function goes here
%   Detailed explanation goes here

    fs=[];
    ds=[];
    c=0;
    
    for i=1:size(train_data,1)
            img_path=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(train_data(i))));

            img=imread(img_path);
            img_op=im2double(img);
            
            if length(size(img))>2
%                 img=rgb2gray(img);
           d = get_descriptors_for_image(img,colorspaces,type,stepOrSIFTsamples);
           d=double(d);
%         d=permute(d,[2,1]);
        ds=cat(1,ds,d);
         else
        d=get_descriptors_for_image(img,colorspaces,type,stepOrSIFTsamples);
        d=double(d);
%         d=permute(d,[2,1]);
        ds=cat(1,ds,d);
% 
%                 [f,d]=sift(img);
%                 d=double(d);
%                 d=permute(d,[2,1]);
        %     clusters_idx=kmeans(d,128);


            %     imshow(img);
        %     fs=cat(1,fs,f);
        %     disp(size(d));
           
            end
    c=c+1
    end
%     pool = parpool; 
    stream =RandStream('mlfg6331_64'); 
    options = statset('UseParallel',1);
%     gpuDevice(1)
%     ds=gpuArray(ds);
%  vl_threads(0) 
%     ds_gpu=gpuArray(ds);
    tic
 
%     [C,clusters_idx]=vl_kmeans(ds', k, 'verbose', 'distance', 'l1','initialization', 'plusplus', 'algorithm', 'ann', 'MaxNumComparisons',ceil(k/ 50)) ;
%     C=C';
    
        [clusters_idx,C]=kmeans(ds,k,'Options',options,'MaxIter',300000,'Display','iter');
   toc
    counts=zeros(k);
    for j=1:size(clusters_idx,1)
        counts(clusters_idx(j))=counts(clusters_idx(j))+1;
    end
   
    
end

