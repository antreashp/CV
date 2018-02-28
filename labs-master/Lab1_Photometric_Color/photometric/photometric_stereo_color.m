function [albedo, normals, p, q, SE, height_map] = photometric_stereo_color (image_dir, shadow_trick, threshold, combine_shadow_trick)
    % some default arguments
    if nargin < 2
        shadow_trick = false;
    end
    if nargin < 3
        threshold = 0.005;
    end
    if nargin < 4
        combine_shadow_trick = shadow_trick;
    end
    
    %% we run the photometric stereo single version for all channels
    % separately
    [albedoR, normalR, pR, qR, SER, height_mapR] = photometric_stereo_single(image_dir, 1);
    [albedoG, normalG, pG, qG, SEG, height_mapG] = photometric_stereo_single(image_dir, 2);
    [albedoB, normalB, pB, qB, SEB, height_mapB] = photometric_stereo_single(image_dir, 3);
    [h, w, d] = size(normalR);
    
    
    %% Display
    % show results
    if ~all(isnan(albedoR))
        disp('Red channel')
        show_results(albedoR, normalR, SER);
        show_model(albedoR, height_mapR);
    end
    if ~all(isnan(albedoG))
        disp('Green channel')
        show_results(albedoG, normalG, SEG);
        show_model(albedoG, height_mapG);
    end
    if ~all(isnan(albedoB))
        disp('Blue channel')
        show_results(albedoB, normalB, SEB);
        show_model(albedoB, height_mapB);
    end

    %% combination code
    
    % combine albedos. apparantly, the show_model doesn't want to display
    % color data, so we'll just convert it to black and white for now.
    disp('Combined channels')
    albedoR(isnan(albedoR)) = 0;
    albedoG(isnan(albedoG)) = 0;
    albedoB(isnan(albedoB)) = 0;
    
    albedos = cat(3, albedoR, albedoG, albedoB) ;
    
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
    height_map = construct_surface(p, q);
    
    % show the results
    show_results(albedos, normed, SE);
    show_model(albedos, height_map);
end