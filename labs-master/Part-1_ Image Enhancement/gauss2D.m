function G = gauss2D( sigma , kernel_size )

    G=gauss1D(sigma,kernel_size(1)).'*gauss1D(sigma,kernel_size(2));

end
