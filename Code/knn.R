#install.packages(c("dplyr", "lubridate", "class"))
library(class)
library(dplyr)
library(caret)
library(lubridate)
set.seed(100)
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
KNN_mm <- read.csv("MMdesc.csv")
#Testing and training 
smp_size_mm <- floor(0.50 * nrow(KNN_mm))
train_ind_mm <- sample(seq_len(nrow(KNN_mm)), size = smp_size_mm)
train_mm <- KNN_mm[train_ind_mm,1:9 ]
test_mm <- KNN_mm[-train_ind_mm,1:9 ]
train_mm_Labels <- KNN_mm[train_ind_mm,10 ]
test_mm_Labels <- KNN_mm[-train_ind_mm,10]
# ACcuracy
model_k <-knn(train = train_mm, test = test_mm, cl = train_mm_Labels, k=3)
confusionMatrix(model_k, test_mm_Labels)

