library(googleVis)
sort1 <- Fruits$Sales
sort1
sort(sort1) #오름차순
sort(sort1, decreasing = T) #내림차순
install.packages("plyr")
library(plyr)
fruits <- read.csv('fruits_10.csv', header = T)
fruits
ddply(fruits, 'name', summarise, sum_qty=sum(qty), sum_price=sum(price))
ddply(fruits, c('year','name'), summarise, max_qty=max(qty), min_price=min(price))
ddply(fruits, 'name', transform, sum_qty=sum(qty), pct_qty=(100*qty)/sum(qty))

install.packages('dplyr')
library(dplyr)
data1 <- read.csv('2013년_프로야구선수_성적.csv')
data1

data2 <- filter(data1, 경기 >= 120)
data2
data3 <- filter(data1, 경기 >= 120 & 득점 >= 80)
data3
data4 <- filter(data1, 포지션 == '1루수' | 포지션=='3루수')
data4
data4 <- filter(data1, 포지션 %in% c('1루수', '3루수'))
data4
select(data1, 선수명, 포지션, 팀)
select(data1,순위:타수)
select(data1,-홈런,-타점,-도루)
select(data1,-홈런:-도루)

data1 %>%
  select(선수명,팀, 경기, 타수) %>%
  filter(타수 > 400)

data1 %>%
  select(선수명,팀, 경기, 타수) %>%
  filter(타수 > 400) %>%
  arrange(타수)

data1 %>%
  select(선수명,팀, 경기, 타수) %>%
  filter(타수 > 400) %>%
  arrange(desc(타수))

data1 %>%
  select(선수명,팀, 경기, 타수) %>%
  filter(타수 > 400) %>%
  arrange(desc(경기),desc(타수))

data1 %>%
  select(선수명, 팀, 경기, 타수) %>%
  mutate(경기x타수 = 경기*타수) %>%
  arrange(경기x타수)

data1 %>%
  select(선수명, 팀, 출루율, 장타율) %>%
  mutate(OPS = 출루율+장타율) %>%
  arrange(desc(OPS))

data2 <- data1 %>%
  select(선수명, 팀, 출루율, 장타율) %>%
  mutate(OPS = 출루율+장타율) %>%
  arrange(desc(OPS))
data2

data1 %>%
  group_by(팀) %>%
  summarise(average = mean(경기, na.rm = T))

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean), 경기, 타수) # funs deprecated

data1 %>%
  group_by(팀) %>%
  summarise_each(list(mean), 경기, 타수)

data1 %>%
  group_by(팀) %>%
  summarise_each(funs(mean,n()), 경기, 타수)

attach(Fruits)
Fruits

Fruits %>%
  filter(Expenses > 80)

Fruits %>%
  filter(Expenses > 90 & Sales > 90)

Fruits %>%
  filter(Expenses > 90 | Sales > 80)

Fruits %>%
  filter(Expenses %in% c(79,  91))

Fruits %>%
  select(Fruit, Year, Sales)

Fruits %>%
  group_by(Fruit) %>%
  summarise(average = sum(Sales, na.rm = T))

Fruits %>%
  group_by(Fruit) %>%
  summarise_each(list(sum), Sales, Profit)


