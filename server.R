library(shiny)

linearFunction<-function(params){
        len<-length(params)
        if(len==0){
                print("Please pick a covariate")
        }else
                if(len>1){
                        print("Please only select one covariate at a time")
                      
                
        }else{
        paramString<-NULL
        finalParam<-NULL
        
  #      if(len>0){
  #              paramString<-c("")
  #              for(i in 1:len){
  #                      paramString<-paste(paramString, params[i],"+")
  #                      i<-i+1
  #              }
                
  #              lenParam<-nchar(as.character(paramString))
                
  #              finalParam<-substr(paramString,1,lenParam-1)
  #      }
        
        if(params=='cyl'){
                paste("Prediction Accuracy of 'Number of cylinders' is", round(summary(lm(mpg ~ cyl, data=mtcars))$r.squared*100,1),"%")

        }else if(params=='disp'){
                paste("Prediction Accuracy of 'Displacement' is", round(summary(lm(mpg ~ disp, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='hp'){
                paste("Prediction Accuracy of 'Gross Horsepower' is", round(summary(lm(mpg ~ hp, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='drat'){
                paste("Prediction Accuracy of 'Rear Axle Ration' is", round(summary(lm(mpg ~ drat, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='wt'){
                paste("Prediction Accuracy of 'Weight (lb/1000) is", round(summary(lm(mpg ~ wt, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='qsec'){
                paste("Prediction Accuracy of '1/4 mile time' is", round(summary(lm(mpg ~ qsec, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='vs'){
                paste("Prediction Accuracy of 'V/S' is", round(summary(lm(mpg ~ vs, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='am'){
                paste("Prediction Accuracy of 'Transmission' is", round(summary(lm(mpg ~ am, data=mtcars))$r.squared*100,1),"%")
        }else if(params=='gear'){
                paste("Prediction Accuracy of 'Number of forward gears' is", round(summary(lm(mpg ~ gear, data=mtcars))$r.squared*100,1),"%")
        }else{
                paste("Prediction Accuracy of 'Number of carbuerators' is", round(summary(lm(mpg ~ carb, data=mtcars))$r.squared*100,1),"%")
        }
        }
         
}



shinyServer(
        
        function(input, output){
                
                output$oaccuracyPercent<-renderPrint({input$accuracyPercent})
                output$oParams<-renderPrint({linearFunction(input$Params)})  
                
                
                
        }
)