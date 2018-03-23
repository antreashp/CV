function [map,results1,results2,results3,results4]  = test_model(model,test_data,test_Y,test_id,type)
%TEST_MODEL Summary of this function goes here
%   Detailed explanation goes here

% rp=randperm(size(test_data,1));
% test_data=test_data(rp,:,:);
% test_Y=test_Y(rp,:,:);

% model=cell2struct(model);
count_pos=0;
% test_data=reshape(test_data,[size(test_data,1)*size(test_data,2),size(test_data,3)]);

% test_data=permute(test_data,[2,1]);
% test_data=unique(test_data);
% size(model,2)

        results1=[];
     results2=[];
      results3=[];
       results4=[];

% length(model)

dir_path='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/';

predictions=[];

for image=1:size(test_data,1)
 
    max1=-999999;
%      max2=999999;
    img_preds=[];
    max_idx1=0;
     for cls=1:size(model,2)
         if type=="matlab"
         
%        [prediction,~,score]=predict(double(test_Y(image,1)), sparse(test_data(image,:,:)),model{cls});
       [prediction,score]=predict(model{cls},test_data(image,:,:));
         score=score(2);
         else
       
       [prediction,~,score]=predict(double(test_Y(image,1)), sparse(test_data(image,:,:)),model{cls});
             
         end      
             
%        "meh"   
%        score
%           prediction
% %           
        img_preds=cat(1,img_preds,[prediction,score]);
          
       
%     if prediction ==1

        

        if score>max1 
%             "meeeeeeeeeeeeeeh"
          max1=score; 
          max_idx1=cls;
          
       end
%     else
%         if score<max2
%           max2=score; 
%           max_idx2=cls;
%           
%        end
%     end

%    predictions=cat(1,predictions,max_idx);
% 

    
     end
        img_path=char(strcat(convertStringsToChars(dir_path),convertStringsToChars(test_id(image,1))));
%         figure(1);
%         imshow(imread(img_path));
%         pause(2);
%         img_preds
%         disp(max_idx1);
%     if max1>max2
%         
%         max_idx=max_idx1;
%     else
%         max_idx=max_idx2;
%     end

    predictions=cat(2,predictions,max_idx1);
    if max_idx1==1
       results1=cat(2,results1,test_id(image,1));
    elseif max_idx1==2
        results2=cat(2,results2,test_id(image,1));
   
    elseif max_idx1==3
        results3=cat(2,results3,test_id(image,1));
   
    else
        results4=cat(2,results4,test_id(image,1));
   
    end
    
%     if test_Y(image)==max_idx
%        count_pos=count_pos+1; 
%     end
end
% accuracy=count_pos/size(test_data,1);
pos=0;
map=0;



%     results={results1,results2,results3,results4};
for i =1:size(test_Y,1)
    if predictions(i)==test_Y(i)
        pos=pos+1;
        map=map+(pos/i);
    end

% map=map/size(test_Y,1);
% [averagePrecision,recall,precision] =evaluateDetectionPrecision(predictions,test_Y)
% 

end
map=map/size(test_Y,1);
end