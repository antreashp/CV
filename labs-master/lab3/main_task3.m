% price=10000 %how expensive the algorith is (0 is the most expensive number of images is the minimum price)
% %read images ping pong
% imagefiles = dir('D:\Users\Andy\Downloads\Desktop\CV\labs-master\lab3\pingpong\*.jpeg');      
% nfiles = length(imagefiles);
% disp(nfiles);
% prev_image=imread(imagefiles(1).name);
% 
% [h,w,d]=size(prev_image);
% [H,Gx,Gy]=harris_corner_detector(prev_image);
% Lucas_Kanade(H,imagefiles,nfiles,prev_image,'pingpong.avi',price);
%    
% 
% 
% %read images person toy
% imagefiles = dir('D:\Users\Andy\Downloads\Desktop\CV\labs-master\lab3\person_toy\*.jpg');      
% nfiles = length(imagefiles);
% disp(nfiles);
% prev_image=imread(imagefiles(1).name);
% 
% [h,w,d]=size(prev_image);
% [H,Gx,Gy]=harris_corner_detector(prev_image);
% Lucas_Kanade(H,imagefiles,nfiles,prev_image,'person_toy.avi',price);
%    


price=1 %how expensive the algorith is (0 is the most expensive number of images is the minimum price)
%read images person_toy with feature detecting in each frame.
imagefiles = dir('D:\Users\Andy\Downloads\Desktop\CV\labs-master\lab3\person_toy\*.jpg');      
nfiles = length(imagefiles);
disp(nfiles);
prev_image=imread(imagefiles(1).name);

[h,w,d]=size(prev_image);
[H,Gx,Gy]=harris_corner_detector(prev_image);
Lucas_Kanade(H,imagefiles,nfiles,prev_image,'person_toy_expensive.avi',price);
   

