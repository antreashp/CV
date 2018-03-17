
[model_airplane] = train_a_class(1);
[model_cars] = train_a_class(2);
[model_faces] = train_a_class(3);
[model_motorbikes] = train_a_class(4);
models={model_airplane,model_cars,model_faces,model_motorbikes};

classes=[1,2,3,4];
[test_a,test_c,test_f,test_m] = load_data(classes);

[accuracy_a] = test_model(models,test_a{1},test_a{2});
[accuracy_c] = test_model(models,test_c{1},test_c{2});
[accuracy_f] = test_model(models,test_f{1},test_f{2});
[accuracy_m] = test_model(models,test_m{1},test_m{2});