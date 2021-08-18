##### Set working directory
setwd("/Users/tanyangfan/Desktop/data")

##### R packages

library(magrittr)
library(ISLR)
library(caret)
library(dplyr)

##### Data work
# Read data from xls file
exp_clothing <- readxl::read_excel("exp_clothing.xls")

# Define the Mean Square Error function
mse <- function(x,y) {mean((x-y)^2)}

# Subset dataset based on "holdout"
exp_development <- filter(exp_clothing, holdout == 0)
exp_holdout <- filter(exp_clothing, holdout == 1)

# Goodness of fit 
results <- 
  data.frame(
    model  = c("AA", "AA", "AB", "AB"),
    sample = c("development", "holdout", "development", "holdout"),
    MSE    = c(mse(exp_development$AA, exp_development$expend),
             mse(exp_holdout$AA, exp_holdout$expend),
             mse(exp_development$AB, exp_development$expend),
             mse(exp_holdout$AB, exp_holdout$expend)),
  Rsquared = c(R2(exp_development$AA, exp_development$expend),
               R2(exp_holdout$AA, exp_holdout$expend),
               R2(exp_development$AB, exp_development$expend),
               R2(exp_holdout$AB, exp_holdout$expend)))