im=imread('awb.jpg');


% 
% [h,w,d]=size(im);
% 
% 
% 
%     grays=[0.5 0.5 0.5 ];
%     illum=illumgray(im,25);
%     newim=chromadapt(im,illum);
% 
%      figure(1);
%      imshow(newim);
%      figure(2);
%      imshow(im);
%      
%      
%      


R=squeeze(im(:,:,1));

G=squeeze(im(:,:,2));
B=squeeze(im(:,:,3));
% compute mean for R, G, B respectively
rMean = mean(mean(R));
gMean = mean(mean(G));
bMean = mean(mean(B));

% compute mean of means of R, G, B
avg = mean([rMean,gMean,bMean]);

% compute scalars
alpha = avg/rMean;
beta = avg/gMean;
gamma = avg/bMean;

% multiply scalars with R, G, B and stack 
newIm = cat(3, alpha*R, beta*G, gamma* B);

     figure(1);
     imshow(newIm);
     figure(2);
     imshow(im);
     