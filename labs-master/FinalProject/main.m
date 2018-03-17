
run('D:/Users/Andy/Downloads/Desktop/vlfeat-0.9.21/toolbox/vl_setup');

dir_path='D:/Users/Andy/Downloads/Desktop/CV/labs-master/FinalProject/Caltech4/ImageData/';
shuffle=0;
number_each_class=200;
number_each_class_test=50;
classes=[1,2,3,4];
k=400;





[vocabulary,train_data,test_data]=give_me_data(number_each_class,number_each_class_test,shuffle,classes);

get_vocalulary(vocabulary,dir_path,k);

create_histograms(train_data,"train",classes,dir_path,k)

create_histograms(test_data,"test",classes,dir_path,k)


