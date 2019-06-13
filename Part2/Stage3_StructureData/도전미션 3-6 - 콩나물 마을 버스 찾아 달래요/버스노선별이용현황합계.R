# 미션 3-6. 콩나물 마을 버스 찾아 달래요

setwd("D:/Workspace/R-Lecture/Part2/Stage3_StructureData/도전미션 3-6 - 콩나물 마을 버스 찾아 달래요")
library(ggplot2)
library(dplyr)
library(reshape2)
library(RColorBrewer)

data <- read.csv("버스노선별이용현황합계.csv")
long_data <- melt(data, id = c('버스노선번호'), variable.name = "승하차", value.name = "이용승객수")
long_data$이용승객수 <- long_data$이용승객수/1000
long_data <- arrange(long_data, 버스노선번호)

long_data <- long_data %>%
  mutate(탑승객 = 이용승객수 * 1000) %>%
  mutate(ypos = 이용승객수 * 0.9)

ggplot(long_data, aes(x=버스노선번호, y=이용승객수, group = 승하차, color = 승하차)) +
         geom_bar(position = 'dodge', stat='identity', width=0.4) +
         ggtitle("서울 주요 마을 버스 이용 승객 현황 (2014년 1월)") +
         theme(plot.title = element_text(hjust = 0.5)) +
         theme(plot.title=element_text(face="bold", size=10, color="blue")) +
         geom_text(aes(y=ypos, label=탑승객), color = 'red')
    
       