# 예제 2-1.  "제주도 여행코스 추천" 검색어 결과를 그래프로 표시하기

setwd("D:/Workspace/R-Lecture/Part2/Stage2_Graph/Ex01_Jeju")
library(KoNLP)  
library(wordcloud)
library(stringr)  # <- 패키지를 로딩합니다
library(RColorBrewer)
useSejongDic() 
mergeUserDic(data.frame(readLines("제주도여행지.txt"), "ncn"))
library(ggplot2)
library(dplyr)

txt <- readLines("jeju.txt") 
place <- sapply(txt,extractNoun,USE.NAMES=F)
place   
head(unlist(place), 30)
cdata <- unlist(place) 
place <- str_replace_all(cdata,"[^[:alpha:]]","") 
place <- gsub(" ","", place)
txt <- readLines("제주도여행코스gsub.txt")
txt
cnt_txt <- length(txt)
cnt_txt
for( i in 1:cnt_txt) {
      place <-gsub((txt[i]),"",place)     
      }
place
place <- Filter(function(x) {nchar(x) >= 2} ,place)
write(unlist(place),"jeju_2.txt") 
rev <- read.table("jeju_2.txt")
nrow(rev)
wordcount <- table(rev) 
head(sort(wordcount, decreasing=T),30)

palete <- brewer.pal(10, "Paired")
top10 <- head(sort(wordcount, decreasing=T),10)
pie(top10, col = palete, radius = 1, main="제주도 추천 여행 코스 TOP 10")

pct <- round(top10/sum(top10) * 100 ,1)
names(top10)
lab <- paste(names(top10),"\n", pct, "%", sep = "") # sep = "" : 공백 제거
lab
pie(top10,main="제주도 추천 여행 코스 TOP 10",col=palete, 
     cex=0.8,labels = lab)

# ggplot2를 이용하여 pie차트 그리기
top10
str(top10)
df_top10 <- as.data.frame(top10)
str(top10)

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity')

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar("y", start = 0)

options(digits = 2) # 전체 옵션, .O 쓰겠다
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  mutate(ylabel = paste(rev, "\n", sprintf("%4.1f", pct), '%', sep = '')) %>%
  mutate(ypos = cumsum(pct) - 0.5 * pct)
  arrange(desc(rev)) %>%

#mutate(ylabel = paste(pct, '%', sep = '')) 이렇게 하면 소수점 전부 표시됨
df_top10

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  ggtitle("제주도 추천 여행코스 TOP 10") +
  geom_text(aes(y=ypos, label=ylabel), color = 'black')

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar("y", start = 0) +
  ggtitle("제주도 추천 여행코스 TOP 10") +
  geom_text(aes(y=ypos, label=ylabel), color = 'black')



