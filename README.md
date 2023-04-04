# Storke_Prediction_Using_Maching_Learning_In_R

![image](https://user-images.githubusercontent.com/101622691/228574349-40caa368-0b68-48b4-8fa3-3ac8467965b5.png)


Image Source : https://www.pinterest.com/pin/92042386106856433/

Machine learning project on health care data using R Studio 

The data contains 5110 observations with 12 attributes.

## Attribute Information/Data Definitions

1) id: unique identifier
2) gender: "Male", "Female" or "Other"
3) age: age of the patient
4) hypertension: 0 if the patient doesn't have hypertension, 1 if the patient has hypertension
5) heart_disease: 0 if the patient doesn't have any heart diseases, 1 if the patient has a heart disease
6) ever_married: "No" or "Yes"
7) work_type: "children", "Govt_jov", "Never_worked", "Private" or "Self-employed"
8) Residence_type: "Rural" or "Urban"
9) avg_glucose_level: average glucose level in blood
10) bmi: body mass index
11) smoking_status: "formerly smoked", "never smoked", "smokes" or "Unknown"*
12) stroke: 1 if the patient had a stroke or 0 if not
*Note: "Unknown" in smoking_status means that the information is unavailable for this patient

Data Source : https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset

## Objective

Predict whether a Patient will have stroke or not based on some given attributes. Evaluation metric was Confusion Matrix.
