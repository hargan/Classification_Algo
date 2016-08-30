library(tree)
library(caret)
library(grid)
library(partykit)
library(Formula)
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
data_mm <- read.csv("MMdesc.csv")
head(data_mm)
#Testing and training 
smp_size_mm <- floor(0.50 * nrow(data_mm))
set.seed(123)
train_ind_mm <- sample(seq_len(nrow(data_mm)), size = smp_size_mm)
train_mm <- data_mm[train_ind_mm, ]
test_mm <- data_mm[-train_ind_mm, ]
# ACcuracy
fit=ctree(as.factor(Target)~.,data_mm)
pred=predict(fit,test_mm[1:9], type="response")
pred
table(pred, test_mm$Target)
confusionMatrix(pred, test_mm$Target)




