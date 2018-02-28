function [Gx, Gy, im_magnitude,im_direction] = compute_gradient(image)
% fprintf('Not implemented\n')
image=im2double(image);
Gx=imfilter(image,[1,0,-1;2,0,-2;1,0,-1]);
Gy=imfilter(image,[1,2,1;0,0,0;-1,-2,-1]);
disp(Gx);
disp(Gy);

im_magnitude=sqrt(Gx.^2 + Gy.^2);



im_direction=atan(Gy./Gx);



end

