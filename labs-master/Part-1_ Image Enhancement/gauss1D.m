function G = gauss1D( sigma , kernel_size )
    G = zeros(1, kernel_size);
    if mod(kernel_size, 2) == 0
        error('kernel_size must be odd, otherwise the filter will not have a center to convolve on')
    end
    offset=round((kernel_size/2));
%     disp(offset);
    minus_offset=round(-offset+1);
    %% solution
    for i=minus_offset:offset-1
        G(1,i+offset)=(1/(sigma*sqrt(2*pi)))*exp(-(i^2)/(2*(sigma^2)));
        
        
    end
    summ=sum(G);
%     disp(G);
%     disp(summ);
    for i =1:size(G,2)
        G(1,i)=G(1,i)/summ;
    end
%     disp(size(G));
      
%       disp(G);
end


