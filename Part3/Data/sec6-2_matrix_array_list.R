mat1 <- matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4), nrow=2); mat2
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow = T); mat3

mat3[1,1]
mat3[1,]
mat3[,1]

mat4 <- matrix(seq(1:9), nrow=3, byrow=T); mat4
mat4 <- rbind(mat4, c(10,11,12)); mat4
mat4 <- cbind(mat4, c(13,14,15,16)); mat4
mat5 <- matrix(c('a','b','c','d'),nrow=2,byrow=T)
mat5
mat5 <- cbind(mat5,c('e','f')); mat5
colnames(mat5) <- c('First', 'Second', 'Third'); mat5

seasons <- matrix(c('봄','여름','가을','겨울'), nrow=2); seasons
seasons <- matrix(c('봄','여름','가을','겨울'), nrow=2, byrow=T); seasons

seasons[,2]

seasons <- rbind(seasons,c('초봄','초가을')); seasons
seasons <- cbind(seasons,c('초여름','초겨울','한겨울')); seasons

#Array

arry1 <- array(c(1:12), dim=c(4,3)); arry1
arry1 <- array(c(1:12), dim=c(4,3), byrow=T); arry1   # byrow 사용 x
arry2 <- array(c(1:12), dim=c(2,2,3)); arry2
arry2[1,1,3]
arry2[1,,]

# List
list1 <- list(name='홍길동', address='전국', tel='010-1234-5678', age=300)
list1
list1$name
list1$address
list1[1:3]
list1[4]
list1$birth <- '1719-10-23' #list 추가
list1
list1$name <- c('Seo','James')
list1
list1$birth <- NULL   #list 삭제
rm(list=ls())
