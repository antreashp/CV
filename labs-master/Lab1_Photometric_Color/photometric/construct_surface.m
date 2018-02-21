function [ height_map ] = construct_surface(p, q, path_type)
    %CONSTRUCT_SURFACE construct the surface function represented as height_map
    %   p : measures value of df / dx
    %   q : measures value of df / dy
    %   path_type: type of path to construct height_map, either 'column',
    %   'row', or 'average'
    %   height_map: the reconstructed surface
    if nargin == 2
        path_type = 'column';
    end
    
    % default to zeros
    height_map = zeros(size(p));

    % check the path type
    switch path_type
        case 'column'
            height_map = column_wise(p, q);
        case 'row'
            height_map = row_wise(p, q);
        case 'average'
            height_map = column_wise(p, q) + row_wise(p, q);
        otherwise
            error('Unsupported type')
    end
end

function [height_map] = column_wise(p, q)
    % top left corner of height_map is zero
    height_map = zeros(size(p));
    [h, w] = size(p);
    height_map(1,1) = 0;
    
    % for each pixel in the left column of height_map
    for x=2:h
        % height_value = previous_height_value + corresponding_q_value
        height_map(x,1) = height_map(x-1,1) + q(x,1);
    end

    % for each row
    for x=1:h
        % for each element of the row except for leftmost
        for y=2:w
            % height_value = previous_height_value + corresp
            height_map(x,y) = height_map(x,y-1) + p(x,y);
        end
    end  
end

function [height_map] = row_wise(p, q)
    % top left corner of height_map is zero
    height_map = zeros(size(p));
    [h, w] = size(p);
    height_map(1,1) = 0;

    % for each pixel in the upper row of height map
    for y=2:w
        height_map(1,y) = height_map(1,y-1) + p(1,y);
    end

    % for each column
    for y=1:w
        % for each element in the column except the top one
        for x=2:h
            % height value is the previous height + corresp
            height_map(x,y) = height_map(x-1,y) + q(x,y);
        end
    end
end
