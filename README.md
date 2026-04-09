# Employee Attrition Prediction Model
### Math Modeling FCO - BSM AS3A

### Members: Villaflores, Villero, Medina, Enriquez

## Overview
This program uses a logistic regression model to predict employee attrition based on six key predictors: Monthly Income, Years at Company, Job Satisfaction, OverTime, Work-Life Balance, and Distance From Home. 

## Prerequisites
* MATLAB installed on your system.
* The dataset file `employee_attrition.csv` must be located in the exact same directory as the MATLAB script.

## Instructions on Running the Program
1. Open MATLAB.
2. Navigate to `/employ`
3. Download `attrition_model.m` and the data set `employee_attrition.csv`.
4. Ensure your "Current Folder" in MATLAB is set to the directory containing both `attrition_model.m` and the CSV dataset.
5. Open `attrition_model.m` and click the **Run** button, or simply type `attrition_model` in the Command Window and press Enter.

## Outputs
When the script finishes running, it will produce the following:
1. **Console Output:** Displays the raw confusion matrix and the overall accuracy percentage of the model.
2. **Plots:** Generates a visual Confusion Matrix `confusion_matrix.png` and an ROC Curve with the calculated AUC `roc_curve.png`.
3. **Result Files:** Exports a file named `model_results.csv` containing the actual attrition values, the predicted classes, and the predicted probabilities.
