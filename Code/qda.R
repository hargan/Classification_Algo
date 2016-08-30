library(MASS)
library(caret)
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
QDA_mm <- read.csv("hbg.csv")
QDA_mm$Target <- as.factor(QDA_mm$Target)
head(QDA_mm)

#Testing and training 
smp_size_mm <- floor(0.50 * nrow(QDA_mm))
set.seed(123)
train_ind_mm <- sample(seq_len(nrow(QDA_mm)), size = smp_size_mm)
train_mm <- QDA_mm[train_ind_mm, ]
test_mm <- QDA_mm[-train_ind_mm, ]

# QDA MODEL
qda_mod <- qda(as.factor(Target)~., data = QDA_mm)
predicted <- predict(qda_mod, test_mm[1:9])
prediction_response <- predicted$class # prediction_response contains the needed predictions
qd<-table(prediction_response, test_mm$Target)
confusionMatrix(qd)
