function [] = create_histograms(train_data,type,classes,dir_path,k)
%CREATE_HISTOGRAMS Summary of this function goes here
%   Detailed explanation goes here


vo = matfile('vocabulary.mat');
clusters = vo.clusters_idx;



dss = matfile('ds.mat');
ds = dss.ds;
% train_data=train_data(:);
airplanesX=zeros(1,1,400);
carsX=zeros(1,1,400);
facesX=zeros(1,1,400);
motorbikesX=zeros(1,1,400);
airplanesY=zeros(1,1);
carsY=zeros(1,1);
facesY=zeros(1,1);
motorbikesY=zeros(1,1);

if size(classes,2)==4
    
    for class=1:size(classes,2)
            for image =1:size(train_data(:,class),1)
                image
                histogram=get_hist(dir_path,train_data(image,class),ds,clusters,k);
                if class==1
                    airplanesX=cat(1,airplanesX,histogram);
                    airplanesY=cat(1,airplanesY, 1);
                else
                  airplanesX=cat(1,airplanesX,histogram);
                    airplanesY=cat(1,airplanesY, 0);
                end
                 if class==2
                    carsX=cat(1,carsX,histogram);
                   carsY=cat(1,carsY, 1);
                else
                  carsX=cat(1,carsX,histogram);
                    carsY=cat(1,carsY, 0);
                 end
                 if class==3
                    facesX=cat(1,facesX,histogram);
                    facesY=cat(1,facesY, 1);
                 else
                    facesX=cat(1,facesX,histogram);
                    facesY=cat(1,facesY, 0);
                 end
                if class==4
                    motorbikesX=cat(1,motorbikesX,histogram);
                    motorbikesY=cat(1,motorbikesY, 1);
                else
                    motorbikesX=cat(1,motorbikesX,histogram);
                    motorbikesY=cat(1,motorbikesY, 0);
                end

            end
    end
    
    
end
if type=="train"

    save('airplanesX.mat','airplanesX');
    save('airplanesY.mat','airplanesY');
    save('carsX.mat','carsX');
    save('carsY.mat','carsY');
    save('facesX.mat','facesX');
    save('facesY.mat','facesY');
    save('motorbikesX.mat','motorbikesX');
    save('motorbikesY.mat','motorbikesY');

elseif type=="test"
    
    save('Test_airplanesX.mat','airplanesX');
    save('Test_airplanesY.mat','airplanesY');
    save('Test_carsX.mat','carsX');
    save('Test_carsY.mat','carsY');
    save('Test_facesX.mat','facesX');
    save('Test_facesY.mat','facesY');
    save('Test_motorbikesX.mat','motorbikesX');
    save('Test_motorbikesY.mat','motorbikesY');

    
end
    

end

