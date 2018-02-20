function [ albedos, normals ] = albedoNormColor( image_stack, scriptV, shadow_trick,image_dir)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal
% image_dir = './MonkeyColor/';   % TODO: get the path of the script

[image_stackR, scriptV] = load_syn_images(image_dir,1);
[image_stackG, scriptV] = load_syn_images(image_dir,2);
[image_stackB, scriptV] = load_syn_images(image_dir,3);
% [h, w, n] = size(image_stack1);
image_stack=cat(4,image_stackR ,image_stackG ,image_stackB);
image_stack=permute(image_stack,[4,1,2,3]);
[~,h, w, d] = size(image_stack);
if nargin == 2
    shadow_trick = false;
end

% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)

disp(size(image_stack));
% =========================================================================
% YOUR CODE GOES HERE
% for each point in the image array
%   stack image values into a vector i
%   construct the diagonal matrix scriptI
%   solve scriptI * scriptV * g = scriptI * i to obtain g for this point
%   albedo at this point is |g|
%   normal at this point is g / |g|
% imshow(image_stack(:,:,3));
    albedos = zeros(3,h, w, 1);
    normals = zeros(3,h, w, 3);

disp(size(image_stack));
for k =1:3
    albedo = zeros(h, w, 1);
    normal = zeros(h, w, 3);

    for i = 1:h

        for j = 1:w

            pointVector= reshape(image_stack(k,i, j, :), [] ,1);  %reshape(image_stack(i,j,:),size(image_stack,3),1);

            SI=diag(pointVector);%.*eye(5,5);

            if sum(SI*pointVector)>0
                g=[scriptV]\[pointVector];
                meh=norm(g);
                albedos(k,i,j)=meh;

                normals(k,i,j,:)=g/meh;

            end
            
        end
        
    end
%     albedos(k,:,:,:)=   albedo;
%     normals(k,:,:,:)=   normals;
end
% normal=squeeze(mean(normals,1));
% albedo=squeeze(mean(albedo,1));
disp(size(squeeze(mean(normals,1))));
% =========================================================================

end



