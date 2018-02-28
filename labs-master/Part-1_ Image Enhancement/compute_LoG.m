function imOut = compute_LoG(image, LOG_type)

    switch LOG_type
        case 1
            %method 1
    %         fprintf('Not implemented\n')
            smoothed=denoise(image,"gaussian2D",0.5,5,5);
            h=fspecial('log',5,0.5);
            imOut=imfilter(smoothed,h);

        case 2
            %method 2
            h=fspecial('log',5,0.5);
            imOut=imfilter(image,h);

        case 3
            %method 3
            h1=fspecial('log',5,0.5);
            h2=fspecial('log',5,2);
            im1=imfilter(image,h1);
            im2=imfilter(image,h2);
            imOut=im1-im2;

    end
end

