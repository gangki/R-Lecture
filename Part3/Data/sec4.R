5/2
print(5/2)
print(5%/%2) # 나눗셈의 몫
print(5%%2) # 나눗셈의 나머지
print(5^2)
print(5**2)

100000
10000
10000+10000
100000*2
1 / 1000000
1 / 1000
1 / 10000

'1'+'2'
as.numeric('1')+as.numeric('2')

'first'
"Second"
first #변수
first <- 1
first

class(1)
class('1')

3 & 0
3 | 1
3 | 0
!0
!3
class(!0)

cat(1, NA, 2)
cat(1, NULL, 2)
sum(1,na,2)
sum(1,NA,2)
sum(1,NULL,2)
sum(1, NA, 2, na.rm = T)

class(NA)
class(NULL)

setwd("d:/Workspace/R_Data_Analysis/Part3/data")
txt1 <- read.csv("factor_test.csv")
txt1

factor1 <- factor(txt1$blood)
factor1
gender1 <- factor(txt1$sex)
gender1
summary(factor1)
summary(gender1)
View(txt1)

class(factor1)

Sys.Date()
Sys.time()
date()
class(Sys.Date())
class("2019-05-30")
class(as.Date("2019-05-30"))
as.Date("2019/05/30")
as.Date("01-11-2014")
as.Date("19-05-30")
as.Date("01-11-2014",format="%d-%m-%Y")
as.Date("19-05-30",format="%y-%m-%d")
as.Date("190530",format="%y%m%d")
as.Date("2014년 11월 1일",format="%Y년 %m월 %d일")
as.Date("01112014",format="%d%m%Y")
as.Date("05-30",format="%m-%d")
as.Date(10, origin="2019-05-30")
as.Date(20, origin=date()) #origin은 문자열만 가능 
as.Date(-10, origin="2019-05-30")
"2019-05-30" - "2019-05-27" #문자열 연산 불가능
as.Date("2019-05-30") - as.Date("2019-05-27")
as.Date("2019-05-30") + 10
as.Date("2019-11-14") - Sys.Date()
as.Date(10, Sys.Date())

as.Date("2014-11-01 20:00:00") - as.Date("2014-11-01 18:30:00") #POSIXlt
as.POSIXct("2014-11-01 20:00:00") - as.POSIXct("2014-11-01 18:30:00")

0.491667 * 60 # 분 계산  / 실수는 숫자가 정확히 떨어지지 않음 
0.50002 * 60 # 분 계산 / 실수는 숫자가 정확히 떨어지지 않음 

install.packages("lubridate") #패키지 설치 / 한 번 설치하면 끝  
library(lubridate) #패키지 사용 / 사용할 때마다 불러서 쓴다
now()
date <- now() #R에서는 <- 쓴다  
date
year(date)
month(date)
day(date)
month(date, label = T)
wday(date) #일요일이 1이다.
wday(date,label=T)
date <- date - days(2); date
month(date) <- 2; date
date+years(1);
date <- now()
date+months(3)
date <- hm("22:30") ; date
date <- hms("22:30:15") ; date
