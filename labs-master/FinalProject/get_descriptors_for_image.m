function [da] = get_descriptors_for_image(img,colorspaces,type,stepOrSIFTsamples)
%GET_DESCRIPTORS_FOR_IMAGE Summary of this function goes here
%   Detailed explanation goes here

%[rgb , opponent , hsv , xyz , hsi]
    da=[];
%     length(size(img))
    f_all=[];
    if length(size(img))>2
    for colorspace=1:size(colorspaces,2)

        if colorspaces(colorspace)==1 
            R  = img(:,:,1);
            G  = img(:,:,2);
            B  = img(:,:,3);
            [f1,d1]=sift(R,type,stepOrSIFTsamples);
%             d1=double(d);
          
%             da=cat(2,da,d');
            [f2,d2]=sift(G,type,stepOrSIFTsamples);
%             d2=double(d);
       
%             da=cat(2,da,d');
            [f3,d3]=sift(B,type,stepOrSIFTsamples);
%             d3=double(d);
            f_all=cat(2,f_all,f1);
            
            f_all=cat(2,f_all,f2);
            f_all=cat(2,f_all,f3);
%             d=double(d);
%        
%             da=cat(2,da,d');
        end

        if colorspaces(colorspace)==2 
            R  = img(:,:,1);
            G  = img(:,:,2);
            B  = img(:,:,3);
            %convert to opponent space
            O1 = (R-G)./sqrt(2);
            O2 = (R+G-2*B)./sqrt(6);
            O3 = (R+G+B)./sqrt(3);
            [f1,d1]=sift(O1,type,stepOrSIFTsamples);
%             d1=double(d);
          
%             da=cat(2,da,d');
            [f2,d2]=sift(O2,type,stepOrSIFTsamples);
%             d2=double(d);
       
%             da=cat(2,da,d');
            [f3,d3]=sift(O3,type,stepOrSIFTsamples);
%             d3=double(d);
            f_all=cat(2,f_all,f1);
            
            f_all=cat(2,f_all,f2);
            f_all=cat(2,f_all,f3);
            
        end
        if colorspaces(colorspace)==3 
            img=rgb2hsv(img);
            R  = img(:,:,1);
            G  = img(:,:,2);
            B  = img(:,:,3);
            %convert to opponent space
          
                       [f1,d1]=sift(R,type,stepOrSIFTsamples);
%             d1=double(d);
          
%             da=cat(2,da,d');
            [f2,d2]=sift(G,type,stepOrSIFTsamples);
%             d2=double(d);
       
%             da=cat(2,da,d');
            [f3,d3]=sift(B,type,stepOrSIFTsamples);
%             d3=double(d);
            f_all=cat(2,f_all,f1);
            
            f_all=cat(2,f_all,f2);
            f_all=cat(2,f_all,f3);
        end
        if colorspaces(colorspace)==4
            img=rgb2xyz(img);
            R  = img(:,:,1);
            G  = img(:,:,2);
            B  = img(:,:,3);
            %convert to opponent space
          
            [f1,d1]=sift(R,type,stepOrSIFTsamples);
%             d1=double(d);
          
%             da=cat(2,da,d');
            [f2,d2]=sift(G,type,stepOrSIFTsamples);
%             d2=double(d);
       
%             da=cat(2,da,d');
            [f3,d3]=sift(B,type,stepOrSIFTsamples);
%             d3=double(d);
            f_all=cat(2,f_all,f1);
            
            f_all=cat(2,f_all,f2);
            f_all=cat(2,f_all,f3);
        end
        
        if colorspaces(colorspace)==5
            img=rgb2gray(img);
           
             [f,d]=sift(img,type,stepOrSIFTsamples);
            d=double(d);
          
            da=cat(2,da,d');
            

        end
    end
    else
            
            [f,d]=sift(img,type,stepOrSIFTsamples);
            d=double(d);
           f_all=cat(2,f_all,f);
   
%             da=cat(2,da,d');
        
    end
    
            [Ix, Iy] = vl_grad(img) ;
            Ix=double(Ix);
            Iy=double(Iy);
            img=single(img);
            mod      = sqrt(Ix.^2 + Iy.^2) ;
            ang      = atan2(Iy,Ix) ;
            grd      = shiftdim(cat(3,mod,ang),2) ;
            grd      = single(grd) ;
            d        = vl_siftdescriptor(grd, f_all) ;

            
            
            
            da=cat(2,da,d');
    
end
