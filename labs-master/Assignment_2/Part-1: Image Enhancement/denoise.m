function [ imOut ] = denoise(image, kernel_type, varargin)

switch kernel_type
    case 'box'
        % use the imboxfilt, and allow its single parameter
        if isempty(varargin)
            imOut = imboxfilt(image);
        else
            imOut = imboxfilt(image, varargin{1});
        end
    case 'median'
        % use the medfilt2 function, possibly with argument
        if isempty(varargin)
            imOut = medfilt2(image);
        else
            imOut = medfilt2(image, varargin{1});
        end
    case 'gaussian'
        % now we use our own function, and we actually use the 1D function
        % instead of the 2D bacuse it simply is faster.
        kernel = gauss1D(varargin{1}, varargin{2});
        
        % call conv2 with the kernel in the x-direction and subsequently in
        % y direction
        imOut = conv2(conv2(image, kernel, 'same'), kernel.', 'same');
end
end
