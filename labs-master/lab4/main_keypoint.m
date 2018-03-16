% setup vlfeat and load the boat image
run('vlfeat-0.9.21/toolbox/vl_setup');
im_a = imread('boat1.pgm');%rgb2gray(imread('left.jpg'));%imread('boat1.pgm')
im_b = imread('boat2.pgm');%rgb2gray(imread('right.jpg'));

% match keypoints
[fa, fb, matches] = keypoint_matching(im_a, im_b);

number_of_matches = size(matches, 2);
number_of_samples = 50;
randomS = randperm(number_of_matches, number_of_samples);
samples = matches(:,randomS);
transf_a = fa(:,samples(1,:));
transf_b = fb(:,samples(2,:));
plotting(transf_a, transf_b, im_a, im_b)