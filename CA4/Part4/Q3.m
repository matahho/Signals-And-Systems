
a = TrainedModel.predictFcn(diabetes_training);
sizeOfDF = height(diabetes_training)


accept = 0;

for i = 1:sizeOfDF
    if (a(i,1) == diabetes_training{i, 'label'})
        accept = accept + 1;
    end
end

% accuracy
accuracy = accept / sizeOfDF * 100;

disp(['Accuracy training.csv : %d', num2str(accuracy)]);


