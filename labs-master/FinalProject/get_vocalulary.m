function [] = get_vocalulary(train_data,dir_path,k,colorspaces,type,stepOrSIFTsamples)
%GET_VOCALULARY Summary of this function goes here
%   Detailed explanation goes here
train_data=train_data(:);
[clusters_idx,vocab_counts,ds,C] = find_codewords(train_data,dir_path,k,colorspaces,type,stepOrSIFTsamples);
save('vocabulary.mat','clusters_idx');
save('ds.mat','ds');
save('C.mat','C');
end

