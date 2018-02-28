function [new_image] = ConvertColorSpace(input_image, colorspace,type)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Converts an RGB image into a specified color space, visualizes the 
% color channels and returns the image in its new color space.                     
%                                                        
% Colorspace options:                                    
%   opponent                                            
%   rgb -> for normalized RGB
%   hsv
%   ycbcr
%   gray
%
% P.S: Do not forget the visualization part!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meh=type;
% convert image into double precision for conversions
input_image = im2double(input_image);

if strcmp(colorspace, 'opponent')
    new_image = rgb2opponent(input_image); % fill in this function
elseif strcmp(colorspace, 'rgb')  
    new_image = rgb2normedrgb(input_image); % fill in this function
elseif strcmp(colorspace, 'hsv')   
    % use the built-in function
    new_image=rgb2hsv(input_image);
elseif strcmp(colorspace, 'ycbcr')
    % use the built-in function
    new_image=rgb2ycbcr(input_image);
elseif strcmp(colorspace, 'gray' ) & meh==1
    new_image = rgb2grays(input_image,"lightness"); % fill in this function
    elseif strcmp(colorspace, 'gray' ) & meh==2
    new_image = rgb2grays(input_image,"average"); % fill in this function
    elseif strcmp(colorspace, 'gray' ) & meh==3
    new_image = rgb2grays(input_image,"luminosity"); % fill in this function
    elseif strcmp(colorspace, 'gray' )  & meh==4
    new_image = rgb2grays(input_image,"MATLAB"); % fill in this function
elseif strcmp(colorspace, 'gray') 
% if user inputs an unknow colorspace just notify and do not plot anything
    fprintf('Error: Unknown colorspace type [%s]...\n',colorspace);
    new_image = input_image;
    return;
end

visualize(new_image); % fill in this function

end