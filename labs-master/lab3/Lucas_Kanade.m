function [outputArg1] = Lucas_Kanade(H,imagefiles,nfiles,prev_image,name,price)
[corx, cory]=find(H);
tempname='video';
workingDir = tempname;
mkdir(workingDir)
mkdir(workingDir,'images')
outputVideo = VideoWriter(fullfile(workingDir,name));
outputVideo.FrameRate = 24;
open(outputVideo)
for ii=2:nfiles
    currentfilename = imagefiles(ii).name;
   currentimage = imread(currentfilename);
    
   if mod(ii,price)==0
          [H,Gx,Gy]=harris_corner_detector(prev_image);
   [corx, cory]=find(H);
   end
%    prev_image=double(prev_image);
%    
%    currentimage=double(currentimage);
% disp(size(prev_image));
% disp(size(currentimage));

   Gz=rgb2gray(prev_image)-rgb2gray(currentimage);
   velocities=find_Ab(rgb2gray(currentimage),Gz,"corners",corx,cory);
   fig=figure(1);
   
   imshow(currentimage);
   hold on
   quiver(cory,corx,velocities(:,1),velocities(:,2));
   
   saveas(fig, char(strcat(string(ii)+currentfilename))); 
    currentimagev = imread(char(strcat(string(ii)+imagefiles(ii).name)));
   
   writeVideo(outputVideo,currentimagev)
    hold off
   off=zeros(size(corx,1),1);
   for i =1:length(corx)
       off(i)=10;
   end
   
   
   corx=floor(corx+(velocities(:,2).*off));
   cory=floor(cory+(velocities(:,1).*off));
   
    
   delete(char(strcat(string(ii)+currentfilename)));
   prev_image=currentimage;
   pause(0.01);  
end
close(outputVideo)



end

