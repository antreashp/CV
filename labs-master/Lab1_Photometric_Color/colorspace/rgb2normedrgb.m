function [output_image] = rgb2normedrgb(input_image)
    % converts an RGB image into normalized rgb
    output_image = input_image ./ sum(input_image, 3);
end

