# 반복문
number <- 0
while (number < 5) {
  print(number)
  number <- number + 1
}

number <- 0
while (number < 5) {
  print(number)
  if (number == 3)     #if 다음 한 문장 오면 {} 생략
    break
  number <- number + 1
}

number <- -1
while (number <= 10) {
  number <- number + 1
  if (number %% 2 == 1)     #if 다음 한 문장 오면 {} 생략
    next
  print(number)
}

for (i in 1:10) {
  print(i)
}

sum <- 0
for (i in 1:100) {
  sum <- sum + i
}
print(sum)

# 1~100 3의 배수 합계

sum <- 0
for (i in 1:100) {
  if (i %% 3 == 0)
  sum <- sum + i
}
print(sum)

multiple <- function(limit, number) {
  sum <- 0
  for (i in 1:limit) {
    if (i %% number == 0)
      sum <- sum + i
  }
  return(sum)
}
multiple(1000, 2)

squre <- function(x,y) {
  result = x^y
  return(result)
}
squre(2,3)


library(stringr)

for (i in 1:5) {
  line <- ''
  for(k in 1:i) {
    line <- str_c(line, '#')
  }
  print(line)
}


for (i in 1:5) {
  line <- ''
  if (i != 1) {
    for (k in 1:(i-1))
      line <- str_c(line, ' ')
  }
  for (k in i:5) {
    line <- str_c(line,'#')
  }
  print(line)
}


# 1. 구구단

sum <- 2
for (i in 2:9) {
  for (k in 1:9) {
    result = sum * k
    cat(i,'*',k,'=',result,'\n')
  }
  sum <- sum + 1
}

# 2. Diamond 그리기

while (T) {
  for (i in 1:4) {
    line <- ''
    if (i != 4) {
      for (k in 1:(3 - (i - 1)))
        line <- str_c(line, ' ')
    }
    for (k in 1:(2*i - 1))
      line <- str_c(line, '#')
    print(line)
  }
  for (i in 3:1) {
    line <- ''
    for (k in 1:(3 - (i - 1)))
      line <- str_c(line, ' ')
    for (k in 1:(2*i - 1))
      line <- str_c(line, '#')
    print(line)
  }
  break;
}

#3. 약수 구하는 함수
getDenominator <- function(x) {
  den <- c(1)
  if (x >= 2) {
    for (i in 2:x) {
      if (x %% i == 0)
        den <- c(den, i)
    }
  }
  return(den)
}
getDenominator(3)

# for loop 추가

sum <- 0
for (i in seq(3, 100, 3)) {
  sum <- sum + i
}
print(sum)

sum <- 0
for (i in seq(1, 0, 1)) {
  sum <- sum + i
}
print(i)

