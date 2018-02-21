function [albedo, normals, p, q, SE, height_map] = photometric_stereo_single (image_dir, channel, shadow_trick, threshold, surface_type, show)
    % some default arguments
    if nargin < 2 
        channel = 1;
    end
    if nargin < 3
        shadow_trick = false;
    end
    if nargin < 4
        threshold = 0.005;
    end
    if nargin < 5
        surface_type = 'column';
    end
    if nargin < 6
        show = false;
    end
    
    %% load the images
    disp('Loading images...');
    [image_stack, scriptV] = load_syn_images(image_dir, channel);
    [~, ~, n] = size(image_stack);
    fprintf('Finish loading %d images.\n\n', n);
    
    %% compute the surface gradient from the stack of imgs and light source mat
    disp('Computing surface albedo and normal map...');
    [albedo, normals] = estimate_alb_nrm(image_stack, scriptV, shadow_trick);
    
    %% integrability check: is (dp / dy  -  dq / dx) ^ 2 small everywhere?
    disp('Integrability checking');
    [p, q, SE] = check_integrability(normals);
    SE(SE <= threshold) = NaN; 
    fprintf('Number of outliers: %d\n\n', sum(sum(SE > threshold)));
    
    %% compute the surface height
    height_map = construct_surface(p, q, surface_type);
    
    % we're done if not showing
    if ~show
        return
    end
    
    %% Display
    show_results(albedo, normals, SE);
    show_model(albedo, height_map);
end