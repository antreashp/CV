% close all old figures
close all;
clear all;
clc;

% run it both with and without shadow trick
% photometric_stereo_single('./SphereGray5', 1, false, 0.005, true);
% photometric_stereo_single('./SphereGray25', 1, false, 0.005, true);
% photometric_stereo_single('./SphereGray5', 1, true, 0.005, true);
% photometric_stereo_single('./SphereGray25', 1, true, 0.005, true);

% run for the monkey
% photometric_stereo_single('./MonkeyGray', 1, false, 0.005, true);
% photometric_stereo_single('./MonkeyGray', 1, true, 0.005, true);
% 
% % run the color models for the sphere
% photometric_stereo_color('./SphereColor', false, 0.005);
% photometric_stereo_color('./SphereColor', true, 0.005);

% run the color models for the monkey
%photometric_stereo_color('./MonkeyColor', false, 0.005);
% photometric_stereo_color('./MonkeyColor', true, 0.005);
photometric_stereo_color('./MonkeyColor', true, 0.005, true);