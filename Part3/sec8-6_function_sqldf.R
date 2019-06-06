install.packages("sqldf")
library(sqldf)
library(googleVis)

Fruits

sqldf('SELECT * FROM Fruits')
sqldf("select * from Fruits where Fruit like 'Apples'") # " ' ' "
sqldf('select * from Fruits where Fruit like \'Apples\'') # '  \' '\  '
sqldf('SELECT * FROM Fruits limit 3') # limit 0,3
sqldf('SELECT * FROM Fruits limit 3,5')

sqldf('SELECT * FROM Fruits order by year')
sqldf('SELECT * FROM Fruits order by year desc') # Descending(내림차순)

sqldf('SELECT Fruit, sum(Sales) FROM Fruits group by Fruit') # 과일별 판매 합계
sqldf('SELECT Fruit, sum(Sales), sum(Expenses), sum(Profit) FROM Fruits group by Fruit')
sqldf('SELECT year, avg(Sales), avg(Expenses), avg(Profit) FROM Fruits group by Year')
sqldf('SELECT year, avg(Sales), avg(Expenses), avg(Profit) FROM Fruits group by Year order by Profit desc')

sqldf('SELECT min(Sales), max(Sales) FROM Fruits')
sqldf('SELECT * FROM Fruits where Sales=81')

#sub 쿼리로 두 개를 합친다

sqldf('SELECT * FROM Fruits where Sales=
      (select min(Sales) from Fruits)')
sqldf('SELECT * FROM Fruits where Expenses=
      (select max(Expenses) from Fruits)')
sqldf('SELECT * FROM Fruits where Sales in (select min(Sales), max(Sales) from Fruits)') # 에러코드, 나중에 다시 알려주신다고 함

song <- read.csv("song.csv") # 2가지 문제 : 한글깨짐, Header 없음 
song 
song <- read.csv("song.csv", header = F, fileEncoding = 'utf8') 
song

names(song) <- c('_id', 'title', 'lyrics', 'girl_group_id');
song

girl_group <- read.csv("girl_group.csv", header = F, fileEncoding = 'utf8')
girl_group

names(girl_group) <- c('_id', 'name', 'debut');
girl_group

sqldf("SELECT gg._id, gg.name, gg.debut, s.title 
      FROM girl_group AS gg 
      INNER JOIN song AS s 		
      ON gg._id = s.girl_group_id")

sqldf(c('UPDATE Fruits SET Profit=50 WHERE Fruit=\'Apples\' AND Year=2008', 'SELECT * FROM Fruits'))
Fruits
      