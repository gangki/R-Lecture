# 데이터 확인
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

##### 1. 품종별 6가지 그리기

setosa <- subset(iris, Species == "setosa")
setosa_Sepal <- subset(iris, Species == "setosa", select = c(Sepal.Length, Sepal.Width))
setosa_Petal <- subset(iris, Species == "setosa", select = c(Petal.Length, Petal.Width))

versicolor <- subset(iris, Species == "versicolor")
versicolor_Sepal <- subset(iris, Species == "versicolor", select = c(Sepal.Length, Sepal.Width))
versicolor_Petal <- subset(iris, Species == "versicolor", select = c(Petal.Length, Petal.Width))

virginica <- subset(iris, Species == "virginica")
virginica_Sepal <- subset(iris, Species == "virginica", select = c(Sepal.Length, Sepal.Width))
virginica_Petal <- subset(iris, Species == "virginica", select = c(Petal.Length, Petal.Width))

par(mfrow=c(3,2))
plot(setosa_Sepal, main="setosa_Sepal", las = 1, cex.main = 1.5)
plot(setosa_Petal, main="setosa_Petal", las = 1, cex.main = 1.5)
plot(versicolor_Sepal, main="versicolor_Sepal", las = 1, cex.main = 1.5)
plot(versicolor_Petal, main="versicolor_Petal", las = 1, cex.main = 1.5)
plot(virginica_Sepal, main="virginica_Sepal", las = 1, cex.main = 1.5)
plot(virginica_Petal, main="virginica_Sepal", las = 1, cex.main = 1.5)


# PNG 저장
png("D:/Workspace/R-Lecture/Part4/Graph/iris_length_width.png", width = 600, height = 600)
par(mfrow=c(3,2))
plot(setosa_Sepal, main="setosa_Sepal", las = 1, cex.main = 1.5)
plot(setosa_Petal, main="setosa_Petal", las = 1, cex.main = 1.5)
plot(versicolor_Sepal, main="versicolor_Sepal", las = 1, cex.main = 1.5)
plot(versicolor_Petal, main="versicolor_Petal", las = 1, cex.main = 1.5)
plot(virginica_Sepal, main="virginica_Sepal", las = 1, cex.main = 1.5)
plot(virginica_Petal, main="virginica_Sepal", las = 1, cex.main = 1.5)
dev.off()


##### 2. 품종별 평균치로 barplot으로 비교하기

setosa <- subset(iris, Species == "setosa", -5)
setosa_mean <- apply(setosa, 2, mean)
versicolor <- subset(iris, Species == "versicolor", -5)
versicolor_mean <- apply(versicolor, 2, mean)
virginica <- subset(iris, Species == "virginica", -5)
virginica_mean <- apply(virginica, 2, mean)

par(mfrow=c(1,2))
par(mfrow=c(1,1))
iris_mean <- rbind(setosa_mean, versicolor_mean, virginica_mean)
iris_mean_t <- t(iris_mean)

# 세로 막대그래프
barplot(as.matrix(iris_mean_t), main = "iris 품종별 평균값", beside=T, 
        names.arg = c("Setosa", "Versicolor", "Virginica"), cex = 1.5,
        col = rainbow(nrow(iris_mean_t)),
        ylim = c(0, 10),
        cex.main = 2, cex.axis = 1.3, las = 1)
legend(11, 10, c("Sepal.length", "Sepal.width", "Petal.length", "Petal.width"),
       fill = rainbow(nrow(iris_mean_t)))

# 누적 세로 막대그래프
barplot(as.matrix(iris_mean_t), main = "iris 품종별 평균값(누적)",
        names.arg = c("Setosa", "Versicolor", "Virginica"), cex = 1.5,
        col = rainbow(nrow(iris_mean_t)),
        ylim = c(0, 25),
        cex.main = 2, cex.axis = 1.3, las = 1)
legend(2.6, 25, c("Sepal.length", "Sepal.width", "Petal.length", "Petal.width"),
       fill = rainbow(nrow(iris_mean_t)))

# PNG 저장
png("D:/Workspace/R-Lecture/Part4/Graph/iris_mean.png", width = 1200, height = 700)
par(mfrow=c(1,2))
barplot(as.matrix(iris_mean_t), main = "iris 품종별 평균값", beside=T, 
        names.arg = c("Setosa", "Versicolor", "Virginica"), cex = 1.5,
        col = rainbow(nrow(iris_mean_t)),
        ylim = c(0, 10),
        cex.main = 2, cex.axis = 1.3, las = 1)
legend(11, 10, c("Sepal.length", "Sepal.width", "Petal.length", "Petal.width"),
       fill = rainbow(nrow(iris_mean_t)))
barplot(as.matrix(iris_mean_t), main = "iris 품종별 평균값(누적)",
        names.arg = c("Setosa", "Versicolor", "Virginica"), cex = 1.5,
        col = rainbow(nrow(iris_mean_t)),
        ylim = c(0, 25),
        cex.main = 2, cex.axis = 1.3, las = 1)
legend(2.6, 25, c("Sepal.length", "Sepal.width", "Petal.length", "Petal.width"),
       fill = rainbow(nrow(iris_mean_t)))
dev.off()



###### 3. Boxplot 12개 그리기

par(mfrow=c(1,1))
boxplot(setosa$Sepal.Length, main = "setosa Sepal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(setosa$Sepal.Width, main = "setosa Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(setosa$Petal.Length, main = "setosa Petal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(setosa$Petal.Width, main = "setosa Petal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)

boxplot(versicolor$Sepal.Length, main = "versicolor Sepal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(versicolor$Sepal.Width, main = "versicolor Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(versicolor$Petal.Length, main = "versicolor Petal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(versicolor$Petal.Width, main = "versicolor Petal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)

boxplot(virginica$Sepal.Length, main = "virginica Sepal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(virginica$Sepal.Width, main = "virginica Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(virginica$Petal.Length, main = "virginica Petal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(virginica$Petal.Width, main = "virginica Petal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)

# PNG 저장
png("D:/Workspace/R-Lecture/Part4/Graph/iris_boxplot.png", width = 1200, height = 600)
par(mfrow=c(3,4))
boxplot(setosa$Sepal.Length, main = "setosa Sepal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(setosa$Sepal.Width, main = "setosa Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(setosa$Petal.Length, main = "setosa Petal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(setosa$Petal.Width, main = "setosa Petal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)

boxplot(versicolor$Sepal.Length, main = "versicolor Sepal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(versicolor$Sepal.Width, main = "versicolor Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(versicolor$Petal.Length, main = "versicolor Petal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(versicolor$Petal.Width, main = "versicolor Petal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)

boxplot(virginica$Sepal.Length, main = "virginica Sepal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(virginica$Sepal.Width, main = "virginica Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(virginica$Petal.Length, main = "virginica Petal.Length", las = 1, cex.main = 1.5, cex.axis = 1.3)
boxplot(virginica$Petal.Width, main = "virginica Petal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)
dev.off()