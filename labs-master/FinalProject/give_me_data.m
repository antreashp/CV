function [vocab_data,training,testing] = give_me_data(n_train,n_test,shuffle,classes)
%GIVE_ME_DATA Summary of this function goes here
%   Detailed explanation goes here
dir_path='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageSets/';

% d1 = fopen(string(strcat(dir_path,'airplanes_train.txt')),'r');
% d2 = fopen(string(strcat(dir_path,'cars_train.txt')),'r');
% d3 = fopen(string(strcat(dir_path,'faces_train.txt')),'r');
% d4 = fopen(string(strcat(dir_path,'motorbikes_train.txt')),'r');
d_train_paths=["airplanes_train.txt","cars_train.txt","faces_train.txt","motorbikes_train.txt"];
d_test_paths=["airplanes_test.txt","cars_test.txt","faces_test.txt","motorbikes_test.txt"];

train_images_ids=[];
test_images_ids=[];

%  disp(size(classes));
for dir =1:size(classes,2)
    id=fopen(string(strcat(dir_path,d_train_paths(classes(dir)))),'r');
    for t_num=1:n_train
        A = fscanf(id, '%s/n');
        
        A=strcat(A,'.jpg');
        train_images_ids=cat(1,train_images_ids,string(A));
    end
    
    fclose(id);
    id=fopen(string(strcat(dir_path,d_test_paths(classes(dir)))),'r');
    
    for t_num=1:n_test
        A = fscanf(id, '%s/n');
        A=strcat(A,'.jpg');
        test_images_ids=cat(1,test_images_ids,string(A));
    end
    fclose(id);
end

if shuffle==1
    test_images_ids=test_images_ids(randperm(length(test_images_ids)));
    train_images_ids=train_images_ids(randperm(length(train_images_ids)));
end

test=test_images_ids;
train=train_images_ids;
disp(train(1));
dir_path='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/';
img_dirs_train=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(train)));

img_dirs_test=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(test)));


train_data=train;



half_off=ceil(n_train/2);
vda=train_data(1:half_off);
vdc=train_data(1+n_train:n_train+half_off);
vdf=train_data(1+(n_train*2):(2*n_train)+half_off);
vdm=train_data(1+(n_train*3):(3*n_train)+half_off);


da=train_data(half_off+1:n_train);
dc=train_data((n_train*1)+half_off+1:(n_train*2));
df=train_data((n_train*2)+half_off+1:(n_train*3));
dm=train_data((n_train*3)+half_off+1:(n_train*4));



vocab_data=[vda , vdc , vdf , vdm]; 
training=  [da  , dc  , df  , dm];
vocab_data=vocab_data(:,classes);

training=training(:,classes);






test_data=test;



half_off=ceil(n_test/2);
da=test_data(1:n_test);
dc=test_data(1+n_test:n_test*2);
df=test_data(1+(n_test*2):(3*n_test));
dm=test_data(1+(n_test*3):(4*n_test));



 
testing=  [da  , dc  , df  , dm];

testing=testing(:,classes);

end



