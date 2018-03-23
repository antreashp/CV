% % 
type="liblinear";

[model_airplane] = train_a_class(1,type);
%% 
[model_cars] = train_a_class(2,type);
%% 
[model_faces] = train_a_class(3,type);
%% 
[model_motorbikes] = train_a_class(4,type);
%% 
% [model_all] = train_a_class(5);
%% 
models={model_airplane,model_cars,model_faces,model_motorbikes};
%  

kx=100;

classes=[1,2,3,4];

[test] = load_data(classes);

[map,results1,results2,results3,results4] = test_model(models,test{1},test{2},test{3},type);
vo = matfile('ds.mat');
vo = vo.ds;
voc_size=size(vo,1);
method="normal";
create_results(results1,results2,results3,results4,voc_size,method)