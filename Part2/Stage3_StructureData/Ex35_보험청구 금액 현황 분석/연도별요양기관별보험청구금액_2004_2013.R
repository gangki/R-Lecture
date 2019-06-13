# 예제 3-5: 연도별 기관별 보험청구 금액 현황 분석 후 그래프로 보여주기

setwd("D:/Workspace/R-Lecture/Part2/Stage3_StructureData/Ex35_보험청구 금액 현황 분석")
library(ggplot2)

count <- read.csv("연도별요양기관별보험청구금액_2004_2013_세로.csv")
count2 <- melt(count, id=c('년도'), variable.name = '기관', value.name = '금액')
count2$금액 <- count2$금액/100000
options(digits = 2)

ggplot(count2, aes(x = 년도, y = 금액, fill = 기관, color = 기관)) +
  geom_line(linetype=1, size=1) +
  geom_point(size=3) 
  
