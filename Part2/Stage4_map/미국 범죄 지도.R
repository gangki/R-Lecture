# 지도 시각화

install.packages("ggiraphExtra")
install.packages("maps")
install.packages("mapproj")
library(mapproj)
library(maps)
library(ggiraphExtra)
library(tibble)
library(ggplot2)
library(dplyr)
library(reshape2)
library(gridExtra)

str(USArrests)
head(USArrests)
tail(USArrests)
summary(USArrests)

crime <- rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state)

# 미국 주 지도 데이터 준비하기
states_map <- map_data("state")
str(states_map)

# 단계 구분도 만들기
ggChoropleth(data = crime,
             aes(fill = Murder,      # 색의 변화 기준이 되는 변수 
                 map_id = state),    # 지역 기준 변수 == 지역 명 변수
             map = states_map)       # 배경 지도 데이터 

m <- ggChoropleth(data = crime,
             aes(fill = Murder,      # 색의 변화 기준이 되는 변수 
                 map_id = state),    # 지역 기준 변수 == 지역 명 변수
             map = states_map,       # 배경 지도 데이터 
             interactive = T)        # 인터랙티브 유무

# 미국 주별 강간범죄 분포
r <- ggChoropleth(data = crime,
             aes(fill = Rape,      # 색의 변화 기준이 되는 변수 
                 map_id = state),    # 지역 기준 변수 == 지역 명 변수
             map = states_map,       # 배경 지도 데이터 
             interactive = T)        # 인터랙티브 유무

# 미국 주별 강도범죄 분포
a <- ggChoropleth(data = crime,
             aes(fill = Assault,      # 색의 변화 기준이 되는 변수 
                 map_id = state),    # 지역 기준 변수 == 지역 명 변수
             map = states_map,       # 배경 지도 데이터 
             interactive = T)        # 인터랙티브 유무

# 미국 주별 도시비율
u <- ggChoropleth(data = crime,
             aes(fill = UrbanPop,      # 색의 변화 기준이 되는 변수 
                 map_id = state),    # 지역 기준 변수 == 지역 명 변수
             map = states_map,       # 배경 지도 데이터 
             interactive = T)        # 인터랙티브 유무


head(crime)

windows()
grid.arrange(m, r, a, u, ncol=2)
