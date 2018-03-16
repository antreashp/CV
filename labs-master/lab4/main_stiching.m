% setup vlfeat and load the left and right image
run('vlfeat-0.9.21/toolbox/vl_setup');
im1 = imread('right.jpg');%rgb2gray(imread('left.jpg'));%imread('boat1.pgm')
im2 = imread('left.jpg');%rgb2gray(imread('right.jpg'));

% convert to grayscale
if length(size(im1)) ~= 2
    im1 = rgb2gray(im1);
    im2 = rgb2gray(im2);  
end

% convert to single
im1 = im2single(im1);
im2 = im2single(im2);

% match and use ransac
[fa,fb,matches] = keypoint_matching(im1, im2);
[M, T, ~] = ransac(fa, fb, matches, 15);

% stitch them together
[shiftedIm, shifted_w, shifted_h, shift] = stitch(M, T, im1, im2);

% for i=2:4:shifted_h-1
%     for j=2:4:shifted_w-1
%         neighbours = [shiftedIm(i-1,j-1:j+1) shiftedIm(i+1,j-1:j+1) shiftedIm(i, j-1) shiftedIm(i, j+1)];
%         shiftedIm(i, j) = mean(neighbours);
%     end
% end

figure (1);
imshowpair(shiftedIm, im2, 'montage')

P = zeros(3, 3);
P(1:2, 1:2) = M';
P(3, 3) = 1;  

transformed = maketform('affine', P);
matlab_tr_img = imtransform(im1, transformed);

figure(2);
imshowpair(matlab_tr_img,im2 , 'montage')
title('Using maketform, imtransform');
figure(10);
imshow(matlab_tr_img);
figure(11);
imshow(shiftedIm);

figure(3);
subplot(1, 3, 1);
imshow(shiftedIm);

im4 = zeros(shifted_h, shifted_w);
[img2_h, img2_w] = size(im2);

top_pos = shift(2) + 1;
bottom_pos = shift(2) + img2_h;
left_pos = shift(1) + 1;
right_pos = shift(1)+ img2_w;

im4(top_pos:bottom_pos,left_pos:right_pos) = im2;

subplot(1, 3, 2);
imshow(im4);

shiftedIm(top_pos:bottom_pos, left_pos:right_pos) = im2;
 
subplot(1, 3, 3);
imshow(shiftedIm);
figure(4);
imshow(shiftedIm);
