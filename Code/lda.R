library(MASS)
library(caret)
setwd("C:\\Users\\HarGan\\Desktop\\Prayashi\\files")
LDA_mm <- read.csv("MMdesc.csv")
LDA_mm$Target <- as.factor(LDA_mm$Target)
head(LDA_mm)

#Testing and training 
smp_size_mm <- floor(0.50 * nrow(LDA_mm))
set.seed(123)
train_ind_mm <- sample(seq_len(nrow(LDA_mm)), size = smp_size_mm)
train_mm <- LDA_mm[train_ind_mm, ]
test_mm <- LDA_mm[-train_ind_mm, ]

# LDA MODEL
lda_mod <- lda (as.factor(Target)~., data = train_mm)
predicted <- predict(lda_mod, test_mm[1:9])
prediction_response <- predicted$class # prediction_response contains the needed predictions
ld<-table(prediction_response, test_mm$Target)
confusionMatrix(ld)