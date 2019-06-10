# ggplot2 패키지 및 R Markdown 활용
# 다음의 문제를 R Markdown 보고서(HTML 형식)로 제출하시오.


# 문제1) mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 합니다. 
# x축은 cty, y축은 hwy로 된 산점도를 만들어 보세요.
library(dplyr)
library(ggplot2)

mpg
str(mpg)
summary(mpg)

ggplot(mpg, aes(x=cty, y=hwy)) + 
  geom_point(shape = 8, size = 2, color = "red") +
  ggtitle("Scatter Plot : MPG. cty vs. hwy") +
  theme(plot.title = element_text(hjust = 0.5)) # 제목 중앙

# 문제 2) 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 이용해서 전체 인구와 아시아인 인구 간에
# 어떤 관계가 있는지 알아보려고 합니다.
# x축은 poptotal(전체 인구), y축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요. 
# 전체 인구는 50만 명 이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정하세요.

midwest

midwest_select <- subset(midwest, poptotal <= 500000 && popasian <= 10000, select = c(poptotal, popasian))
midwest_select

ggplot(midwest_select, aes(x=poptotal, y=popasian)) + 
  geom_point(shape = 21, size = 2, color = "blue") +
  xlim(0,500000) + ylim(0, 10000) +
  ggtitle("Scatter Plot : midwest. poptotal vs. popasian") +
  theme(plot.title = element_text(hjust = 0.5)) # 제목 중앙

# 문제 3) 어떤 회사에서 생산한 "suv" 차종의 도시 연비가 높은지 알아보려고 합니다. 
# "suv" 차종을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요. 
# 막대는 연비가 높은 순으로 정렬하세요. 

df <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean.cty = mean(cty)) %>% 
  arrange(desc(mean.cty)) %>% 
  head(5)
df

ggplot(df, aes(x = reorder(manufacturer, -mean.cty), y = mean.cty, fill = manufacturer)) + geom_col()

# 문제 4) 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 합니다.
# 자동차 종류별 빈도를 표현한 막대 그래프를 만들어 보세요.

df2 <- mpg %>% 
  group_by(class) %>% 
  summarise(class_n = n()) %>% 
  arrange(desc(class_n))
df2
ggplot(df2, aes(x = reorder(class, -class_n), y = class_n, fill = class)) + geom_col()


# 문제 5) economics 데이터를 이용해서 psavert(개인 저축률)가 시간에 따라서 어떻게 변해왔는지 알아보려고 합니다. 
# 시간에 따른 개인 저축률의 변화를 나타낸 시계열 그래프를 만들어 보세요

economics
str(economics)
head(economics)
tail(economics)

ggplot(economics,aes(x=date,y=psavert,group=1)) + geom_line( )


# 문제 6) class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 cty(도시 연비)가 어떻게 다른지 비교해보려고 합니다.
# 세 차종의 cty를 나타낸 상자 그림을 만들어보세요.

df3 <- mpg %>%
  filter(class %in% c('compact', 'subcompact', 'suv'))
df3

ggplot(df3, aes(x = class, y = cty, fill=class)) +
  geom_boxplot()

# 문제 7) Diamonds 데이터 셋을 이용하여 다음 문제를 해결하세요. 단, 컬러, 제목, x축, y축 등 그래프를 예쁘게 작성하세요.
# cut의 돗수를 보여주는 그래프를 작성하세요.
# cut에 따른 가격의 변화를 보여주는 그래프를 작성하세요. 
# cut과 color에 따른 가격의 변화를 보여주는 그래프를 작성하세요.

# 문제 7.1) # cut의 돗수를 보여주는 그래프를 작성하세요.

diamonds
str(diamonds)
levels(diamonds$cut)
levels(diamonds$clarity)

dia <- diamonds %>%
  group_by(cut) %>%
  summarise(cut_fre = n())
dia
ggplot(dia, aes(x=cut, y=cut_fre, fill = cut)) + geom_bar(stat="identity")

# 문제 7.2) cut에 따른 가격의 변화를 보여주는 그래프를 작성하세요. 

dia1 <- diamonds %>%
  group_by(cut) %>%
  summarise(price_avg = mean(price))
dia1

ggplot(dia1,aes(x=cut,y=price_avg,group=1)) + geom_line( )

# cut과 color에 따른 가격의 변화를 보여주는 그래프를 작성하세요

diamonds

levels(diamonds$cut)
levels(diamonds$color)

dia_cut <- diamonds %>%
  group_by(cut) %>%
  summarise(cut_price = mean(price))

dia_cut

ggplot(dia_cut, aes(x = cut, y = cut_price, fill = cut)) + geom_bar(stat = "identity")

dia_color <- diamonds %>%
  group_by(color) %>%
  summarise(color_price = mean(price))

dia_color

ggplot(dia_color, aes(x = color, y = color_price, fill = color)) + geom_bar(stat = "identity")

       
