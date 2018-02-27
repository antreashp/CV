function G = gauss1D( sigma , kernel_size )
    %% sanity checks
    if mod(kernel_size, 2) == 0
        error('kernel_size must be odd, otherwise the filter will not have a center to convolve on')
    end
    
    %% solution
    % the edges
    edge = floor(kernel_size / 2);
    x = -edge:edge;

    % create the kernel (truncated)
    G = exp(-(x.^2 / (2 * sigma^2))) / (sigma * sqrt(2 * pi));
    
    % normalize the kernel
    G = G / sum(G);
end
