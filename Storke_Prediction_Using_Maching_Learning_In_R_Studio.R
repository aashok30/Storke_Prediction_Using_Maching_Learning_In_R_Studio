# Import Basic Libraries
library(tidyverse)
library(caret)
library(dplyr)
library(randomForest)
library(gridExtra)
library(plyr)
library(htmlTable)
library(ggplot2)
library(rvest)
library(naniar)

# Import the dataset
df <-read.csv("C:/Users/aasho/Desktop/Education/Acedemics Docs/Kaggle Work/Stroke Prediction Datasets R/healthcare-dataset-stroke-data.csv")


view(df)

# Data Summary
glimpse(df)

summary(df)

str(df)


df$stroke <- factor(df$stroke , levels = c(0,1), labels = c("No", "Yes"))
df$gender <- as.factor(df$gender)
df$hypertension <- factor(df$hypertension , levels = c(0,1), labels = c("No", "Yes"))
df$heart_disease <- factor(df$heart_disease , levels = c(0,1), labels = c("No", "Yes"))
df$ever_married <- as.factor(df$ever_married)
df$work_type <- as.factor(df$work_type)
df$Residence_type <- as.factor(df$Residence_type)

view(df)

summary(df)

# Checking Missing Values
sum(is.na(df))

# Visualize the missing values
vis_miss(df)

# Missing Value Treatment
print(summary(df))

df$bmi[is.na(df$bmi)] <- mean(df$bmi, na.rm = TRUE)

sum(is.na(df))

# Drop other in Gender column
df<-df[!(df$gender=="Other"),]


summary(df)

# Exploratory Data Analysis
ggplot(df) +
  geom_bar(aes(x=df$stroke, fill=stroke),
           position = "dodge") + ggtitle("Distribution of Stroke")+ theme(
  plot.title = element_text(hjust = 0.5),
)



gen <- ggplot(df, aes(x="", y=gender, fill=gender)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0)
hyp <-ggplot(df, aes(x="", y=hypertension, fill=hypertension)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0)
hd <-ggplot(df, aes(x="", y=heart_disease, fill=heart_disease)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0)
em <-ggplot(df, aes(x="", y=ever_married, fill=ever_married)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0) 
grid.arrange(grobs = list(gen, hyp, hd,
                          em),
             ncol = 3,
             top = "Distribution of Variables"
)


wt <- ggplot(df, aes(x="", y=work_type, fill=work_type)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0)
rt <- ggplot(df, aes(x="", y=Residence_type, fill=Residence_type)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0)
ss <- ggplot(df, aes(x="", y=smoking_status, fill=smoking_status)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0)
s <- ggplot(df, aes(x="", y=stroke, fill=stroke)) + geom_bar(stat="identity", width=1)  + coord_polar("y", start=0) 
grid.arrange(grobs = list(wt, rt, ss,
                          s),
             ncol = 3,
             top = "Distribution of Variables"
)




p1 <- ggplot(data = df) +geom_bar(mapping = aes(x = gender,fill=stroke))
p2 <-ggplot(data = df) +geom_bar(mapping = aes(x = hypertension,fill=stroke))
p3 <-ggplot(data = df) +geom_bar(mapping = aes(x = heart_disease,fill=stroke)) 
p4 <-ggplot(data = df) +geom_bar(mapping = aes(x = ever_married,fill=stroke)) 
grid.arrange(grobs = list(p1, p2, p3,
                          p4),
             ncol = 3,
             top = "Distribution of Stroke for Each Variables"
)

p5 <- ggplot(data = df) +geom_bar(mapping = aes(x = work_type,fill=stroke))
p6 <-ggplot(data = df) +geom_bar(mapping = aes(x = Residence_type,fill=stroke))
p7 <-ggplot(data = df) +geom_bar(mapping = aes(x = smoking_status,fill=stroke)) 
grid.arrange(grobs = list(p5, p6, p7),
             ncol = 3,
             top = "Distribution of Stroke for Each Variables"
)

#Data Splitting
n_obs <- nrow(df)
split <- round(n_obs * 0.7)
train <- df[1:split,]
# Create test
test <- df[(split + 1):nrow(df),]


dim(train)
dim(test)

#Modeling with Random Forest
set.seed(123)
rf_model<-randomForest(formula= stroke~.,data = train,metric='Accuracy')
rf_model


confusionMatrix(predict(rf_model, test), test$stroke)
