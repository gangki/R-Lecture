var1 <- "aaa" ; var1
var2 <- 111; var2
var3 <- Sys.Date(); var3
var4 <- c("a", "b", "c"); var4
222 -> var5 -> var6 # 이런 헷갈리는 코드는 쓰지 마라 
var5; var6;
var8 <- var9 <- 222 ; var8; var9 # 이런식으로 써라 
string1 <- "Very Easy R Programming" ; string1
string2 <- "I'm Gyeongwwok Lee" ; string2
string3 <- 'He said, "I am single".'; string3
string4 <- "He said, \"I am single\"."; string4

comp <- c(1, "2") 
comp # 자동 형 변환 (숫자 -> 문자) - 작은것에서 큰 것으로 
class(comp)

num1 <- 1
num2 <- 2
num1 + num2
char1 <- "a"
num1 + char1

seq1 <- 1:5 #숫자는 연속 가능 
seq1
seq2 <- 'a':'f' #문자는 연속해서 불가능 

date1 <- seq(from=as.Date('2014-01-01'),to=as.Date('2014-01-31'),by=1)
date1
class(date1)
date2 <- seq(from=as.Date('2019-05-30'),to=as.Date('2020-05-31'),by='month')
date2
date3 <- seq(from=as.Date('2019-05-30'),to=as.Date('2030-05-30'),by='year')
date3

objects()
.hidden <-3
objects()
.hidden #.으로 시작하면 보이지 않음 

rm(string2) # 변수 삭제 
ls()
rm(list=ls()) # 모든 변수 삭제 / 새로운 단원 넘어갈 때
rm(.hidden)

