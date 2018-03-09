function meh = plotHarris(im,H,Gx,Gy)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[x,y]=find(H);
figure();
subplot(1,3,1);
  imshow(im);
    hold on
    
    plot(y,x,'yo');
% %      plot(flow,'DecimationFactor',[5 5],'ScaleFactor',10)
    hold off
% figure(2);
subplot(1,3,2);
imshow(Gx)

subplot(1,3,3);

imshow(Gy)

end

