library(shiny)
shinyUI(pageWithSidebar(
        
        headerPanel(
                h1("Covariate prediction accuracy calculator")
                
        ),    
        sidebarPanel(
                
                h3("Enter Accuracy and select one Covariate"),
                numericInput('accuracyPercent','Enter prediction accuracy desired', 45,min=45, max=100, step=5),
                checkboxGroupInput("Params", "Covariate Selection",
                                   c("Cylinders"="cyl",
                                     "Displacement"="disp",
                                     "Gross Horsepower"="hp",
                                     "Real Axel Ration"="drat",
                                     "Weight"="wt",
                                     "1/4 mile time"="qsec",
                                     "V/S"="vs",
                                     "Transmission"="am",
                                     "Number of forward gears"="gear",
                                     "Number of carburetors"="carb"
                                     
                                     )
                                   
                )
                
                
        ),   
        
        mainPanel(
#                 h3("MTCARS R dataset - MPG (as outcome) using Linear Regression"),
#                 br(),
#                 h3("Your entered the following desired prediction accuracy"),
#                 verbatimTextOutput("oaccuracyPercent"), 
#                 h3("Prediction Accuracy for the covariate you picked (by itself) is"),
#                 verbatimTextOutput("oParams")           
                
                tabsetPanel(
                        
                        tabPanel("Prediction Accuracy", 
                                h3("MTCARS R dataset - MPG (as outcome) using Linear Regression"),
                                br(),
                                h3("Your entered the following desired prediction accuracy"),
                                verbatimTextOutput("oaccuracyPercent"), 
                                h3("Prediction Accuracy for the covariate you picked (by itself) is"),
                                verbatimTextOutput("oParams") 
                                ),
                        tabPanel("Help Documentation", 
                                 h3("How to use this application"),
                                 br(),
                                 h4("Some background"),
                                 p("This application is doing a simple calculation for R Squared * 100 to get 
                                   the Prediction Accuracy % for the covariate you picked (by itself).
                                   This is using the 'lm' method in r to predict 'MPG' (Miles per gallon) as outcome
                                   using your selection on the side panel. Unfortunately the functionality is kept to a minimum
                                   where multiple covariates are not allowed at this time (maybe in Version 2.0)."),
                                 
                                 p("Data being used in this app is from MTCARS data set in r. All the covariates from this dataset
                                   are displayed for selection."),
                                 
                                 h4("What to input"),
                                 p("There are two input values"),
                                 p("1. Desired prediction accuracy %: The slider can be used to step through
                                   the % value from 45 to 100 in increments of 5 (no particular reason why begin at 45).
                                   This is just so you have a reference value when the prediction accuracy is calculated."),
                                 p("2. You can select any one covariate (only) to calculate the prediction
                                   accuracy for it. This is useful when one is trying to build a model (exploratory data analysis)
                                   as you don't know which covariate has how much significance in prediction."),
                                 
                                 h4("What to expect as output"),
                                 p("You will see the selected prediction accuracy desired.
                                    Also you will see the prediction accuracy that was calculated by the app.
                                    For example, the following call gives the R squared*100 to get the prediction accuracy percentage"),
                                 code("round(summary(lm(mpg ~ cyl, data=mtcars))$r.squared*100,1)"),
                                 br(),
                                 p("There is no comparision with the desired prediction accuracy you picked at
                                   this time (maybe version 2)."),
                                 
                                 h4("What if I accidently pick two covariates"),
                                 p("No Problem! Simply uncheck of them and the app will be able to calculate the prediction accuracy %."),
                                 
                                 h2("Thanks for visiting my simple app :)")
                                   
                                 
                        )
                )
                
        )
))