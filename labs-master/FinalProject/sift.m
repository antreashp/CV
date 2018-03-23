function [fa,da] = sift(img,type,stepOrSIFTsamples)
%SIFT Summary of this function goes here


if type=="dsift"
ia=im2single(img);
binSize = 8 ;
magnif = 3 ;
ia = vl_imsmooth(ia, sqrt((binSize/magnif)^2 - .25)) ;
 [fa,da] = vl_dsift(ia,'step',stepOrSIFTsamples,'size',binSize);
else
    ia=im2single(img);
    [fa,da] = vl_sift(ia);
%     if stepOrSIFTsamples<size(da,2)
%         s = RandStream('mlfg6331_64'); 
%         da = datasample(s,da',stepOrSIFTsamples,'Replace',false);
%         da=da';
%     end
end



end

