install.packages("gapminder")
library(gapminder)
gapminder[, c("country", "lifeExp")]
glimpse(gapminder)
glimpse(gapminder)
glimse(gapminder)
gapminder[, c("country", "lifeExp")]
glimpse(gapminder)
gapminder[, c("country", "lifeExp", "year")]
install.packages("dplyr")
library(dplyr)
gapminder[, c("country", "lifeExp")]
gapminder[, c("country", "lifeExp", "year")]
gapminder[, c("country", "lifeExp")]
glimpse(gapminder)
gapminder[1:15, ]
gapminder[gapminder$country == "Croatia", "pop"]
gapminder[gapminder$country == "Croatia", c("lifeExp","pop")]
gapminder[gapminder$country == "Croatia", c("lifeExp","pop")]
gapminder[gapminder$country == "Croatia"&gapminder$year > 1990, c("lifeExp","pop")]
apply(gapminder[gapminder$country == "Croatia", c("lifeExp","pop")],2,mean)
apply(gapminder[gapminder$country == "Croatia", c("lifeExp","pop")],1,mean)
apply(gapminder[gapminder$country == "Croatia", c("lifeExp","pop")],2,mean)
select(gapminder,country,year,lifeExp)
filter(gapminder,country == "Croatia")
filter(gapminder,country == "Korea")
filter(gapminder,country == "China")
filter(gapminder,country == "japan")
filter(gapminder,country == "Japan")
filter(gapminder,country == "Croatia")
summarize(gapminder,pop_avg = mean(pop))
summarize(group_by(gapminderm,continent),pop_avg = mean(pop))
summarize(group_by(gapminder,continent),pop_avg = mean(pop))
summarize(group_by(gapminder,continent,country),pop_avg = mean(pop))
gapminder %>% group_by(gapminder,continent) %>% summarize(pop_avg = mean(pop))
gapminder %>% group_by(continent,country) %>% summarize(pop_avg = mean(pop))
summarize(group_by(gapminder,continent),pop_avg = mean(pop))
summarize(group_by(gapminder,continent,country),pop_avg = mean(pop))
gapminder %>% group_by(continent,country) %>% summarize(pop_avg = mean(pop))
temp3
temp3
temp1 = filter(gapminder, country == "Croatia")
temp2 = select(temp1,country,year,lifeExp)
temp3 = apply(temp2[,c("lifeExp")],2,mean)
temp3
getwd()
avocado <- read.csv("C:/class/datamining/avocado.csv", header = TRUE, sep",")
avocado <- read.csv("C:/Users/USER/Desktop/class/datamining/avocado.csv", header = TRUE, sep",")
avocado <- read.csv("C:/Source/avocado.csv", header = TRUE, sep",")
avocado <- read.csv("C:/Source/avocado.csv", header = TRUE, sep",")
avocado <- read.csv("C:/Source/avocado.csv", header = TRUE, sep = ",")
str(avocado)
(X_avg = avocado %>% group_by(region,year) %>% summarize(V_avg = mean(Total.Volume),
P_avg = mean(AveragePrice)))
(X_avg = avocado %>% group_by(region,year) %>% summarize(V_avg = mean(Total.Volume),
P_avg = mean(AveragePrice)))
(X_avg = avocado %>% group_by(region,year) %>% summarize(V_avg = mean(Total.Volume),
P_avg = mean(AveragePrice)))
View(avocado)
View(temp2)
View(avocado)
install.packages("ggplot2")
library(ggplot2)
x_avg %>% filter(region != "TotalUS") %>% ggplo(aes(year,V_avg,col = type)) + geom_line() + facet_wrap(~region)
arrange(X_avg,desc(V_avg))
arrange(X_avg,desc(V_avg))
x_avg %>% filter(region != "TotalUS") %>% ggplo(aes(year,V_avg,col = type)) + geom_line() + facet_wrap(~region)
arrange(X_avg,desc(V_avg))
x_avg %>% filter(region != "TotalUS") %>% ggplot(aes(year,V_avg,col = type)) + geom_line() + facet_wrap(~region)
X_avg %>% filter(region != "TotalUS") %>% ggplot(aes(year,V_avg,col = type)) + geom_line() + facet_wrap(~region)
(x_avg = avocado %>% group_by(region,year) %>% summarize(V_avg = mean(Total.Volume),
P_avg = mean(AveragePrice)))
View(X_avg)
del X_avg
delete(X_avg)
View(X_avg)
x_avg %>% filter(region != "TotalUS") %>% ggplot(aes(year,V_avg,col = type)) + geom_line()+facet_wrap((~region))
arrange(X_avg,desc(V_avg))
x_avg1 = x_avg %>% filter(region != "TotalUS")
x_avg1[X_avg$V_avg == max(x_avg1$V_avg),]
x_avg1[x_avg$V_avg == max(x_avg1$V_avg),]
arrange(X_avg,desc(V_avg))
x_avg1 = x_avg %>% filter(region != "TotalUS")
x_avg1[x_avg$V_avg == max(x_avg1$V_avg),]
x_avg1[x_avg$V_avg == max(x_avg1$V_avg),]
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
arrange(X_avg,desc(V_avg))
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
x_avg1 = x_avg %>% filter(region != "TotalUS")
View(x_avg1)
arrange(X_avg,desc(V_avg))
V_avg
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
arrange(X_avg,desc(V_avg))
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
View(avocado)
View(temp1)
View(temp2)
View(x_avg)
View(X_avg)
View(x_avg1)
View(avocado)
summarize(group_by(gapminder,continent,country),pop_avg = mean(pop))
x_avg1[x_avg$V_avg==max(x_avg1$V_avg)]
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
(region != "TotalUS")
(region != "TotalUS")
x_avg1 = x_avg %>% filter(region != "TotalUS")
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
x_avg %>% filter(region != "TotalUS") %>% ggplot(aes(year,V_avg,col = type)) + geom_line()+facet_wrap((~region))
(x_avg = avocado %>% group_by(region,year) %>% summarize(V_avg = mean(Total.Volume),
P_avg = mean(AveragePrice)))
arrange(X_avg,desc(V_avg))
x_avg1[x_avg$V_avg==max(x_avg1$V_avg),]
x_avg1[x_avg1$V_avg == max(x_avg1$V_avg),]
x_avg1[x_avg1$V_avg == max(x_avg1$V_avg),]
x_avg1[x_avg1$V_avg == max(x_avg1$V_avg),]
iris
iris
iris
iris
r = rpart(Species~., data = iris)
library(rpart, lib.loc = "C:/Program Files/R/R-4.0.4/library")
r = rpart(Species~., data = iris)
print(r)
text(r, use.n = TRUE)
plot(r)
text(r, use.n = TRUE)
text(r, use.n = 'TRUE')
p = predict(r, iris, type = 'class')
table(p, iris$Species)
text(r_prior, use.n=TRUE)
table(p, iris$Species)
r_prior = rpart(Species~., data = iris, parms=list(prior = c(0.1,0.1,0.8)))
plot(r_prior)
text(r_prior, use.n=TRUE)
newd = data.frame(Sepal.Length=c(5.11,7.01,6.32),Sepal.width = c(3.51,3.2,3.31)
,Petal.Length = c(1.4,4.71,6.02),Pepal.width=c(0./19,1.4,2.49))
print(newd)
predict(r,newdata = newd)
newd = data.frame(Sepal.Length=c(5.11,7.01,6.32),Sepal.Width = c(3.51,3.2,3.31)
,Petal.Length = c(1.4,4.71,6.02),Pepal.Width=c(0./19,1.4,2.49))
print(newd)
predict(r,newdata = newd)
newd = data.frame(Sepal.Length=c(5.11,7.01,6.32),Sepal.Width = c(3.51,3.2,3.31)
,Petal.Length = c(1.4,4.71,6.02),Pepal.Width=c(0.19,1.4,2.49))
print(newd)
predict(r,newdata = newd)
newd = data.frame(Sepal.Length=c(5.11,7.01,6.32),Sepal.Width = c(3.51,3.2,3.31)
,Petal.Length = c(1.4,4.71,6.02),Petal.Width=c(0.19,1.4,2.49))
print(newd)
predict(r,newdata = newd)
summary(r)
plot(f)
source('~/.active-rstudio-document', encoding = 'UTF-8')
