function [model] = train_a_class(class,type)
%TRAIN_A_CLASS Summary of this function goes here
%   Detailed explanation goes here

dir_path='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/';
if class==1
    X = matfile('airplanesX.mat');
    X = X.airplanesX;
%     aX=aX(2:size(aX,1),:,:);
    Y = matfile('airplanesY.mat');
    Y = Y.airplanesY;
%     aY=aY(2:size(aY,1),:,:);
   id = matfile('airplanes_id.mat');
    id = id.airplanes_id;

elseif class==2
    X = matfile('carsX.mat');
X = X.carsX;
% aX=aX(2:size(aX,1),:,:);
Y = matfile('carsY.mat');
Y = Y.carsY;
% aY=aY(2:size(aY,1),:,:);

   id = matfile('cars_id.mat');
    id = id.cars_id;
elseif class==3
    X = matfile('facesX.mat');
    X = X.facesX;
%     aX=aX(2:size(aX,1),:,:);
    Y = matfile('facesY.mat');
    Y = Y.facesY;
% aY=aY(2:size(aY,1),:,:);

   id = matfile('faces_id.mat');
    id = id.faces_id;
elseif class==4
X = matfile('motorbikesX.mat');
X = X.motorbikesX;
% aX=aX(2:size(aX,1),:,:);
Y = matfile('motorbikesY.mat');
Y = Y.motorbikesY;
% aY=aY(2:size(aY,1),:,:);
    
   id = matfile('motorbikes_id.mat');
    id = id.motorbikes_id;
end

% size(aX)
% size(aY)



X=squeeze(X);
% aY=squeeze(aY);
if type=="matlab"
c = cvpartition(800,'KFold',40);
opts = struct('Optimizer','bayesopt','ShowPlots',true,'CVPartition',c,'AcquisitionFunctionName','expected-improvement-plus');
model = fitcsvm(X,Y,'OptimizeHyperparameters','auto','HyperparameterOptimizationOptions',opts);
else
    
 best = train(double(Y), sparse(X),[' -C  -s 0 -v 10 '  ] );
 model = train(double(Y),sparse(X), [' -s 0  -c ' num2str(best(1)) ] );
end 
end

