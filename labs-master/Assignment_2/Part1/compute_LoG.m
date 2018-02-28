function imOut = compute_LoG(image, LOG_type, varargin)
    switch LOG_type
        case 1
            %% method 1
            % smooth first
            im_smooth = imfilter(image, fspecial('gaussian', varargin{1}, varargin{2}));

            % convolve the image with the laplacian
            imOut = imfilter(im_smooth, fspecial('laplacian', varargin{2}));

        case 2
            %% method 2
            % convolve directly with the LoG kernel
            imOut = imfilter(image, fspecial('log', varargin{1}, varargin{2}));

        case 3
            %% method 3
            % convolve with the difference of gaussians at different scales
            DoG = fspecial('gaussian', varargin{1}, varargin{3}) - fspecial('gaussian', varargin{1}, varargin{2});
            imOut = imfilter(image, DoG);
    end
end