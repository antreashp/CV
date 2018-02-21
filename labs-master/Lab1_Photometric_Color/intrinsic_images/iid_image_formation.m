% load images and convert it to double values
image = imread('ball.png');
imR = imread('ball_reflectance.png');
imS = imread('ball_shading.png');
imR = im2double(imR);
imS = im2double(imS);

coloredImage = recolor(imR, imS);
disp(size(coloredImage));

figure(1);
imshow(coloredImage);

figure(2);
imshow(imS);

figure(3);
imshow(imR);

figure(4);
imshow(image);

[green, magenta] = recoloring(imR, imS);

figure(5);
imshow(green);

figure(6);
imshow(magenta);