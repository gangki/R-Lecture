install.packages("ggplot2")
library(ggplot2)
mpg

View(mpg)

#문제 1번 / 정답 : 배기량이 4 이하인 자동차가 더 높다

mpg %>%
  filter(displ <= 4) %>%
  summarise(average = mean(hwy, na.rm = T))


mpg %>%
  filter(displ >= 5) %>%
  summarise(average = mean(hwy, na.rm = T))

mpg4 <- filter(mpg, displ <= 4);
mpg5 <- filter(mpg, displ >= 5);
mean(mpg4$hwy); mean(mpg5$hwy);


#문제 2번 / 정답 : toyota가 더 높다

mpg %>%
  group_by(manufacturer) %>%
  summarise(average = mean(cty)) %>%
  filter(manufacturer == c('audi', 'toyota'))

# 문제 3번 / 정답 : 22.5

mpg %>%
  filter(manufacturer %in% c('chevrolet', 'ford', 'honda')) %>%
  summarise(average = mean(hwy, na.rm = T))
  
# 문제 4번 / 변수명 : class_cty로 추출

class_cty <- mpg %>%
  select(class, cty)
class_cty %>%
  filter(class == 'compact')

# 문제 5번 / 정답 : compact

class_cty %>%
  filter(class == c('suv', 'compact')) %>%
  #filter(class %in% c('suv', 'compact')) %>%
  group_by(class) %>%
  summarise(average = mean(cty))

# 문제 6번 / 

mpg %>%
  filter(manufacturer == 'audi') %>%
  arrange(desc(hwy)) %>%
  head(5)

# 문제 7번 

mpg_copy <- mpg %>%
  mutate(합산연비 = cty + hwy) %>%
  mutate(평균연비 = 합산연비 / 2)

mpg_copy %>%
  group_by(model) %>%
  summarise(average = mean(평균연비)) %>%
  arrange(desc(average)) %>%
  head(3)

mpg_copy %>%
  mutate(합산연비 = cty + hwy,평균연비 = 합산연비 / 2)%>%
  group_by(model) %>%
  summarise(average = mean(평균연비)) %>%
  arrange(desc(average)) %>%
  head(3)
            
# 문제 8번 
mpg %>%
  group_by(class) %>%
  summarise(average = mean(cty))

# 문제 9번
mpg %>%
  group_by(class) %>%
  summarise(average = mean(cty)) %>%
  arrange(desc(average))

# 문제 10번

mpg %>%
  group_by(manufacturer) %>%
  summarise(average = mean(hwy)) %>%
  arrange(desc(average)) %>%
  head(3)

# 문제 11번

mpg %>%
  group_by(manufacturer) %>%
  filter(class == 'compact') %>%
  summarise(count = n()) %>%
  arrange(desc(count))


  
  
 


