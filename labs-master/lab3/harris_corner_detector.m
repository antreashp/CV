function [H,Gx,Gy] = harris_corner_detector(image)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    image=im2double(image);
    image=rgb2gray(image);
    [Gx,Gy]=imgradientxy(image);
    [h,w]=size(image);
    %     Q=zeros(size(image));
    A=Gx.^2;
    B=Gx.*Gy;
    C=Gy.^2;
    H=zeros(h,w);
    g=fspecial('gaussian',[7,7],2);
    A=filter2(g,A);
    B=filter2(g,B);
    C=filter2(g,C);
    for i =1:h
        for j=1:w
           Q=[A(i,j), B(i,j) ; B(i,j), C(i,j)];
           H(i,j)=det(Q)-0.04*(trace(Q))^2;
        end
    end
    
    Hmax=max(max(H));
    thresh=0.001;
    %     disp(A);
%     disp(B);
%     disp(C);
%     Q=[sum(sum(A)), sum(sum(B)) ; sum(sum(B)), sum(sum(C))];
%     disp(size(Q));
%     H= ((A.*C)-B.^2)-0.04*((A+C).^2);
    result=zeros(h,w);
for i = 2:h-1
        for j = 2:w-1
            
            if H(i,j) > 0.1*Hmax && H(i,j) > H(i-1,j-1) && H(i,j) > H(i-1,j) && H(i,j) > H(i-1,j+1) && H(i,j) > H(i,j-1) && H(i,j) > H(i,j+1) && H(i,j) > H(i+1,j-1) && H(i,j) > H(i+1,j) && H(i,j) > H(i+1,j+1) && abs(H(i,j))>thresh
                result(i,j) = 1;
            end
        end
    end

    
    
    H=result;
    

end

