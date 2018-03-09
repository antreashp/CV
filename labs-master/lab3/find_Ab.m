function [velocities] = find_Ab(im,Gz,varargin)
%FIND_AB Summary of this function goes here
%   Detailed explanation goes here
    region_size=15;
    
    [h,w,t]=size(im);
    velocities=zeros(floor(size(im,1)/region_size),floor(size(im,2)/region_size),2);
    [Gx,Gy]=imgradientxy(im);
    flag=varargin{1};
    off=floor(region_size/2);
%     disp(off);
    if flag=="corners"
        corx=varargin{2};
        cory=varargin{3};
        velocities=zeros(length(corx),2);
        region_size=25;
        off=floor(region_size/2);
        for k=1:length(corx)
%             disp(length(corx));
            i=corx(k);
            j=cory(k);
            if i>off && i<h-off && j>off && j<w-off
                A=zeros(1,2);
                b=zeros(1,1);

                A=[Gx(i-off:i+off,j-off:j+off),Gy(i-off:i+off,j-off:j+off)];%cat(1,A,[Gx(m,n),Gy(m,n)]);
                b=[Gz(i-off:i+off,j-off:j+off)];%cat(1,b,[Gz(m,n)]);
                A=reshape(A,[region_size^2,2]);   
                b=reshape(b,[region_size^2,1]);
                b=double(b);
                velocities(k,:)=mldivide([(A.'*A)],[A.'*b]);
            end
        end
    else
            
        for i=1:floor(h/region_size)
            for j=1:floor(h/region_size)
                A=zeros(1,2);
                b=zeros(1,1);

                A=[Gx(i*region_size-7:i*region_size+7,j*region_size-7:j*region_size+7),Gy(i*region_size-7:i*region_size+7,j*region_size-7:j*region_size+7)];%cat(1,A,[Gx(m,n),Gy(m,n)]);
                b=[Gz(i*region_size-7:i*region_size+7,j*region_size-7:j*region_size+7)];%cat(1,b,[Gz(m,n)]);
                A=reshape(A,[region_size^2,2]);   
                b=reshape(b,[region_size^2,1]);
           
            b=double(b);
            velocities(i,j,:)=mldivide([(A.'*A)],[A.'*b]);
        
            end
        end
    end
    
end

