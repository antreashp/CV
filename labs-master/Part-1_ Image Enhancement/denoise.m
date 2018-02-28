function [ imOut ] = denoise( image, kernel_type, varargin)
    imOut=zeros(size(image));
    % disp("meh");
    % disp(image(100,250));
    %   disp(size(varargin));
    %   varargin=squeeze(varargin);
    %   disp(varargin(1));
    image=im2double(image);
    switch kernel_type
        case 'box'
    %         fprintf('Not implemented\n')
            imOut=imboxfilt(image,varargin{1});

        case 'median'
    %         fprintf('Not implemented\n')
            imOut=medfilt2(image,[varargin{1},varargin{2}]);
        case 'gaussian1D'
                %varargin [sigma , kernel_size]

                sigma=varargin{1};
    %   
                kernel1D_size=varargin{2};
    % %             kernel1D_size=kernel1D_size(1);
    %             disp(sigma);
                G=gauss1D(sigma,kernel1D_size);
                [h,w]=size(image);
                imOut=imfilter(image,G);


            case 'gaussian2D'
                 %varargin [sigma , kernel_sizex, kernel_sizey ]
                 sigma=varargin{1};
                 x=varargin{2};
                 y=varargin{3};

                 kernel2D_size=[x,y];



                 G=gauss2D(sigma,kernel2D_size);

                 imOut=imfilter(image,G);

    end

        
end
