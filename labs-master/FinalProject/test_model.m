function [accuracy] = test_model(model,test_data,test_Y)
%TEST_MODEL Summary of this function goes here
%   Detailed explanation goes here



% model=cell2struct(model);
count_pos=0;
test_data=reshape(test_data,[size(test_data,1)*size(test_data,2),size(test_data,3)]);
% test_data=permute(test_data,[2,1]);
% test_data=unique(test_data);
for image=1:size(test_data,1)
    max=-99999;
    for cls=1:size(model,1)
       [prediction,score]=predict(model{cls},test_data(image,:)); 
       if prediction==0
                scr=score(1); 
           else
               scr=score(2);
       end
       if scr>max
          max=scr; 
          max_idx=cls;
          max_pred=prediction;
          
       end
    end
    if test_Y(image)==prediction
       count_pos=count_pos+1; 
    end
end
accuracy=count_pos/size(test_data,1);

end