
######read csv file#####
if(!file.exists("C:/Users/Administrator/Desktop/新建文件夹")){dir.create("C:/Users/Administrator/Desktop/新建文件夹")}
restData <-read.csv("C:/Users/Administrator/Desktop/新建文件夹/food-price-index-September-2021-index-numbers-csv-tables.csv")

head(restData,n=5)

tail(restData,n=5)

summary(restData)

str(restData)


install.packages("Hmisc")
library(lattice)
library(survival)
library(Formula)
library(ggplot2)
library(Hmisc)

restData$SeriesWrong=ifelse(restData$Series_reference<0,TRUE,FALSE)
table(restData$SeriesWrong,restData$Series_reference<0)

restData$Series_reference=cut(restData$Series_reference,breaks=quantile(restData$Series_reference))
table(restData$Series_reference)
table(restData$Series_reference,restData$Series_reference)


restData$Series_reference <-factor(restData$Series_reference) #######factor function####
restData$Series_reference[1:15]

class(restData$Series_reference)

yesno <-sample(c("yes","no"),size=15,replace = TRUE)

yesnofac=factor(yesno,levels = c("yes","no"))

relevel(yesnofac,ref = "yes")

as.numeric(yesnofac)

restData$Series_reference=cut2(restData$Series_reference,g=4)
table(restData$Series_reference)

library(Hmisc)
library(plyr)
restData2=mutate(restData,Series_reference=cut2(Series_reference,g=4))
table(restData$Series_reference)

library(reshape2)
head(sapply)
restData$Data_value <-factor(restData$Data_value)

table(restData$Data_value)
table(restData$Data_value,restData$Data_value) 


rowMeans(restData$Data_value,Data_value,mean)
col_Mean=apply(restData$Data_value,mean)

type <-restData$Series_reference
value<-restData$Data_value(c)
df<-data.frame(type,value)
df

restData$Data_value <- sapply(df,is.numeric)
restData$Data_value


aggregate(df$value,by=list(type=df$type),sum)
aggregate(df$value,by=list(type=df$type),mean)

