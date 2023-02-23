library(readr)
library(knitr)
library(caret)
library(h2o)
library(ggmap)
library(ggplot2)



#파일불러오기
train <- readr::read_csv("C:/Users/USER/Desktop/datamining/train.csv", col_types = paste(rep("?", 9), collapse = ""))
visual<- readr::read_csv("C:/Users/USER/Desktop/datamining/train.csv", col_types = paste(rep("?", 9), collapse = ""))
crime <- readr::read_csv("C:/Users/USER/Desktop/datamining/train.csv", col_types = paste(rep("?", 9), collapse = ""))
test <- readr::read_csv("C:/Users/USER/Desktop/datamining/test.csv", col_types = paste(rep("?", 7), collapse = ""))
test$Category = "NA"

#train data와 test data processing을 위한 통합
merged <- merge(train, test, by = c("Dates", "DayOfWeek",  "Address", "X", "Y", "PdDistrict", "Category"), all = TRUE)
dim(merged)

#범죄 분포 지도 시각화
sample <- visual[sample(1:nrow(train), 10000), ]
with(sample, plot(X, Y))
with(subset(sample, Category != "NA"), plot(X, Y))

#범죄유형 빈도순으로 시각화
crime$Dates <- ymd_hms(crime$Dates)
crime[,c("Category","Descript","DayOfWeek","PdDistrict","Resolution")] <-
  lapply(crime[,c("Category","Descript","DayOfWeek","PdDistrict","Resolution")],
         as.factor)
levels(crime$DayOfWeek)
crime$DayOfWeek <- factor(crime$DayOfWeek,
                          levels = c("Monday","Tuesday","Wednesday",
                                     "Thursday", "Friday", 
                                     "Saturday", "Sunday"),
                          ordered = TRUE)
common_crimes <- as.data.frame(table(crime$Category))
colnames(common_crimes) <- c("Category", "Freq")
common_crimes <- common_crimes[order(common_crimes$Freq, decreasing = T),]
common_crimes
ggplot(data = common_crimes, mapping = aes(x= Freq, y= reorder(Category, Freq)))+
  geom_col(aes(fill = Category))+
  geom_text(data = common_crimes[c(1,39),],mapping = aes(label = Freq))+
  theme_minimal()+
  labs(title = "Common Crime Category in San Francisco",
       y = NULL,
       x = "Frequency")+
  theme(legend.position = "none")

#data Processing
date_and_time <- strptime(merged$Dates, '%Y-%m-%d %H:%M:%S')
merged$Year <- as.numeric(format(date_and_time, '%Y'))
merged$Month <- as.numeric(format(date_and_time, '%m'))
merged$Day <- as.numeric(format(date_and_time, '%d'))
merged$Week <- as.numeric(format(date_and_time, '%W'))
merged$Hour <- as.numeric(format(date_and_time, '%H'))
merged$Minute <- as.numeric(format(date_and_time, '%M'))
head(merged)

#불필요한 정보 제거
merged$Descript=NULL
merged$Resolution=NULL
merged$Id=NULL

#address 분류
n <- nrow(merged)
merged$AddressTypeIsOf <- rep(FALSE, n)
merged$AddressTypeIsOf[grep('.?of.?', merged$Address)] <- "of"
merged$AddressTypeIsOf[grep('.?/.?', merged$Address)] <- "/"

head(merged$AddressTypeIsOf)

dp = preProcess(merged[, 4:5], method = c("center"))

merged[, 4:5] <- predict(dp, merged[, 4:5])

merged$Address1 <- sapply(merged$Address, FUN = function(x) {strsplit(x, split = " ")[[1]][1]})
merged$Address2 <- sapply(merged$Address, FUN = function(x) {strsplit(x, split = " ")[[1]][2]})

head(merged[, 4:5])

head(merged$Address1)
head(merged$Address2)

#train data와 test data를 다시 나눠줌
train <- merged[merged$Category != "NA", ]
test <- merged[merged$Category == "NA", ]
test$Category=NULL

#process된 data를 각각 csv파일로 저장
write.csv(train, 'train2.csv', row.names=FALSE, quote=FALSE)
write.csv(test, 'test2.csv', row.names=FALSE, quote=FALSE)

#h2o 라이브러리 실행
require(h2o)
h2o.init()
#h2o 서버로 train파일과 test파일 업로드

dftrain <- h2o.importFile(path =normalizePath("C:/Users/USER/Desktop/datamining/train2.csv"))
dim(dftrain)

dftest <- h2o.importFile(path = normalizePath("C:/Users/USER/Desktop/datamining/test2.csv"))
dim(dftest)

#train data에서 train 영역과 valid 영역 분류
splits <- h2o.splitFrame(dftrain, c(0.65,0.25), seed=1234)
train  <- h2o.assign(splits[[1]], "train.hex") 
valid  <- h2o.assign(splits[[2]], "valid.hex") 

#prediction에 불필요한 category 배제
response <- "Category"
predictors <- setdiff(names(train), c("Dates","DayOfWeek","Address","Address",response))
predictors

#학습모델 생성
traindp <- h2o.deeplearning(
  model_id="crime_classification", 
  training_frame=train, 
  validation_frame=valid, 
  x=predictors, 
  y=response, 
  overwrite_with_best_model=T,    
  hidden=c(128,128,128),          
  epochs=16,                      
  score_validation_samples=10000, 
  score_duty_cycle=0.025,        
  adaptive_rate=T,                
  l1=1e-5,                        
  l2=1e-5,
  max_w2=10,                      
  stopping_metric="logloss",
  variable_importances=T
) 

#생성된 학습모델로 예측
pred <- h2o.predict(traindp, dftest)
pred
pred[,1]





