function [] = create_histograms(train_data,typeof,classes,dir_path,k,colorspaces,C,type,stepOrSIFTsamples,shuffle)
%CREATE_HISTOGRAMS Summary of this function goes here
%   Detailed explanation goes here





if typeof=="train"
    airplanesX=double.empty(0,k);
    carsX=double.empty(0,k);
    facesX=double.empty(0,k);
    motorbikesX=double.empty(0,k);
    airplanesY=double.empty(0,1);
    carsY=double.empty(0,1);
    facesY=double.empty(0,1);
    motorbikesY=double.empty(0,1);
    
    
    airplanes_id=string.empty(0,1);
    cars_id=string.empty(0,1);
    faces_id=string.empty(0,1);
    motorbikes_id=string.empty(0,1);
    
    for class=1:4
            for image =1:size(train_data(:,class),1)
                image*class
                histogram=get_hist(dir_path,train_data(image,class),k,C,colorspaces,type,stepOrSIFTsamples);
                if class==1 &&  ismember(class,classes)
                    airplanesX=cat(1,airplanesX,histogram);
                    airplanesY=cat(1,airplanesY, 1);
                    airplanes_id=cat(1,airplanes_id,train_data(image,class));
                    
                else
                  airplanesX=cat(1,airplanesX,histogram);
                    airplanesY=cat(1,airplanesY, -1);
                    airplanes_id=cat(1,airplanes_id,train_data(image,class));
                end
                 if class==2 &&  ismember(class,classes)
                    carsX=cat(1,carsX,histogram);
                   carsY=cat(1,carsY, 1);
                   cars_id=cat(1,cars_id,train_data(image,class));
                else
                  carsX=cat(1,carsX,histogram);
                    carsY=cat(1,carsY, -1);
                    cars_id=cat(1,cars_id,train_data(image,class));
                 end
                 if class==3 &&  ismember(class,classes)
                    facesX=cat(1,facesX,histogram);
                    facesY=cat(1,facesY, 1);
                            faces_id=cat(1,faces_id,train_data(image,class));
                 else
                    facesX=cat(1,facesX,histogram);
                    facesY=cat(1,facesY, -1);
                            faces_id=cat(1,faces_id,train_data(image,class));
                 end
                if class==4 &&  ismember(class,classes)
                    motorbikesX=cat(1,motorbikesX,histogram);
                    motorbikesY=cat(1,motorbikesY, 1);
                            motorbikes_id=cat(1,motorbikes_id,train_data(image,class));
                else
                    motorbikesX=cat(1,motorbikesX,histogram);
                    motorbikesY=cat(1,motorbikesY, -1);
                            motorbikes_id=cat(1,motorbikes_id,train_data(image,class));
                end

            end
    end
elseif typeof=="test"
    test_data_x=double.empty(0,k);
    test_data_y=double.empty(0,1);
     test_data_id=string.empty(0,1);
    for class=1:4
        for image =1:size(train_data(:,class),1)
            image * class

            test_data_x=cat(1,test_data_x,get_hist(dir_path,train_data(image,class),k,C,colorspaces,type,stepOrSIFTsamples));
            test_data_id=cat(1,test_data_id,train_data(image,class));
            if class==1
                test_data_y=cat(1,test_data_y, 1);
                
            elseif class==2
                test_data_y=cat(1,test_data_y, 2);
            elseif class==3
                test_data_y=cat(1,test_data_y, 3);
            elseif class==4
                test_data_y=cat(1,test_data_y, 4);
            end

        end
    end
end
    

if typeof=="train"
   

if shuffle==1
    rp=randperm(size(airplanesX,1));
    airplanesX=airplanesX(rp,:,:);
    airplanesY=airplanesY(rp,:,:);
    airplanes_id=airplanes_id(rp,:,:);
   
    carsX=carsX(rp,:,:);
    carsY=carsY(rp,:,:);
    cars_id=cars_id(rp,:,:);
    
    facesX=facesX(rp,:,:);
    facesY=facesY(rp,:,:);
    faces_id=faces_id(rp,:,:);
    
    motorbikesX=motorbikesX(rp,:,:);
    motorbikesY=motorbikesY(rp,:,:);
    motorbikes_id=motorbikes_id(rp,:,:);
    
%     airplanesX=airplanesX(:,2:size(airplanesX,2));
%       carsX=carsX(:,2:size(carsX,2));
%       facesX=facesX(:,2:size(facesX,2));
%         motorbikesX=motorbikesX(:,2:size(motorbikesX,2));
    end
    save('airplanesX.mat','airplanesX');
    save('airplanesY.mat','airplanesY');
    save('carsX.mat','carsX');
    save('carsY.mat','carsY');
    save('facesX.mat','facesX');
    save('facesY.mat','facesY');
    save('motorbikesX.mat','motorbikesX');
    save('motorbikesY.mat','motorbikesY');
    save('airplanes_id.mat','airplanes_id');
    save('cars_id.mat','cars_id');
    save('faces_id.mat','faces_id');
    save('motorbikes_id.mat','motorbikes_id');
    
%     airplanes_id=string.empty(0,1);
%     cars_id=string.empty(0,1);
%     faces_id=string.empty(0,1);
%     motorbikes_id=string.empty(0,1);
elseif typeof=="test"
    if shuffle==1
    rp=randperm(size(test_data_x,1));
    test_data_x=test_data_x(rp,:,:);
    test_data_y=test_data_y(rp,:,:);
    test_data_id=test_data_id(rp,:,:);
   
    end
    save('TEST_data_x.mat','test_data_x');
    save('TEST_data_y.mat','test_data_y');
  save('test_data_id.mat','test_data_id');

    
end
    

end

