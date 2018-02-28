function [Gx, Gy, im_magnitude, im_direction] = compute_gradient(image)
    % generate the sobel matrix
    sobel = [1; 2; 1] * [1, 0, -1];
    
    % calculate Gx and Gy
    Gx = imfilter(image, sobel);
    Gy = imfilter(image, sobel.');
    
    % calculate the magnitude
    im_magnitude = sqrt(Gx.^2 + Gy.^2);
    im_direction = atan(Gy ./ Gx);
end

