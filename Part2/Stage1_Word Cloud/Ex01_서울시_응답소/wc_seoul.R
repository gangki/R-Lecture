# 예제 1-1 서울시 응답소 페이지 분석하기

setwd('D:/Workspace/R-Lecture/Part2/Stage1_Word Cloud/Ex01_서울시_응답소')
install.packages('rJava')
library(rJava)
install.packages('KoNLP')
library(KoNLP)
install.packages('wordcloud')
library(wordcloud)
useSejongDic() # 업데이트 All
library(RColorBrewer)

data1 <- readLines('seoul_new.txt')
data1
extractNoun('서울시 버스정책을 역행하는 행위를 고발합니다.')
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
head(unlist(data2), 30)
data3 <- unlist(data2)
data3

data3 <- gsub("\\d+","", data3)  # 정규표현식 \\d -> 숫자
data3 <- gsub("서울시","", data3) 
data3 <- gsub("서울","", data3)  
data3 <- gsub("요청","", data3)  
data3 <- gsub("제안","", data3) 
data3 <- gsub(" ","", data3)
data3 <- gsub("-","",data3)
data3

write(unlist(data3),"seoul_2.txt") 
data4 <- read.table("seoul_2.txt")
data4
head(data4, 10)
nrow(data4)
wordcount <- table(data4) 
wordcount
head(sort(wordcount, decreasing=T),20)
data3 <- gsub("OO","",data3)
data3 <- gsub("개선","", data3)
data3 <- gsub("문제","", data3)
data3 <- gsub("관리","", data3)
data3 <- gsub("민원","", data3)
data3 <- gsub("이용","", data3)
data3 <- gsub("관련","", data3)
data3 <- gsub("시장","", data3)
data3
write(unlist(data3),"seoul_3.txt") 
data4 <- read.table("seoul_3.txt")
wordcount <- table(data4) 
wordcount
head(sort(wordcount, decreasing=T),20)

data3 <- gsub("님","", data3)
data3 <- gsub("한","", data3)
data3 <- gsub("동","", data3)
data3 <- gsub("적","", data3)
data3
write(unlist(data3),"seoul_4.txt") 
data5 <- read.table("seoul_4.txt")
wordcount <- table(data5) 
wordcount
head(sort(wordcount, decreasing=T),20)

# word cloud 형태 그래픽으로 출력
set.seed(1234) # 언제 어디서나 같은 랜덤값 출력
palete <- brewer.pal(9,"Spectral")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.1, 
          min.freq=1, random.order=F, random.color=T, colors=palete)
legend(0.3,1 ,"서울시 응답소 요청사항 분석", cex=0.8, fill=NA, border=NA, 
       bg="white", text.col="red", text.font=2, box.col="red")

v3 <- c("봄이 지나면 여름이고 여름이 지나면 가을입니다.",
        "그리고 겨울이죠")
v3
extractNoun(v3)

wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len=62))
palete <- brewer.pal(9,"Set1") 
wordcloud(c(letters, LETTERS, 0:9), seq(1,1000, len=62), colors=palete)

