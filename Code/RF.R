#install.packages("randomForest")
library(randomForest)
library(caret)
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
data_RF <- read.csv("MMdesc.csv")
data_RF$Target <- as.factor(data_RF$Target)
#Testing and training 
smp_size_mm <- floor(0.50 * nrow(data_RF))
set.seed(123)
train_ind_RF <- sample(seq_len(nrow(data_RF)), size = smp_size_mm)
train_RF <- data_RF[train_ind_RF, ]
test_RF <- data_RF[-train_ind_RF, ]
model <- randomForest(Target~., 
                      data = train_RF, 
                      importance=TRUE,
                      keep.forest=TRUE
)
print(model)

#what are the important variables (via permutation)
varImpPlot(model, type=1)
#predict the outcome of the testing data
predicted <- predict(model, newdata=test_RF[1:9])
RF<-table(predicted, test_RF$Target)
confusionMatrix(RF)
