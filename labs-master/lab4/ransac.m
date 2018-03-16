function [bestM,bestT,inliers] = ransac(fa,fb,matches,p)
%RANSAC Summary of this function goes here
%   Detailed explanation goes here


n=1000;%ceil(log(1 - p) / log( 1 - (1 - 0.5) ^ (P)));
numberSamples=1;
disp(n);
all_a_samples=fa(:,matches(1,:))';

all_b_samples=fb(:,matches(2,:))';
best_inliers=0;
for i =1:n
    out = randperm(size(matches,2),p);
%     out = out1(1:numberSamples);
% %     disp(out);
%     sample_ind=out(1);
%     sample_a=fa(1:2,sample_ind);
%     sample_b=fb(1:2,sample_ind);
%     disp(sample_a);
    a_sample=all_a_samples(out,[1,2]);
    
    b_sample=all_b_samples(out,[1,2]);
%     disp(a_sample);
%     disp("meh");
     a1=[a_sample repmat([0 0 1 0], [size(a_sample,1) 1])];
      a2=[repmat([0 0], [size(a_sample, 1) 1]) a_sample repmat([0 1], [size(a_sample,1) 1])];
      % Interleave a1 and a2
      A = reshape([a1, a2]', 6, [])';
      b = reshape(b_sample', 1, [])';
      x=pinv(A)*b;    %solving Ax=b to get parameters for transformation
       M=reshape(x(1:4),2,2)';
       T=x(5:6);
       
       candidate=(M*all_a_samples(:,[1,2])'+T)';
       distances=sqrt((candidate(:,1)-all_b_samples(:,1)).^2+(candidate(:,2)-all_b_samples(:,2)));
       inliers=sum(distances<10);
       if inliers > best_inliers
            best_inliers=inliers;
            bestM=M;
            bestT=T;
            inliers=all_a_samples(distances<10,:);
       end
end



end

