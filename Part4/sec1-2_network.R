# 그래프 기초
setwd("d:/Workspace/R-Lecture/Part4")
var1 <- 1:5
plot(var1)
var1 <- 5:1
plot(var1)
var2 <- c(2,2,2)
plot(var2)
x <- 1:3
y <- 4:2
plot(x,y)
plot(x, y, xlim = c(0, 5), ylim = c(0, 5))
plot(x, y, xlim = c(0, 5), ylim = c(0, 5),
     xlab = "X축값", ylab = "Y축값", main = "Plot Test")


v1 <- c(100, 130, 120, 160, 150)
plot(v1, type = 'o', col = 'red', ylim = c(0,200), axes = FALSE, ann = FALSE)
axis(1, at = 1:5, lab = c("MON", "TUE", "WED", "THU", "FRI"))
axis(2, ylim = c(0,200))
title(main = "FRUIT", col.main = "red", font.main = 4)
title(xlab = "DAY", col.lab = "black")
title(ylab = "PRICE", col.lab = "blue")

par(mfrow = c(1,3))
plot(v1, type = 'o')
plot(v1, type = 's')
plot(v1, type = 'l')

par(mfrow = c(1,3))
pie(v1)
plot(v1, type = 'o')
barplot(v1)

a <- 1:3
par(mfrow = c(1,1))
plot(a, xlab = 'aaa')
par(mgp = c(3,1,0))

x <- 1:5
barplot(x)
barplot(x, horiz = T)

x <- matrix(c(5,4,3,2), 2, 2)
barplot(x)
barplot(x, beside = T)
barplot(x, beside = T, names = c(5,3), col = c("green", "yellow"), horiz = T)
par(oma = c(1,0.5,1,0.5))
barplot(x, names = c(5,3), col = c("green", "yellow"), horiz = T)
barplot(x, names = c(5,3), col = c("green", "yellow"), horiz = T, xlim = c(0,12))

par(oma = c(0, 0, 0, 0))
v1 <- c(100, 120, 140, 160, 180)
v2 <- c(120, 130, 150, 140, 170)
v3 <- c(140, 170, 120, 110, 160)

qty <- data.frame(BANANA = v1, CHERRY = v2, ORANGE = v3)
qty

barplot(as.matrix(qty), main = "Fruit's Sales QTY", beside = T, col = rainbow(nrow(qty)), ylim = c(0, 400))
legend(14, 400, c("MON", "TUE", "WED", "THU", "FRI"), cex = 0.8, fill = rainbow(nrow(qty)))

barplot(t(qty),main="Fruits Sales QTY",ylim=c(0,900),
        col=rainbow(length(qty)),space=0.1,cex.axis=0.8,las=1,
        names.arg=c("MON","TUE","WED","THU","FRI"),cex=0.8)

legend(0.2,800,names(qty),cex=0.7,fill=rainbow(length(qty)) )

peach <- c(180,200,250,198,170)
> colors <- c( )
> for ( i in 1:length(peach))
     { if (peach[i] >= 200 )
           { colors <- c(colors,"red") }
         else if ( peach[i] >= 180 )
             { colors <- c(colors,"yellow") }
         else 
             { colors <- c(colors,"green") }
     }

barplot(peach,main="Peach Sales QTY" , 
        names.arg=c("MON","TUE","WED","THU","FRI"),col=colors)

height <- c(182,175,167,172,163,178,181,166,159,155)
par(mfrow = c(1,2))
barplot(height)
hist(height)

par(mfrow = c(1,1))
hist(height,main="histogram of height")

par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1 <- c(10,20,30,40)
pie(p1,radius=1)
pie(p1,radius=1, init.angle = 270)
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
         label=c("Week 1" ,"Week 2" , "Week 3" ,"Week 4"))

pct <- round(p1/sum(p1) * 100,1)
lab <- paste(pct,"%")
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)), label=lab)
legend(1,1.1,c("Week 1","Week 2","Week 3","Week 4"), cex=0.5, fill=rainbow(length(p1)))

install.packages("plotrix")
library(plotrix)

p1 <- c(10,20,30,40,50)
f_day <- round(p1/sum(p1)*100,1)
f_label <- paste(f_day,"%")
pie3D(p1,main="3D Pie Chart",col=rainbow(length(p1)),
               cex=0.5,labels=f_label,explode=0.05)
legend(0.78,1.14,c("MON","TUE","WED","THU","FRI"),cex=0.6,
                 fill=rainbow(length(p1)))

v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)

boxplot(v1,v2,v3)
boxplot(v1,v2,v3,col=c("blue","yellow","pink"),
                 names=c("Blue","Yellow","Pink"),
                 horizontal=T)

install.packages("igraph")
library(igraph)
g1 <- graph(c(1,2, 2,3, 2,4, 1,4, 5,5, 3,6))
plot(g1)
str(g1) # 데이터 구조를 사전파악하기 위해 씀 / 요약 통계는 describe또는 head, tail, 산점도 등을 본다

name <- c('서진수 대표이사','일지매 부장','김유신 과장','손흥민 대리','노정호 대리',
               '이순신 부장','유관순 과장','신사임당 대리','강감찬 부장','광개토 과장','정몽주 대리')
pemp <- c('서진수 대표이사','서진수 대표이사','일지매 부장','김유신 과장','김유신 과장',
                        '서진수 대표이사','이순신 부장', '유관순 과장','서진수 대표이사',
                        '강감찬 부장','광개토 과장')
emp <- data.frame(이름=name,상사이름=pemp)
emp  

g <- graph.data.frame(emp, directed = T)
plot(g, layout = layout.fruchterman.reingold, vertex.size = 8, edge.arrow.size = 0.5)
str(g)

png("Graph/network_2.png", width = 600, height = 600)
plot(g, layout = layout.fruchterman.reingold, vertex.size = 8, edge.arrow.size = 0.5)
dev.off()

g3 <- graph.data.frame(emp,directed = F)
plot(g3,layout = layout.fruchterman.reingold, vertex.size = 8, edge.arrow.size = 0.5 , vertex.label = NA)
plot(g3,layout = layout.random, vertex.size = 8, edge.arrow.size = 0.5 , vertex.label = NA)

install.packages("devtools")
library(devtools)
install.packages("d3Network")
library(d3Network)
install_github("christophergandrud/d3Network")
library(RCurl)
library(d3Network)
name <- c('Angela Bassett','Jessica Lange','Winona Ryder','Michelle Pfeiffer',
             'Whoopi Goldberg','Emma Thompson','Julia Roberts','Sharon Stone','Meryl Streep',
             'Susan Sarandon','Nicole Kidman')

pemp <- c('Angela Bassett','Angela Bassett','Jessica Lange','Winona Ryder','Winona Ryder',
                        'Angela Bassett','Emma Thompson', 'Julia Roberts','Angela Bassett',
                        'Meryl Streep','Susan Sarandon')

emp <- data.frame(이름=name,상사이름=pemp)
d3SimpleNetwork(emp,width=600,height=600,file="D:/Workspace/R-Lecture/Part4/Graph/d3.html")

g <- read.csv("군집분석.csv",head=T)
graph <- data.frame(학생=g$학생,교수=g$교수)
g<-graph.data.frame(graph, directed=T)
plot(g,layout=layout.fruchterman.reingold,vertex.size=2,edge.arrow.size=0.5, ,vertex.color="green",vertex.label=NA)
plot(g,layout=layout.kamada.kawai,vertex.size=2,edge.arrow.size=0.5, vertex.label=NA)


V(g)$name
gubun1 <- V(g)$name
gubun1     
library(stringr)
gubun <- str_sub(gubun1, start=1, end=1)
gubun


colors <- c()
 for ( i in 1:length(gubun)) {
          if (gubun[i] == 'S' ) {
                     colors <- c(colors,"red") }
          else { 
                    colors <- c(colors,"green") }
         }

sizes <- c()
 for ( i in 1:length(gubun)) {
           if (gubun[i] == 'S' ) {
                      sizes <- c(sizes,2) }
          else { 
                    sizes <- c(sizes,6) }
          }

plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5, ,vertex.color=colors)
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0.5, ,vertex.color=colors,vertex.label=NA)
plot(g,layout=layout.fruchterman.reingold,vertex.size=sizes,edge.arrow.size=0, ,vertex.color=colors,vertex.label=NA)
plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0, ,vertex.color=colors,vertex.label=NA)

shapes <- c()
for ( i in 1:length(gubun)) {
          if (gubun[i] == 'S' ) {
                     shapes <- c(shapes,"circle") }
          else { 
                    shapes <- c(shapes,"square") }
         }

plot(g,layout=layout.kamada.kawai,vertex.size=sizes,edge.arrow.size=0, ,vertex.color=colors,vertex.label=NA,vertex.shape=shapes)

library(devtools)
virus1 <- read.csv("메르스전염현황.csv",header=T)
d3SimpleNetwork(virus1,width=600,height=600,file="D:/Workspace/R-Lecture/Part4/Graph/mers.html")


