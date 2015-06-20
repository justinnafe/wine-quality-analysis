library(shiny)

dataset <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep=";")

shinyUI(fluidPage(
  titlePanel("White Wine Quality Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Enter the values used to predict the quality of the wine"),
      
      sliderInput("alcohol", 
                  label = "Alcohol (% vol.):",
                  min = min(dataset$alcohol), 
                  max = max(dataset$alcohol), 
                  value = mean(dataset$alcohol),
                  round = -2,
                  step = 0.05),
      sliderInput("density", 
                  label = "Density (g/dm3):",
                  min = min(dataset$density), 
                  max = max(dataset$density), 
                  value = mean(dataset$density),
                  round = -3,
                  step = 0.001),
      sliderInput("volatileacidity", 
                  label = "Volatile Acidity (g(acetic acid)/dm3):",
                  min = min(dataset$volatile.acidity), 
                  max = max(dataset$volatile.acidity), 
                  value = mean(dataset$volatile.acidity),
                  round = -2,
                  step = 0.01),
      sliderInput("freesulferdioxide", 
                  label = "Free Sulfer Dioxide (g/dm3) :",
                  min = min(dataset$free.sulfur.dioxide), 
                  max = max(dataset$free.sulfur.dioxide), 
                  value = mean(dataset$free.sulfur.dioxide),
                  round = TRUE)
      ),
    
    mainPanel( 
      h3('Prediction'),
      p('On a scale of 1 to 10, where 1 is poor and 10 is great. Within this dataset, 
        the range is from 3 to 9. If no data is visible, you may have to wait about 5 minutes
        for the model to load.'),
      p('For this analysis, I am predicting the quality of white wine based on 
        physiochemical characteristics of white wine. The dataset was 
        prepared with samples of white vinho verde wine from the north of 
        Portugal [Cortez et al., 2009] and is available 
        at https://archive.ics.uci.edu/ml/datasets/Wine+Quality.'),
      verbatimTextOutput("oprediction"),
      h5('Example of great wine (an 8)'),
      verbatimTextOutput("example8"),
      h5('Example of poor wine (a 4)'),
      verbatimTextOutput("example4"),
      h3('Input Parameters'),
      h5('Alcohol'),
      verbatimTextOutput("oalcohol"),
      h5('Density'),
      verbatimTextOutput("odensity"),
      h5('Volatile Acidity'),
      verbatimTextOutput("ovolatileacidity"),
      h5('Sulfer Dioxide'),
      verbatimTextOutput("ofreesulferdioxide"),
      h3('References'),
      p('P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis. 
Modeling wine preferences by data mining from physicochemical properties. 
        In Decision Support Systems, Elsevier, 47(4):547-553, 2009')
    )
    )
  ))