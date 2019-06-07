#데이터 확인
iris
View(iris)
fix(iris)
edit(iris)
head(iris, 10)
tail(iris, 10)
class(iris)
str(iris)
levels(iris$Species)
summary(iris)

# 1번 문제

setosa <- subset(iris, Species == "setosa")
setosa_Sepal <- subset(iris, Species == "setosa", select = c(Sepal.Length, Sepal.Width))
setosa_Petal <- subset(iris, Species == "setosa", select = c(Petal.Length, Petal.Width))

versicolor <- subset(iris, Species == "versicolor")
versicolor_Sepal <- subset(iris, Species == "versicolor", select = c(Sepal.Length, Sepal.Width))
versicolor_Petal <- subset(iris, Species == "versicolor", select = c(Petal.Length, Petal.Width))

virginica <- subset(iris, Species == "virginica")
virginica_Sepal <- subset(iris, Species == "virginica", select = c(Sepal.Length, Sepal.Width))
virginica_Petal <- subset(iris, Species == "virginica", select = c(Petal.Length, Petal.Width))

par(mar=c(1,1,1,1),mfrow=c(3,2))
plot(setosa_Sepal, main="setosa_Sepal")
plot(setosa_Petal, main="setosa_Petal")
plot(versicolor_Sepal, main="versicolor_Sepal")
plot(versicolor_Petal, main="versicolor_Petal")
plot(virginica_Sepal, main="virginica_Sepal")
plot(virginica_Petal, main="virginica_Sepal")



# 문제 2번
setosa <- subset(iris, Species == "setosa", -5)
setosa_mean <- apply(setosa, 2, mean)
versicolor <- subset(iris, Species == "versicolor", -5)
versicolor_mean <- apply(versicolor, 2, mean)
virginica <- subset(iris, Species == "virginica", -5)
virginica_mean <- apply(virginica, 2, mean)

iris_mean <- rbind(setosa_mean, versicolor_mean, virginica_mean)
iris_mean_t <- t(iris_mean)
barplot(as.matrix(iris_mean_t), beside=T)
barplot(as.matrix(iris_mean_t))

# 문제 3번

boxplot(setosa$Sepal.Length)
boxplot(setosa$Sepal.Width)
boxplot(setosa$Petal.Length)
boxplot(setosa$Petal.Width)

boxplot(versicolor$Sepal.Length)
boxplot(versicolor$Sepal.Width)
boxplot(versicolor$Petal.Length)
boxplot(versicolor$Petal.Width)

boxplot(virginica$Sepal.Length)
boxplot(virginica$Sepal.Width)
boxplot(virginica$Petal.Length)
boxplot(virginica$Petal.Width)

