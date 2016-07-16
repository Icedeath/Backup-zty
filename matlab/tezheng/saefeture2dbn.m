load train_x;
load train_y;
load test_x;
load test_y;

datasets=cell(2,2);
train_x=mapminmax(train_x,0,1);
test_x=mapminmax(test_x,0,1);

datasets{1,1}=test_x;
datasets{1,2}=test_y;
datasets{2,1}=train_x;
datasets{2,2}=train_y;
save datasets15_1000 datasets;