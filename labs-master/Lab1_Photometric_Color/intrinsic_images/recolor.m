function [output_image] = recolor(R,S)
       disp(size(R));
       disp(size(S));
       R=R;
       S=S;
       [h,w,d]=size(R);
       image=R;

    output_image=R.*S;
end

