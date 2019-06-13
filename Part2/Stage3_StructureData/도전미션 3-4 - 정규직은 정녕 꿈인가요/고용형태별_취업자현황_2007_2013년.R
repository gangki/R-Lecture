# 미션 3-4. 정규직은 정녕 꿈인가요

setwd("D:/Workspace/R-Lecture/Part2/Stage3_StructureData/도전미션 3-4 - 정규직은 정녕 꿈인가요")
library(ggplot2)
library(dplyr)
library(reshape2)


data1 <- read.csv("고용형태별_취업자현황_2007_2013년.csv", skip = 1, header = T)
data_1 <- select(data1, 고용형태, contains('일'))
data_2 <- data_1[-c(2,5,6),]
names(data_2)
names(data_2) <- c("고용형태","2007","2008","2009","2010","2011","2012","2013")
long_data1 <- melt(data_2, id = c("고용형태"), variable.name = "연도", value.name = "근무일수")
str(data1)

ggplot(long_data1, aes(x=연도, y=근무일수, group = 고용형태, color = 고용형태)) +
  geom_line() +
  geom_point(size=3) +
  labs(title = "고용형태별 근무일수(단위:일 출처: 통계청") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title=element_text(face="bold", size=10, color="blue"))