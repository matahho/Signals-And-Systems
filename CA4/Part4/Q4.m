
b= TrainedModel.predictFcn(diabetes_validation);

accept = 0;
sizeOfDF = height(diabetes_validation)

for i = 1:sizeOfDF
    if (a(i,1) == diabetes_validation{i, 'label'})
        accept = accept + 1;
    end
end
accuracy = accept / sizeOfDF * 100;

disp(['Accuracy validation.csv: ', num2str(accuracy)]);
