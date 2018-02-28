% load the image
im = imread('awb.jpg');

% extract the dimensions
R = squeeze(im(:,:,1));
G = squeeze(im(:,:,2));
B = squeeze(im(:,:,3));

% compute mean for R, G, B respectively
rMean = mean(mean(R));
gMean = mean(mean(G));
bMean = mean(mean(B));

% compute scalars
alpha = 128 / rMean;
beta = 128 / gMean;
gamma = 128 / bMean;

% multiply scalars with R, G, B and stack 
fixed = cat(3, alpha * R, beta * G, gamma * B);

% plot images
figure(1);
imshow(fixed);
figure(2);
imshow(im);
     