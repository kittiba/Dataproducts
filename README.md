# Dataproducts
MTCars prediction accuracy calculator

How to use this application

Some background

This application is doing a simple calculation for R Squared * 100 to get the Prediction Accuracy % for the covariate you picked (by itself). This is using the 'lm' method in r to predict 'MPG' (Miles per gallon) as outcome using your selection on the side panel. Unfortunately the functionality is kept to a minimum where multiple covariates are not allowed at this time (maybe in Version 2.0).

Data being used in this app is from MTCARS data set in r. All the covariates from this dataset are displayed for selection.

What to input

There are two input values

1. Desired prediction accuracy %: The slider can be used to step through the % value from 45 to 100 in increments of 5 (no particular reason why begin at 45). This is just so you have a reference value when the prediction accuracy is calculated.

2. You can select any one covariate (only) to calculate the prediction accuracy for it. This is useful when one is trying to build a model (exploratory data analysis) as you don't know which covariate has how much significance in prediction.

What to expect as output

You will see the selected prediction accuracy desired. Also you will see the prediction accuracy that was calculated by the app. For example, the following call gives the R squared*100 to get the prediction accuracy percentage

round(summary(lm(mpg ~ cyl, data=mtcars))$r.squared*100,1) 
There is no comparision with the desired prediction accuracy you picked at this time (maybe version 2).

What if I accidently pick two covariates

No Problem! Simply uncheck of them and the app will be able to calculate the prediction accuracy %.

Thanks for visiting my simple app :)
