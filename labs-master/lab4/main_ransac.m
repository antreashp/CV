run('D:/Users/Andy/Downloads/Desktop/vlfeat-0.9.21/toolbox/vl_setup');
im1=imread('boat1.pgm');%rgb2gray(imread('left.jpg'));%imread('boat1.pgm')
im2=imread('boat2.pgm');%rgb2gray(imread('right.jpg'));
if length(size(im1))==2
im1=im2single(im1);

im2=im2single(im2);
else
im1=im2single(rgb2gray(im1));

im2=im2single(rgb2gray(im2));
    
end
[fa,fb,matches]=keypoint_matching(im1,im2);

[M, T, ~] = ransac(fa, fb, matches, 3);
allxy = fa(:, matches(1, :))';
% Transform using the parameters 
callxy = [(M * allxy(:,[1 2])' + T)' allxy(:, [3 4])];

allxy = allxy(1:40:400, :);
callxy = callxy(1:40:400, :);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure (1);
plotting(allxy',callxy',im1,im2);

%%%%%%%%%%%%55




[fa,fb,matches]=keypoint_matching(im2,im1);

[M, T, ~] = ransac( fa,fb, matches, 3);

allxy = fb(:, matches(2, :))';
callxy = [(M * allxy(:,[1 2])' + T)' allxy(:, [3 4])];

allxy = allxy(1:40:400, :);
callxy = callxy(1:40:400, :);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure (2);
plotting(allxy',callxy',im1,im2);

%%%%%%%%%%%%55
