function [output_image] = rgb2grays(input_image,type)
    % converts an RGB into grayscale by using 4 different methods
    output = zeros(size(input_image, 1), size(input_image, 2));
    [h , w , d]=size(input_image);

    if type == "lightness"
        % ligtness method
        for i=1:h
            for j= 1:w
                output(i,j) = (max([input_image(i,j,2) input_image(i,j,1) input_image(i,j,3)]) + min([input_image(i,j,2) input_image(i,j,1) input_image(i,j,3)])) / 2;
            end
        end
    elseif type == "average"
        % average method
        for i=1:h
            for j= 1:w
                output(i,j) = (input_image(i,j,2) + input_image(i,j,1) + input_image(i,j,3)) / 3;
            end
        end
    elseif type == "luminosity"
        % luminosity method
        for i=1:h
            for j=1:w
                output(i,j) = (0.72 * input_image(i,j,2) + 0.21 * input_image(i,j,1) + 0.07 * input_image(i,j,3));
            end
        end
    elseif type == "MATLAB"
        % built-in MATLAB function 
        output = rgb2gray(input_image);
    end

    output_image = output;

end

