setwd("D:/Workspace/R-Lecture/Part2/Stage3_StructureData/도전미션 3-1 - 프로 야구 선수들이 밥값 하나요")

library(ggplot2)
library(reshape2)

count <- read.csv("삼성라이온즈.csv")

count2 <- count %>%
  mutate(연봉대비출루율 = count)
