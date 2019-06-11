# 예제 1-2. 여고생은 어디를 가장 고치고 싶을까요?

setwd("D:/Workspace/R-Lecture/Part2/Stage1_Word Cloud/Ex02_여고생_성형")
library(KoNLP)  # 필수 패키지 로딩
library(wordcloud) # 필수 패키지 로딩
useSejongDic( ) 

data1 <- readLines("remake.txt")
data1 # 파일에서 읽은 원시 데이터
data2 <- sapply(data1,extractNoun, USE.NAMES = F)
data2 # 리스트 형태의 명사만 추출된 데이터
data3 <- unlist(data2)
data3 # 명사만 추출된 데이터
data3 <- Filter(function(x) {nchar(x) <= 10}, data3) # 데이터 10개 이하인것만 추출
head(unlist(data3), 30) # 10글자보다 큰 데이터는 제거된 데이터

data3 <- gsub("\\d+","", data3)
data3 <- gsub("쌍수","쌍꺼풀",data3)
data3 <- gsub("쌍커풀","쌍꺼풀",data3)
data3 <- gsub("메부리코","매부리코",data3)
data3 <- gsub("\\.","",data3)
data3 <- gsub(" ","",data3)
data3 <- gsub("\\'","",data3)
data3

write(unlist(data3),"remake_2.txt") 
data4 <- read.table("remake_2.txt")
data4
nrow(data4) 
wordcount <- table(data4) 
wordcount
head(sort(wordcount, decreasing=T),50)

txt <- readLines("성형gsub.txt")
txt
cnt_txt <- length(txt)
i <- 1
for(i in 1:cnt_txt) {
  data3 <- gsub((txt[i]), "", data3)
}

data3 <- Filter(function(x) {nchar(x) >=2 }, data3)
write(unlist(data3), "remake_2.txt")
data4 <- read.table("remake_2.txt")
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 50)

palete <- brewer.pal(9,"Set3") 
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=2,
            random.order=F,random.color=T,colors=palete)
legend(0.3,1 ,"여고생들이 선호하는 성형수술 부위",
                    cex=0.8,fill=NA,border=NA,bg="white" ,
                    text.col="red",text.font=2,box.col="red")

