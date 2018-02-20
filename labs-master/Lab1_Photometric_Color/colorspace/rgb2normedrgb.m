function [output_image] = rgb2normedrgb(input_image)
% converts an RGB image into normalized rgb

    output=zeros(size(input_image));
    [h , w , d]=size(input_image);
    for i=1:h
        for j= 1:w
           output(i,j,1)=(input_image(i,j,1))/(input_image(i,j,1)+input_image(i,j,2)+input_image(i,j,3));
           output(i,j,2)=(input_image(i,j,2))/(input_image(i,j,1)+input_image(i,j,2)+input_image(i,j,3));
           output(i,j,3)=(input_image(i,j,3))/(input_image(i,j,1)+input_image(i,j,2)+input_image(i,j,3));
        end
        
    end
    
    output_image=output;
end

