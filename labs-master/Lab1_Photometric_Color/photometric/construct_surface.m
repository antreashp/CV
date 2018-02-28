function [ height_map ] = construct_surface( p, q, path_type )
%CONSTRUCT_SURFACE construct the surface function represented as height_map
%   p : measures value of df / dx
%   q : measures value of df / dy
%   path_type: type of path to construct height_map, either 'column',
%   'row', or 'average'
%   height_map: the reconstructed surface

if nargin == 2
    path_type = 'average';
end

[h, w] = size(p);
height_map = zeros(h, w);

switch path_type
    case 'column'
        % =================================================================
        % YOUR CODE GOES HERE
        % top left corner of height_map is zero
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
        % =================================================================
               
    case 'row'
        % =================================================================
        % YOUR CODE GOES HERE
        % top left corner of height_map is zero
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

        % =================================================================
          
    case 'average'
        
        % =================================================================
        % YOUR CODE GOES HERE
        height_mapc = zeros(h, w);
        height_mapr = zeros(h, w);


        for x= 2:h
            height_mapc(x,1)=height_mapc(x-1,1)+q(x,1);
        end

        for x=1:h
            for y=2:w
                height_mapc(x,y)=height_mapc(x,y-1)+p(x,y);     
            end
        end
           
        
        
        
        
        for y= 2:w
            height_mapr(1,y)=height_mapr(1,y-1)+p(1,y);
        end
        
        
       
          for y=1:w
       for x=2:h
          
                height_mapr(x,y)=height_mapr(x-1,y)+q(x,y);
            end
            
        end

        
        
        
        
        
        

        for x=1:h
            for y=1:w
                height_map(x,y)=(height_mapr(x,y)+height_mapc(x,y))/2;%-height_maprr(x,y)-height_mapcr(x,y) )/4;
            end
        end

        % =================================================================
end


end

