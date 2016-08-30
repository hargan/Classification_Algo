library("e1071")
library("caret")
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
SVM_mm <- read.csv("MMdesc.csv")
head(SVM_mm)

#Testing and training 
smp_size_mm <- floor(0.50 * nrow(SVM_mm))
set.seed(123)
train_ind_mm <- sample(seq_len(nrow(SVM_mm)), size = smp_size_mm)
train_mm <- SVM_mm[train_ind_mm, ]
test_mm <- SVM_mm[-train_ind_mm, ]
# linear SVM
svmfit <- svm(as.factor(Target) ~ ., data = train_mm, kernel = "linear", cost = 10, scale = FALSE) # linear svm, scaling turned OFF
print(svmfit)
plot(svmfit, SVM_mm)
pred <- predict(svmfit, test_mm[1:9])
# Check accuracy:
confusionMatrix(pred, test_mm$Target)

#RADIAL 
svmfitR <- svm(as.factor(Target) ~ ., data = train_mm, gamma=0.5, kernel = "radial", cost = 1, scale = FALSE) # linear svm, scaling turned OFF
print(svmfitR)
plot(svmfitR, SVM_mm)
pred <- predict(svmfitR, test_mm[1:9])
# Check accuracy:
confusionMatrix(pred, test_mm$Target)