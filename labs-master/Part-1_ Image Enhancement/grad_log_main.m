% %% question 8
% 
% im=imread('image2.jpg');
% [Gx , Gy, im_magnitude, im_direction]=compute_gradient(im);
% 
% 
% 
% figure(1);
% subplot(2,2,1);
% imshow(Gx);
% subplot(2,2,2);
% imshow(Gy);
% subplot(2,2,3);
% imshow(im_magnitude);
% subplot(2,2,4);
% imshow(im_direction);

%% question 9 kinda


im=imread('image2.jpg');
method1=compute_LoG(im,1);
method2=compute_LoG(im,2);
method3=compute_LoG(im,3);

figure(2)
subplot(1,3,1);
imshow(method1);
subplot(1,3,2);
imshow(method2);
subplot(1,3,3);
imshow(method3);
