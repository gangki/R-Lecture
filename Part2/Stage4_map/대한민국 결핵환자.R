# 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기

install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(devtools)
library(kormaps2014)
library(dplyr)
library(ggiraphExtra)
library(ggplot2)


# 시도별 인구 데이터 
str(changeCode(korpop1))
# 지도 데이터 
str(changeCode(kormap1))

korpop1 <- korpop1 %>%
  rename(pop  = 총인구_명,
         name = 행정구역별_읍면동)

# options(encoding = "UTF-8") 한글이 깨지므로 인코딩을 UTF-8 로 변경 

ggChoropleth(data = korpop1,       # 지도에 표현할 데이터
             aes(fill    = pop,    # 색깔로 표현할 변수
                 map_id  = code,   # 지역 기준 변수
                 tooltip = name),  # 지도 위에 표시할 지역명
             map = kormap1,        # 지도 데이터
             interactive = T)        # 인터랙티브

# 대한민국 시도별 결핵 환자 수

# options(encoding = "UTF-8") 한글이 깨지므로 인코딩을 UTF-8 로 변경 
str(changeCode(tbc))
ggChoropleth(data = tbc,            # 지도에 표현할 데이터
             aes(fill    = NewPts,  # 색깔로 표현할 변수
                 map_id  = code,    # 지역 기준 변수
                 tooltip = name),   # 지도 위에 표시할 지역명
             map = kormap1,         # 지도 데이터
             interactive = T)       # 인터랙티브
