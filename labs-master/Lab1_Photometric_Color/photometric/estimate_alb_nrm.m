function [ albedo, normal ] = estimate_alb_nrm( image_stack, scriptV, shadow_trick)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal

% image_stack=image_stack;
% disp(image_stack);
[h, w, ~] = size(image_stack);
if nargin == 2
    shadow_trick = false;
end
% disp(image_stack(250,250,2,:));
% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 1);
normal = zeros(h, w, 3);
% disp(scriptV);
% scriptV=squeeze(scriptV);
% disp(scriptV);
% disp(scriptV.');
% =========================================================================
% YOUR CODE GOES HERE
% for each point in the image array
%   stack image values into a vector i
%   construct the diagonal matrix scriptI
%   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
%   albedo at this point is |g|
%   normal at this point is g / |g|
% imshow(image_stack(:,:,3));

for i = 1:h
    
    for j = 1:w

        pointVector= reshape(image_stack(i, j, :), [] ,1);  %reshape(image_stack(i,j,:),size(image_stack,3),1);

        SI=diag(pointVector);%.*eye(5,5);

        if sum(SI*pointVector)>0
            g=[scriptV]\[pointVector];
            meh=norm(g);
            albedo(i,j)=meh;
 
            normal(i,j,:)=g/meh;

        end
    end
end


% =========================================================================

end



