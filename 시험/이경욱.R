# 1. 다음의 문장을 좀더 효율적으로 개선하시오. (10점)

#1) vec1 <- c(1,2,3,4,5,6)
vec_1 <- c(1:6)
#2) vec2 <- c(10,9,8,7,6,5)
vec_2 <- c(10:5)
#3)vec3 <- c(1,1,2,2,3,3)
vec_3 <- rep(1:3, each=2)
#4) vec4 <- c(1,2,3,1,2,3)
vec_4 <- rep(1:3, 2)
#5 vec5 <- c(1,3,5,7,9,11)
vec_5 <- seq(from=1, to=11, by=2)

#2. 문제

#2.1)
df_score <- data.frame(name = c('강경학', '김태균', '이성열', '정은원'),
                       first_score = c(90,78,94,70),
                       second_score = c(50,60,90,92))

colnames(df_score) = c('이름', '중간', '기말')
df_score

#2.2)
library(dplyr)
df_score_1 <- df_score %>%
  mutate(평균 = (중간+기말)/2)

df_score_1


#문제 3
df_score_1 %>%
  mutate(학점 = ifelse(평균 >= 90, 'A',
                       ifelse(평균 >= 80 & 평균 < 90, 'B',
                                ifelse(평균 >= 70 & 평균 < 80, 'C',
                                         ifelse(평균 >= 60 & 평균 < 70, 'D',F)))))
             
# 문제 4

oddSum <- function(x) {
  result <- 0
  i <- 1
  for (i in i:x) {
    if (i%%2==0) next
    (result = result + i)
  }
  return(result)
}

oddSum(100)

# 문제 5

head(iris)
setosa_Sepal.Width <- subset(iris, Species == "setosa", select = c(Sepal.Width))
boxplot(setosa_Sepal.Width, main = "setosa_Sepal.Width", las = 1, cex.main = 1.5, cex.axis = 1.3)

#평균/표준편차
setosa_mean <- mean(setosa_Sepal.Width$Sepal.Width)
setosa_mean
setosa_sd <- sd(setosa_Sepal.Width$Sepal.Width)
setosa_sd

#결측치 제거
setosa_Sepal.Width_1 <- setosa_Sepal.Width %>%
  filter(Sepal.Width > 2.3)

#평균/표준편차
setosa_mean_1 <- mean(setosa_Sepal.Width_1$Sepal.Width)
setosa_mean_1 
setosa_sd_1 <- sd(setosa_Sepal.Width$Sepal.Width)
setosa_sd_1

#문제 6
library(ggplot2)
head(mpg)

mpg1 <- mpg %>%
  filter(manufacturer == 'toyota') %>%
  group_by(model) %>%
  mutate(mean = (cty+hwy)/2) %>%
  summarise(average = mean(mean)) %>%
  arrange(desc(average)) %>%
  head(3)
mpg1

#문제 7
mpg2 <- mpg %>%
  filter(class == 'suv') %>%
  group_by(manufacturer) %>%
  summarise(cty_mean = mean(cty)) %>%
  arrange(desc(cty_mean)) %>%
  head(7)
  
ggplot(mpg2, aes(x = reorder(manufacturer, -cty_mean), y = cty_mean, fill = manufacturer)) + geom_col()

#문제 8
str(diamonds)
head(diamonds)
  
diamonds1 <- diamonds %>%
  group_by(clarity) %>%
  summarise(clarity_freq = n())
diamonds1

# 8.1) clarity 돗수 그래프
ggplot(diamonds1, aes(x=clarity, y=clarity_freq, fill = clarity)) + geom_bar(stat="identity")

# 8.2) clarity에 따른 가격 변화 그래프
diamonds2 <- diamonds %>%
  group_by(clarity) %>%
  summarise(price_avg = mean(price))
diamonds2

ggplot(diamonds2, aes(x=clarity, y=price_avg, fill = clarity)) +  geom_bar(stat="identity")

#문제 9

setwd("D:/Workspace/R-Lecture/시험")
data <- read.csv("야구성적.csv")

#OPS와 연봉대비 OPS 구하기
options(digits = 2)
data1 <- data %>%
  mutate(OPS = 출루율 + 장타율) %>%
  mutate(연봉대비OPS = OPS / 연봉 * 100)
data1

#연봉대비OPS를 선수별로 비교할 수있는 막대그래프
ggplot(data1, aes(x=선수명, y=연봉대비OPS, fill = 선수명)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

