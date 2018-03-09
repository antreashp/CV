
%pingpong
im=imread('0000.jpeg');
[H,Gx,Gy]=harris_corner_detector(im);

plotHarris(im,H,Gx,Gy);



%person_toy
im=imread('00000001.jpg');
[H,Gx,Gy]=harris_corner_detector(im);

plotHarris(im,H,Gx,Gy);




%person_toy rotated
angle=72;
imrotated = imrotate(im,angle);


[H,Gx,Gy]=harris_corner_detector(imrotated);

plotHarris(imrotated,H,Gx,Gy);






