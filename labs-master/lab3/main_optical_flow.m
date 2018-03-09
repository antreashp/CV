
im1=imread('synth1.pgm');
im2=imread('synth2.pgm');


im=cat(3,im1,im2);

[h,w,t]=size(im);
figure (3);
region_size=15;

[x,y] = meshgrid(region_size:region_size:h,region_size:region_size:w);
 Gz=im(:,:,1)-im(:,:,2);
 
while true
for frame=1:t
    velocities=find_Ab(im(:,:,frame),Gz,"blah");
    imshow(im(:,:,frame));
    hold on
    quiver(x,y,velocities(:,:,1),velocities(:,:,2));

    hold off
    pause(1);
end
end



