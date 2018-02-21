% close all old figures
close all;
clc;

% run it both with and without shadow trick
photometric_stereo_single('./SphereGray5', 1, false);
close all;
photometric_stereo_single('./SphereGray25', 1, false);
close all;
photometric_stereo_single('./SphereGray5', 1, true);
close all;
photometric_stereo_single('./SphereGray25', 1, true);
close all;

% run for the monkey
photometric_stereo_single('./MonkeyGray', 1, false);
close all;
photometric_stereo_single('./MonkeyGray', 1, true);
close all;
 
% run the color models for the sphere
photometric_stereo_color('./SphereColor', false, 0.005);
close all;
photometric_stereo_color('./SphereColor', true, 0.005);
close all;

% run the color models for the monkey
photometric_stereo_color('./MonkeyColor', false, 0.005);
close all;
photometric_stereo_color('./MonkeyColor', true, 0.005);
close all;
photometric_stereo_color('./MonkeyColor', true, 0.005, 'average');
close all;
photometric_stereo_color('./MonkeyColor', true, 0.005, 'row');
close all;