#Author: Wood; Date 11/06/2025; Purpose: Implement Neural Networks

#Load library Caret
library(caret)

#Load sample dataset
dataset <- iris

#80% split for training data and 20% split for validation data

validation_index <- createDataPartition(dataset$Species, p=0.80,
list=FALSE)

validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]

# cross validations: 3, 5, 10-fold cross validations

control <- trainControl(method="cv", number=10)
metric <- "Accuracy"

#Train the model using LDA/Linear Determinant Analysis

set.seed(7)
fit.lda <- train(Species~., data=dataset, method="lda", metric=metric,
trControl= control)

set.seed(7)
fit.rf <- train(Species~., data=dataset, method="rf", metric=metric,
trControl= control)

results <- resamples(list(lda=fit.lda, rf=fit.rf))

summary(results)

predictions <- predict(fit.lda, validation)


------------------------------------------------------
Call:
summary.resamples(object = results)

Models: lda, rf 
Number of resamples: 10 

Accuracy 
         Min. 1st Qu. Median      Mean 3rd Qu. Max. NA's
lda 0.9166667  1.0000      1 0.9833333       1    1    0
rf  0.8333333  0.9375      1 0.9666667       1    1    0

Kappa 
     Min. 1st Qu. Median  Mean 3rd Qu. Max. NA's
lda 0.875 1.00000      1 0.975       1    1    0
rf  0.750 0.90625      1 0.950       1    1    0

> predictions <- predict(fit.lda, validation)
> confusionMatrix(predictions, validation$Species)
Confusion Matrix and Statistics

            Reference
Prediction   setosa versicolor virginica
  setosa         10          0         0
  versicolor      0          9         0
  virginica       0          1        10

Overall Statistics
                                          
               Accuracy : 0.9667          
                 95% CI : (0.8278, 0.9992)
    No Information Rate : 0.3333          
    P-Value [Acc > NIR] : 2.963e-13       
                                          
                  Kappa : 0.95            
                                          
 Mcnemar's Test P-Value : NA              

Statistics by Class:

                     Class: setosa Class: versicolor Class: virginica
Sensitivity                 1.0000            0.9000           1.0000
Specificity                 1.0000            1.0000           0.9500
Pos Pred Value              1.0000            1.0000           0.9091
Neg Pred Value              1.0000            0.9524           1.0000
Prevalence                  0.3333            0.3333           0.3333
Detection Rate              0.3333            0.3000           0.3333
Detection Prevalence        0.3333            0.3000           0.3667
Balanced Accuracy           1.0000            0.9500           0.9750

confusionMatrix(predictions, validation$Species)