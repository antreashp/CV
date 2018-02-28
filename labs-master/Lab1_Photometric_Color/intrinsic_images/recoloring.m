function [output_green, output_magenta] = recoloring(R, S)
    % size
    [h, w, d] = size(R); 
    
    % we do simple iteration over all pixels
    for i=1:h
        for j=1:w
            % if there is any value at all, we recolor it to magento
            if any(R(i,j) ~= 0) 
                R(i,j,1) = 1;
                R(i,j,2) = 0;
                R(i,j,3) = 1;
            end
        end
    end
    
    % simple elementwise multiplication
    output_magenta = im2double(R) .* S;
       
    % loop over all pixels
    for i=1:h
        for j=1:w
            % set all to green if there is any value
            if any(R(i,j) ~= 0)
                R(i,j,1) = 0;
                R(i,j,2) = 1;
                R(i,j,3) = 0;
            end
        end
    end
    
    % set the green output
    output_green = im2double(R) .* S;
end

