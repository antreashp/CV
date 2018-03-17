function [test_a,test_c,test_f,test_m] = load_data(classes)
%LOAD_DATA Summary of this function goes here
%   Detailed explanation goes here

aXf = matfile('Test_airplanesX.mat');
aX = aXf.airplanesX;
aX=aX(2:size(aX,1),:,:);

aYf = matfile('Test_airplanesY.mat');
aY = aYf.airplanesY;
aY=aY(2:size(aY,1),:,:);



cXf = matfile('Test_carsX.mat');
cX = cXf.carsX;
cX=cX(2:size(cX,1),:,:);

cYf = matfile('Test_carsY.mat');
cY = cYf.carsY;
cY=cY(2:size(cY,1),:,:);




fXf = matfile('Test_facesX.mat');
fX = fXf.facesX;
fX=fX(2:size(fX,1),:,:);

fYf = matfile('Test_facesY.mat');
fY = fYf.facesY;
fY=fY(2:size(fY,1),:,:);




mXf = matfile('Test_motorbikesX.mat');
mX = mXf.motorbikesX;
mX=mX(2:size(mX,1),:,:);

mYf = matfile('Test_motorbikesY.mat');
mY = mYf.motorbikesY;
mY=mY(2:size(mY,1),:,:);

test_a={aX,aY};
test_c={cX,cY};
test_f={fX,fY};
test_m={mX,mY};

% test_x=test_x(classes);
% 
% test_y=test_y(classes);

end

