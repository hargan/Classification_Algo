library("e1071")
library("caret")
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
NB_mm <- read.csv("MMdesc.csv")
head(NB_mm)

model <- naiveBayes(Target ~ ., data = NB_mm)
smp_size_mm <- floor(0.50 * nrow(NB_mm))
set.seed(123)
train_ind_mm <- sample(seq_len(nrow(NB_mm)), size = smp_size_mm)
train_mm <- NB_mm[train_ind_mm, ]
test_mm <- NB_mm[-train_ind_mm, ]

pred <- predict(model, test_mm[1:9])
confusionMatrix(pred, test_mm$Target)
