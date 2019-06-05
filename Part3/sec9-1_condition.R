# 조건문과 반복문
myAbs <- function(x) {
  if (x >= 0) {
    return(x)
  } else {
    return (-x)
  }
}
myAbs(-3.2)
myAbs(4.5)

myAbs2 <- function(x) {
  if (x >= 0) {
    return(x)
  }
  return(-x)
}

myAbs2(-3.2)

myF1 <- function(x) {
  if (x > 0) {
    return (x*x)
  } else {
    return(0)
  }
}
myF1(4.6)
myF1(-2.4)

myF2 <- function(x) {
  if (x > 0) {
    return(2 * x)
  } else if (x == 0) {
    return (0)
  } else {
    return(2 * x)
  }
}
myF2(4.6)
myF2(0)
myF2(-2.4)

number <- scan()
result <- ifelse(number%%2==0,'짝수','홀수')
result

# 연습문제 1

myf1 <- function(x) {
  if(x > 5) {
    return(1)
  } else {
    return(0)
  }
}
myf1(6)
myf1(5)
myf1(0)
myf1(-1)

# 연습문제 2

myf2 <- function(x) {
  if(x >= 0) {
    return(1)
  } else {
    return(0)
  }
}
myf2(0)
myf2(1)
myf2(-1)

# 연습문제 3

myf3 <- function(x,y) {
  if(x > y) {
    return(x - y)
  } else {
    return(y - x)
  }
}
myf3(3,2)
myf3(2,3)

# 연습문제 4

myf4 <- function(x) {
  if (x <= 0) {
    return(0)
  } else if (1<=x && x<=5) {
    return(1)
  } else {
    return(10)
  }
}
myf4(0)
myf4(-1)
myf4(1)
myf4(2)
myf4(3)
myf4(4)
myf4(5)
myf4(6)
myf4(100)

# 연습문제 5

aaa <- scan(what="")
result <- ifelse(aaa == 'Y' || aaa == 'y','Yes','Not Yes')
result

#추가 문제

MyIntD <- function(a,b,c) {
  D = b*b - 4*a*c
  if (D > 0) {
    return(0)
  } else if (D == 0) {
    return(1)
  } else {
    return(0)
  }
}

a <- 1
b <- 2
c <- 1
MyIntD(a,b,c)


MyRealD <- function(a,b,c) {
  D = b*b - 4*a*c
  if (abs(D) < 1e-5) {
    return(1)
  } else if (D > 0) {
    return(2)
  } else {
    return(0)
  }
}

a <- 40.0/39.999999999999
b <- 2.000000001
c <- 1.000000002
MyRealD(a,b,c)



