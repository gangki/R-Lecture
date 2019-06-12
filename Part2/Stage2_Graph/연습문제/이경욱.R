# hiphop.txt 파일을 가지고 다음 문제를 해결하여 파워포인트 파일로 제출하시오.
# 1. 워드 클라우드 만들기

setwd("D:/Workspace/R-Lecture/Part2/Stage2_Graph/연습문제")
library(KoNLP)
library("tm")
library(wordcloud)
library(RColorBrewer)
library(ggplot2)
library(dplyr)

# 한글 전처리
data1 <- readLines("hiphop.txt")
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
head(unlist(data2), 30)
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x) >= 2} ,data3)
txt <- readLines("hiphop_gsub.txt")
cnt_txt <- length(txt)
cnt_txt
i <- 1
for( i in 1:cnt_txt) {
  data3 <-gsub((txt[i]),"",data3)     
}
write(unlist(data3), "hiphop_2.txt")

wordcount <- table(data3)
head(sort(wordcount, decreasing = T), 10)

#영어 전처리
data_1 <- readLines("hiphop_2.txt")
corp1 <- VCorpus(VectorSource(data_1)) 
inspect(corp1)
tdm <- TermDocumentMatrix(corp1)
m <- as.matrix(tdm)
corp2 <- tm_map(corp1, stripWhitespace) 
corp2 <- tm_map(corp2, tolower) 
corp2 <- tm_map(corp2, removeNumbers) 
corp2 <- tm_map(corp2, removePunctuation) 
corp2 <- tm_map(corp2, PlainTextDocument) 
sword2 <- c(stopwords('en'), "and", "but", "not", "’m", "’re", "em", "ma", "don", "toda", "gir", "ban", "ba", "wa", "da", "bab", "tha", "worl","wron", "fl") 
corp2 <- tm_map(corp2, removeWords, sword2) 

dataframe <- data.frame(text=unlist(sapply(corp2, `[`, "content")), stringsAsFactors=F)
write.table(dataframe,"hiphop_3.txt", row.names=FALSE)
keyword <- read.table("hiphop_3.txt")
wordcount_2 <- table(keyword)
head(sort(wordcount_2, decreasing = T), 100)

palete <- brewer.pal(9,"Set1")
wordcloud(names(wordcount_2), freq=wordcount_2, scale=c(5,1), rot.per=0.25, min.freq=3,
          random.order=F, random.color=T, colors=palete)
legend(0.3,1,"Hip-hop Key word", cex=0.8, fill=NA, border=NA, bg="white",
       text.col="red", text.font=2, box.col="red")

# 2. Top 10 단어에 대해서 원 그래프 만들기 (ggplot 사용할 것)
top10 <- head(sort(wordcount_2, decreasing=T),10)
str(top10)
df_top10 <- as.data.frame(top10)
str(df_top10)

options(digits = 2) # 전체 옵션, .O 쓰겠다
df_top10 <- df_top10 %>%
  mutate(pct = Freq / sum(Freq) * 100) %>%
  mutate(ylabel = paste(keyword, "\n", "(", sprintf("%4.1f", pct), '%',")", sep = '')) %>%
  mutate(ypos = cumsum(pct) - 0.5 * pct) %>%
  arrange(desc(Freq)) 

ggplot(df_top10, aes(x='', y=pct, fill=keyword)) +
  geom_bar(width=1, stat='identity') +
  ggtitle("Hip-hop Key word") +
  theme(plot.title = element_text(hjust = 0.5)) +
  coord_polar("y", start = 0) +
  geom_text(aes(y=ypos, label=ylabel), color = 'black')


# 3. Top 10 단어에 대해서 막대 그래프 만들기 (ggplot 사용할 것)

df_top10 <- df_top10 %>%
  mutate(ylabel = paste(keyword, "(", sprintf("%4.1f", pct), '%',")"))

ggplot(df_top10, aes(x='', y=pct, fill=keyword)) +
  geom_bar(width=1, stat='identity') +
  ggtitle("Hip-hop Key word") +
  theme(plot.title = element_text(hjust = 0.5)) +
  geom_text(aes(y=ypos, label=ylabel), color = 'black')


