c(1,2,3,4,5)
c(1,2,3,4,"5") #자동 형 변환 (작은=숫자 -> 큰=문자)
vec1 <- c(1,2,3,4,5)
vec1
vec1[3] #[]안의 숫자는 index / R은 인덱스 숫자가 1부터 시작 
vec1[-3] #3번째만 빼고 보여줘 / 파이썬에서는 제일 오른쪽 부터 -1
vec1[1:3]
length(vec1) # 길이 체크 
vec1[1:(length(vec1)-2)]
vec1[length(vec1)]
vec1[-1:-3]
vec1[2:4]
vec1[2] <- 6; vec1
vec1 <- c(vec1, 7); vec1
vec1[7] <- 8; vec1
vec1[9] <-9; vec1 # 8번째 값을 지정하지 않아 NA
append(vec1,10,after=6) #after 뒤의 숫자는 index이다 (값이 아님)
append(vec1,c(10,11), after=3)
vec1 <- append(vec1,c(10,11), after=3); vec1
vec2 <- c(1,2,3,3,4,5); vec2
append(vec1,100,after=0) #0은 제일 앞에 삽입

c(1,2,3) + c(4,5,6)
c(1,2,3) + 1
var1 <- c(1,2,3)
var2 <- c(4,5,6)
var1 + var2
var3 <- c('3','4','5'); var3;
var1 + var3
union(var1,var3) #합집합, 같은 숫자 1개만, 형변환 
var4 <- c(1,2,3,4,5)
var1; var4
var1 + var4
var5 <- c(1,2,3,4,5,6)
var1 + var5
var1 - var2
var2 <- c(3,4,5)
var1 - var2

setdiff(var1, var2) #차집합
setdiff(var2, var1) #차집합

intersect(var1, var2) #교집합 

fruits <- c(10,20,30)
names(fruits) <- c('apple', 'banana', 'peach')
fruits
var5
var5 <- seq(1:6); var5
var6 <- seq(2,-2); var6
even <- c(2,4,6,8,10)
even <- seq(2,10,2); even
odd <- seq(1,10,2); odd
var8 <- rep(1:3,2); var8 #전체 반복
var9 <- rep(1:3,each=2); var9 #하나씩 반복

length(var1)

5 %in% even #결과는 Logical
4 %in% even

##벡터형 연습문제

date4 <- seq(from=as.Date('2015-01-01'),to=as.Date('2015-01-31'),by=1)
date4

vec1 <- c('사과','배','감','버섯','고구마'); vec1
vec1[-3]

vec1 <- c('봄','여름','가을','겨울')
vec2 <- c('봄','여름','늦여름','초가을')
union(vec1,vec2) #합집합
setdiff(vec1,vec2) #차집합 (순서에 따라 결과값 다름)
intersect(vec1,vec2) #교집합 

setdiff(vec2,vec1) #차집합
intersect(vec2,vec1) #교집합
rm(list=ls())
