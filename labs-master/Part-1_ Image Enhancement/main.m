im=imread('image1.jpg');

%part 1

% im1d=denoise(imread('image1.jpg'),"gaussian1D",2,3);
% figure(1);
% imshow(im);
% figure(2);
% imshow(im1d);
% 
% 
% im2d=denoise(imread('image1.jpg'),"gaussian2D",2,3,3);
% 
% figure(3);
% imshow(im2d);

%% 


%part 2


gauss_appr_im=imread('image1_gaussian.jpg');
gauss_psnr=myPSNR(im,gauss_appr_im);

disp("gauusian noise psnr in db");
disp(gauss_psnr);


sandp_appr_im=imread('image1_saltpepper.jpg');
sandp_psnr=myPSNR(im,sandp_appr_im);
disp("salt and pepper noise psnr in db");
disp(sandp_psnr);

%% part 3
% im=imread('image1_saltpepper.jpg');

sandpepper_box_3=denoise(imread('image1_saltpepper.jpg'),"box",3);
% figure(1);
% imshow(im);
% figure(2);
% subplot(2,3,1);
% imshow(sandpepper_box_3);


sandpepper_box_5=denoise(imread('image1_saltpepper.jpg'),"box",5);

% subplot(2,3,2);
% imshow(sandpepper_box_5);


sandpepper_box_7=denoise(imread('image1_saltpepper.jpg'),"box",7);

% subplot(2,3,3);
% imshow(sandpepper_box_7);

sandpepper_median_3=denoise(imread('image1_saltpepper.jpg'),"median",3,3);

% subplot(2,3,4);
% imshow(sandpepper_median_3);


sandpepper_median_5=denoise(imread('image1_saltpepper.jpg'),"median",5,5);
% subplot(2,3,5);
% imshow(sandpepper_median_5);


sandpepper_median_7=denoise(imread('image1_saltpepper.jpg'),"median",7,7);
% 
% subplot(2,3,6);
% imshow(sandpepper_median_7);



% im=imread('image1_gaussian.jpg');

gauss_box_3=denoise(imread('image1_gaussian.jpg'),"box",3);
% figure(3);
% imshow(im);
% figure(4);
% subplot(2,3,1);
% imshow(gauss_box_3);


gauss_box_5=denoise(imread('image1_gaussian.jpg'),"box",5);
% 
% subplot(2,3,2);
% imshow(gauss_box_5);


gauss_box_7=denoise(imread('image1_gaussian.jpg'),"box",7);
% 
% subplot(2,3,3);
% imshow(gauss_box_7);

gauss_median_3=denoise(imread('image1_gaussian.jpg'),"median",3,3);
% 
% subplot(2,3,4);
% imshow(gauss_box_3);


gauss_median_5=denoise(imread('image1_gaussian.jpg'),"median",5,5);
% subplot(2,3,5);
% imshow(gauss_median_5);


gauss_median_7=denoise(imread('image1_gaussian.jpg'),"median",7,7);
% 
% subplot(2,3,6);
% imshow(gauss_median_7);

% %% question 7.2

im=imread('image1.jpg');

sandpepper_box_3_psnr=myPSNR(im,sandpepper_box_3);
sandpepper_box_5_psnr=myPSNR(im,sandpepper_box_5);
sandpepper_box_7_psnr=myPSNR(im,sandpepper_box_7);
sandpepper_median_3_psnr=myPSNR(im,sandpepper_median_3);
sandpepper_median_5_psnr=myPSNR(im,sandpepper_median_5);
sandpepper_median_7_psnr=myPSNR(im,sandpepper_median_7);
gauss_box_3_psnr=myPSNR(im,gauss_box_3);
gauss_box_5_psnr=myPSNR(im,gauss_box_5);
gauss_box_7_psnr=myPSNR(im,gauss_box_7);
gauss_median_3_psnr=myPSNR(im,gauss_median_3);
gauss_median_5_psnr=myPSNR(im,gauss_median_5);
gauss_median_7_psnr=myPSNR(im,gauss_median_7);


tbl=table(["salt & pepper";"salt & pepper";"salt & pepper";"salt & pepper";"salt & pepper";"salt & pepper";"gaussian";"gaussian";"gaussian";"gaussian";"gaussian";"gaussian"],["3x3";"5x5";"7x7";"3x3";"5x5";"7x7";"3x3";"5x5";"7x7";"3x3";"5x5";"7x7"],["box";"box";"box";"median";"median";"median";"box";"box";"box";"median";"median";"median"],[sandpepper_box_3_psnr;sandpepper_box_5_psnr;sandpepper_box_7_psnr;sandpepper_median_3_psnr;sandpepper_median_5_psnr;sandpepper_median_7_psnr;gauss_box_3_psnr;gauss_box_5_psnr;gauss_box_7_psnr;gauss_median_3_psnr;gauss_median_5_psnr;gauss_median_7_psnr]);
tbl.Properties.VariableNames={'Noise' ,'Ksize', 'Ktype', 'PSNR'};

disp(tbl);
meh=myPSNR(im,imread('image1_saltpepper.jpg'));
disp(meh);
%% question 7.4
% im=imread('image1.jpg');
% min=0;
% for k =1:3
%     for i=3:30
%         for j=3:30
%             if ((mod(i,2)==1) & (mod(j,2)==1))
%                 if k==1
%                     temp=denoise(imread('image1_gaussian.jpg'),"gaussian2D",0.5,i,j);
%                 elseif k==2
%                     temp=denoise(imread('image1_gaussian.jpg'),"gaussian2D",1,i,j);
%                 
%                 else
%                     temp=denoise(imread('image1_gaussian.jpg'),"gaussian2D",2,i,j);
%                 
%                 end
%                 tempscore=myPSNR(im,temp);
%                 if tempscore>min
%                     min=tempscore;
%                     min_idx=[i,j];
%                     min_image=temp;
%                 end
%             end
%         end
%     end
% end
% disp(min);
% disp(min_idx);
% 
im=imread('image1.jpg');

  temp=denoise(imread('image1_gaussian.jpg'),"gaussian2D",1,3,3);
      tempscore=myPSNR(im,temp);
      disp (tempscore);
% figure(1);
% imshow(temp);
% figure(2);
% imshow(im);

