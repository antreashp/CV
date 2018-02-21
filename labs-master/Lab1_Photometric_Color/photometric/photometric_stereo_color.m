function [albedo, normals, p, q, SE, height_map] = photometric_stereo_color (image_dir, shadow_trick, threshold, surface_type, combine_shadow_trick)
    % some default arguments
    if nargin < 2
        shadow_trick = false;
    end
    if nargin < 3
        threshold = 0.005;
    end
    if nargin < 4
        surface_type = 'column';
    end
    if nargin < 5
        combine_shadow_trick = shadow_trick;
    end
    
    %% we run the photometric stereo single version for all channels
    % separately
    [albedoR, normalR, pR, qR, SER, height_mapR] = photometric_stereo_single(image_dir, 1, shadow_trick, threshold, surface_type);
    [albedoG, normalG, pG, qG, SEG, height_mapG] = photometric_stereo_single(image_dir, 2, shadow_trick, threshold, surface_type);
    [albedoB, normalB, pB, qB, SEB, height_mapB] = photometric_stereo_single(image_dir, 3, shadow_trick, threshold, surface_type);
    [h, w, d] = size(normalR);
    
    %% combination code
    
    % combine albedos. apparantly, the show_model doesn't want to display
    % color data, so we'll just convert it to black and white for now.
    disp('Combined channels')
    albedoR(isnan(albedoR)) = 0;
    albedoG(isnan(albedoG)) = 0;
    albedoB(isnan(albedoB)) = 0;
    albedos = cat(3, albedoR, albedoG, albedoB);
    
    % we need to set normals to zero as well before calculating with them
    normalR(isnan(normalR)) = 0;
    normalG(isnan(normalG)) = 0;
    normalB(isnan(normalB)) = 0;
    
    % apply shadow trick
    if combine_shadow_trick
        % naive method, breaks on zero pixels
        normed = (normalR + normalG + normalB) / 3;
    else
        % more robust against zero pixels
        normed = (normalR.*albedoR + normalG.*albedoG + normalB.*albedoB) ./ (albedoR + albedoG + albedoB);
    end
    
    % check the normed integrability
    [p, q, SE] = check_integrability(normed);
    
    % construct a surface from the combined normals
    height_map = construct_surface(p, q, surface_type);
    
    % show the results
    [~, name, ~] = fileparts(image_dir);
    show_results(albedos, normed, SE, sprintf('plots/colored-folder=%s-shadow=%d-thres=%f-surface=%s-combined_shadow=%d-results.png', name, shadow_trick, threshold, surface_type, combine_shadow_trick));
    show_model(albedos, height_map, sprintf('plots/colored-folder=%s-shadow=%d-thres=%f-surface=%s-combined_shadow=%d-model.png', name, shadow_trick, threshold, surface_type, combine_shadow_trick));
end