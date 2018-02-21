function [ albedo, normal ] = estimate_alb_nrm( image_stack, scriptV, shadow_trick)
%COMPUTE_SURFACE_GRADIENT compute the gradient of the surface
%   image_stack : the images of the desired surface stacked up on the 3rd
%   dimension
%   scriptV : matrix V (in the algorithm) of source and camera information
%   shadow_trick: (true/false) whether or not to use shadow trick in solving
%   	linear equations
%   albedo : the surface albedo
%   normal : the surface normal
[h, w, d] = size(image_stack);
if nargin == 2
    shadow_trick = false;
end

% create arrays for 
%   albedo (1 channel)
%   normal (3 channels)
albedo = zeros(h, w, 1);
normal = zeros(h, w, 3);

% =========================================================================
% YOUR CODE GOES HERE

% for each point in the image array
for x = 1:h
    for y = 1:w
        % stack image values into a vector i
        i = reshape(image_stack(x, y, :), [], 1);
        
        % construct the diagonal matrix scriptI
        scriptI = diag(i); 
        
        % we want to solve Ag = B
        % for the shadow trick, A = IV and B = Ii,
        % otherwise A = V and B = i
        if shadow_trick
            % we can stop if the rank is too small, it will never have a
            % proper result then
            if all(i == 0)
                continue
            end
            
            g = (scriptI * scriptV) \ (scriptI * i);
        else
            g = scriptV \ i;
        end
            
        % albedo at this point is |g|
        albedo(x,y) = norm(g);
            
        % normal at this point is g / |g|
        normal(x,y,:) = g / albedo(x,y);
    end
end
% =========================================================================

end



