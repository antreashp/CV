function [test] = load_data(classes)
%LOAD_DATA Summary of this function goes here
%   Detailed explanation goes here

aXf = matfile('TEST_data_x.mat');
aX = aXf.test_data_x;


aYf = matfile('TEST_data_y.mat');
aY = aYf.test_data_y;

aidf = matfile('test_data_id.mat');
aid = aidf.test_data_id;

% aX=aX(:,2:size(aX,2));


test={aX,aY,aid};
% test_x=test_x(classes);
% 
% test_y=test_y(classes);

end

