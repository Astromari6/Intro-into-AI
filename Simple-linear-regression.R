# Author: Wood; Date: Aug 28, 2025; Purpose: Simple linear regression

# Get dummy dataset
cars <-mtcars

# Scatter plot on training data
scatter.smooth(x=cars$mpg, y=car$disp, min="SpeedVSdistance")

# Calculate correlation value between mpg and disp
cor(cars$mpg, cars$disp)

# Split training and testing data for regression
training_data <- cars[1:16,]
test_data <- cars[17:32,]

# Build a regression model
