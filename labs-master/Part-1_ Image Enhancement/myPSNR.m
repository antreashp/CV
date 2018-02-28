function [ PSNR ] = myPSNR( orig_image, approx_image )
orig_image=double(orig_image);
approx_image=double(approx_image);
% fprintf('Not implemented\n')
[n, m ]=size(orig_image);
% disp(size(orig_image));
% disp(size(approx_image));
% summ=0;

MSE=sum(sum((orig_image-approx_image).^2))/(n*m);
% disp(summ);
% MSE=(1/(n*m))*summ;
% disp(MSE);

Imax=max(max(orig_image));
% disp(Imax);
PSNR=20*log10((Imax/sqrt(MSE)));


end

