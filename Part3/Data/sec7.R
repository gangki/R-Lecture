  # Load and Save Data
list.files()
scan1 <- scan('scan_1.txt')
scan1
scan2 <- scan('scan_2.txt') # 1.00 2.00 3.00 4.00
scan2
scan2 <- scan('scan_2.txt',what=""); scan2
class(scan2)
scan3 <- scan('scan_3.txt',"what="); scan3
scan4 <- scan('scan_4.txt',what=""); scan4
input <- scan() # 사용자로부터 입력 받을 때
input
input <- scan(what="")
input
input3 <- readline() # 한줄 문장 입력받을 때
input3
input4 <- readline("Are you OK? : ")
input4
input5 <- readLines('scan_4.txt')
input5
fruits <- read.table('fruits.txt')
fruits
fruits <- read.table('fruits.txt', header=T) # 제목 읽을 때
fruits
fruits2 <- read.table('fruits_2.txt'); fruits2
fruit2 <- read.table('fruits_2.txt',skip=2)
fruit2
fruit2 <- read.table('fruits_2.txt',nrows=2);fruit2
f2top <- read.table('fruits_2.txt',nrows=2); f2top
f2bottom <- read.table('fruits_2.txt',skip=3); f2bottom
fruit3 <- read.csv('fruits_3.csv'); fruit3 # 헤더가 있는것이ㄴ default
fruit4 <- read.csv('fruits_4.csv',header = F)
fruit4
fruit4 <- read.csv('fruits_4.csv')
fruit4
label <- c('NO', 'Name', 'PRICE', 'QTY')
fruit4 <- read.csv('fruits_4.csv', header=F, col.names=label)
fruit4

install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Fruits
write.csv(Fruits, "Fruits_sql.csv", quote=F, row.names = F)
fruits_2 <- read.csv.sql("Fruits_sql.csv",
                         sql = "SELECT * FROM file WHERE year = 2008")
fruits_2
Fruits[c(2==2008)]

install.packages("XLConnect")
installed.packages()
library(XLConnect)

data1 <- loadWorkbook("fruits_6.xls",create = T)
data2 <- readWorksheet(data1, sheet = "sheet1",
                       startRow = 1,
                       endRow = 8,
                       startCol = 1,
                       endCol = 5)
data2

fruits6 <- read.delim("clipboard", header = T)
fruits6

install.packages("readxl")
library("readxl")

data1 <- read_excel("D:/Workspace/R_Data_analysis/Part3/Data/전국_지역별_연도별_1인당_소득현황_2004년_2013년_가로.xlsx", sheet=1, col_names = TRUE, col_types = NULL, na = "", skip=0)
data1

fruits_3 <- subset(Fruits, Fruits$Year==2008)
fruits_3
