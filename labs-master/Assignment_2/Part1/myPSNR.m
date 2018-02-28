function [ PSNR ] = myPSNR(orig_image, approx_image)
    % calculate MSE
    MSE = sum(sum((orig_image - approx_image).^2)) / numel(orig_image);

    % calculate the PSNR 
    PSNR = 20 * log10(max(max(orig_image)) / (MSE^(1/2)));
end

