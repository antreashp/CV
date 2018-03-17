function [model] = train_a_class(class)
%TRAIN_A_CLASS Summary of this function goes here
%   Detailed explanation goes here

dir_path='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/';
if class==1
    aX = matfile('airplanesX.mat');
aX = aX.airplanesX;
aX=aX(2:size(aX,1),:,:);
aY = matfile('airplanesY.mat');
aY = aY.airplanesY;
elseif class==2
    aX = matfile('carsX.mat');
aX = aX.carsX;
aX=aX(2:size(aX,1),:,:);
aY = matfile('carsY.mat');
aY = aY.carsY;
elseif class==3
    aX = matfile('facesX.mat');
aX = aX.facesX;
aX=aX(2:size(aX,1),:,:);
aY = matfile('facesY.mat');
aY = aY.facesY;
elseif class==4
   aX = matfile('motorbikesX.mat');
aX = aX.motorbikesX;
aX=aX(2:size(aX,1),:,:);
aY = matfile('motorbikesY.mat');
aY = aY.motorbikesY;
    
end

rp=randperm(size(aX,1));
aX=aX(rp,:,:);
aY=aY(rp,:,:);


aX_train=squeeze(aX(1:size(aX,1)/2,:,:));
aX_validate=squeeze(aX(1+size(aX,1)/2:size(aX,1),:,:));


aY_train=aY(1:size(aY,1)/2,:,:);
aY_validate=aY(1+size(aY,1)/2:size(aY,1),:,:);

model = fitcsvm(aX_train,aY_train,'KernelFunction','rbf','Standardize',true);
end

