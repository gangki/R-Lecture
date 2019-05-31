# Function
mat1 <- matrix(c(1:6),nrow = 2,byrow = T); mat1
a <- rep(1,3)
sweep(mat1,2,a)
b <- matrix(c(2,2))
sweep(mat1,1,b)

a <- c(1,2,3,4,5); length(a)
length(mat1)
library(googleVis)
length(Fruits)

log(10)
log10(10)
sin(pi)
abs(-1)
v2 <- c(1,-2,3,-4)
abs(v2)
ceiling(-2.1)
floor(-2.7)
round(2.5)
round(2.51)
?round()
choose(5, 3)

myfunct <- function() {
  return(10)
}
myfunct()

myfunct2 <- function(x) {
  y = x * x;
  return(y)
}

myfunct2(-3)

func_test1 <- function(a,b){
  c = a - b
  return(abs(c))
}
func_test1(2,4)
  