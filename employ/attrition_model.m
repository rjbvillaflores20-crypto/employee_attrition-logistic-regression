% attrition_model.m
% Load dataset
data = readtable('WA_Fn-UseC_-HR-Employee-Attrition.csv');

% Convert Attrition to binary (1 = Yes, 0 = No)
data.Attrition = strcmp(data.Attrition, 'Yes');

% Select predictors for the model
predictors = {'MonthlyIncome', 'YearsAtCompany', 'JobSatisfaction', ...
              'OverTime', 'WorkLifeBalance', 'DistanceFromHome'};
X = data(:, predictors);
Y = data.Attrition;

% Convert categorical variable 'OverTime' to logical/binary
X.OverTime = strcmp(X.OverTime, 'Yes');

% Convert table to numeric array for glmfit
X = table2array(varfun(@double, X));

% Train Logistic regression model
[b, dev, stats] = glmfit(X, Y, 'binomial');

% Predict probabilities
prob = glmval(b, X, 'logit');

% Generate predictions (Threshold = 0.5)
y_pred = prob >= 0.5;

% Calculate Confusion Matrix and Accuracy
confMat = confusionmat(Y, y_pred);
accuracy = sum(diag(confMat)) / sum(confMat(:));

% Display text results
disp('--- Model Evaluation ---')
disp('Confusion Matrix:')
disp(confMat)
disp(['Accuracy: ', num2str(accuracy * 100), '%'])

% --- Generate Plots ---
% 1. Confusion Matrix Plot
figure;
confusionchart(Y, y_pred);
title('Confusion Matrix for Employee Attrition');
saveas(gcf, 'confusion_matrix.png');

% 2. ROC Curve Plot
[Xroc, Yroc, T, AUC] = perfcurve(Y, prob, 1);
figure;
plot(Xroc, Yroc);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title(['ROC Curve (AUC = ', num2str(AUC), ')']);
grid on;
saveas(gcf, 'roc_curve.png');

% --- Generate Result Files ---
resultsTable = table(Y, y_pred, prob, 'VariableNames', {'Actual_Attrition', 'Predicted_Class', 'Predicted_Probability'});
writetable(resultsTable, 'model_results.csv');
disp('Files "confusion_matrix.png", "roc_curve.png", and "model_results.csv" generated successfully.');
