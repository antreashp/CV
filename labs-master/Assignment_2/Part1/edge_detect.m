
%% read the image
image2 = im2double(imread('images/image2.jpg'));

%% Compute the gradient
[Gx, Gy, magnitude, direction] = compute_gradient(image2);

% calculate the LoG
LoG = cat(3, compute_LoG(image2, 1, 5, 0.5), compute_LoG(image2, 2, 5, 0.5), compute_LoG(image2, 3, 5, 1, 0.5));

%% Plots
% close old figures
close all;

% plot the sobel one
figure;
subplot(2, 2, 1); imshow(Gx); title('Sobel Gx');
subplot(2, 2, 2); imshow(Gy); title('Sobel Gy');
subplot(2, 2, 3); imshow(magnitude); title('Sobel magnitude');
subplot(2, 2, 4); imshow(direction); title('Sobel direction');
saveas(gca, 'plots/sobel.png');

% and all different methods
figure;
subplot(1, 3, 1); imshow(LoG(:,:,1)); title('Method 1');
subplot(1, 3, 2); imshow(LoG(:,:,2)); title('Method 2');
subplot(1, 3, 3); imshow(LoG(:,:,3)); title('Method 3');
saveas(gca, 'plots/methods-log.png');