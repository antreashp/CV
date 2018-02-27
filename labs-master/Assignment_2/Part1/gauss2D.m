function G = gauss2D(sigma, kernel_size)
    %% solution
    % create the 1d kernel
    kernel = gauss1D(sigma, kernel_size);
    
    % make the 2d kernel, which is simply the multiplication
    % the transposed kernel with itself
    G = kernel.' * kernel;
end
