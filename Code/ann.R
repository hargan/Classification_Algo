library(nnet)
library(e1071)
library(caret)
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
AN_mm <- read.csv("MMdesc.csv")
head(AN_mm)
#Testing and training 
smp_size_mm <- floor(0.50 * nrow(AN_mm))
set.seed(123)
train_ind_mm <- sample(seq_len(nrow(AN_mm)), size = smp_size_mm)
train_mm <- AN_mm[train_ind_mm, ]
test_mm <- AN_mm[-train_ind_mm, ]
AN_model <- nnet(Target ~., data = train_mm,size=20,maxit=10000,decay=.001)
pred=predict(AN_model,test_mm[1:9], type="class")
confusionMatrix(pred, test_mm$Target)
