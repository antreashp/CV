function [imout] = find_corners(image,H,type)
%FIND_KORNERS Summary of this function goes here
%   Detailed explanation goes here
       [h,w,d]= size(image);
    corners=zeros(size(image,1),size(image,2));
    minimum=min(min(H));
    maximum=max(max(H));
    dif=minimum-maximum;
    thresh=0.0000005;
%     figure(7);
%     imshow(H);1
    
    for i=4:h-3
        for j=4:w-3
              flag=true;
            if type=="window"

              

                for m=i-3:i+3

                    for n=j-3:j+3
                       if flag

                            if i~=m || j~=n
                                if H(i,j)<H(m,n)
                                     flag=false;

                                end
                            end
                       end
                    end
                end
                if flag 
                    corners(i,j)=255;
                end
            elseif type=="thresh"
                    if abs(H(i,j))>thresh
                        corners(i,j)=255;
                    end

                
            end

        end
    end
    imout=mat2gray(corners);

end

