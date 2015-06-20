# server.R
library(caret)
library(randomForest)
library(e1071)

whitewine <- read.csv("http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv", sep=";")
whitewine$quality <- factor(whitewine$quality)


# For the sake of being able to input data into this application,
# I am limiting the input to 4 variables. For evaluation purposes, it is
# more difficult to set 10 variables and get the prediction result to change than
# it is for four variables.

# To see how I extracted the most important features, see wineQualityAnalysis.Rmd

importantCols <- c("alcohol", "density", "volatile.acidity", "free.sulfur.dioxide", "quality")
dataset <- whitewine[, importantCols]

qualColWhite <- grep("quality", colnames(dataset))
origData <- dataset

dataset[,-qualColWhite] <- log(dataset[,-qualColWhite] + 1 - min(dataset[,-qualColWhite]))

set.seed(78490)
inTrainWhite <- createDataPartition(y=dataset$quality,
                                    p=0.90, list=FALSE)

training <- dataset[inTrainWhite,]
testing <- dataset[-inTrainWhite,]
mtryGrid <- expand.grid(mtry = 2)
fitControl <- trainControl(method = "cv", number = 10)
set.seed(78490)
model <- train(quality~., data=training, method = "rf", trControl = fitControl, tuneGrid = mtryGrid)

normalizeInput <- function(input){
  # This uses variables outside of this function's scope. Could be done a bit cleaner.
  log(input[,-qualColWhite] + 1 - min(origData[,-qualColWhite]))
}

shinyServer(function(input, output) {
  output$oalcohol <- renderPrint({input$alcohol})
  output$odensity <- renderPrint({input$density})
  output$ovolatileacidity <- renderPrint({input$volatileacidity})
  output$ofreesulferdioxide <- renderPrint({input$freesulferdioxide})
  
  output$example8 <- renderPrint({
    good <- origData[origData$quality == 8, ]
    print(good[1,], row.names = FALSE)
  })
  output$example4 <- renderPrint({
    poor <- origData[origData$quality == 4, ]
    print(poor[2,], row.names = FALSE)
  })
  
  output$oprediction <- renderPrint({
    # Get the input values into a data.frame in the same format as the 
    # initial data
    inputData <- data.frame(input$alcohol,
                            input$density,
                            input$volatileacidity,
                            input$freesulferdioxide,
                            0)
    colnames(inputData) <- colnames(dataset)
    
    # Normalize the input data the same way we normalized the raw data before training.
    normedData <- normalizeInput(inputData)
    
    # predict the quality
    predict(model, normedData)[1]
    
  })
})