# 미션 3-3. 취직하기가 정말 어렵네요

setwd("D:/Workspace/R-Lecture/Part2/Stage3_StructureData/도전미션 3-3 - 취직하기가 정말 어렵네요")
library(ggplot2)
library(reshape2)

data1 <- read.csv("2000-2013년 연령별실업율_연령별평균_세로.csv")
long_data1 <- melt(data1, id = c("연도"), variable.name = "연령", value.name = "실업률")
head(long_data1, 10)
class(long_data1)

ggplot(long_data1, aes(x=연도, y=실업률, group =연령, color = 연령)) +
  geom_line() +
  geom_point(size=3) +
  labs(title = "연령별 실업률 현황(단위:%) 출처:통계청") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(plot.title=element_text(face="bold", size=20, color="blue")) +
  scale_y_continuous(breaks=seq(0, 10, 1))
