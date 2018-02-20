function [output_green,output_magenta] = recoloring(R,S)

       [h,w,d]=size(R);

       
      for i =1:h
        for j=1:w
            if R(i,j,1)~=0
                R(i,j,1)=1;
                R(i,j,2)=0;
                R(i,j,3)=1;
            end
        end
      end
   R=im2double(R);


      output_magenta=R.*S;
       
      for i =1:h
        for j=1:w
            if R(i,j,1)~=0
                R(i,j,1)=0;
                R(i,j,2)=1;
                R(i,j,3)=0;
            end
        end
      end
        R=im2double(R);
      output_green=R.*S;
       
  
end

