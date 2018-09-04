# 15. R 내장 함수, 변수 타입과 데이터 구조

# R 내장 함수로 데이터 추출하기
# 행 번호로 행 추출하기

# 데이터 준비하기
exam <- read.csv("E:/08_R_20_jmj/HisRClass/Data/csv_exam.csv")

# 행 번호로 행 추출하기 

# 대괄호안 쉼표 기준, 왼쪽에 행 번호(인덱스) 입력 

# • 인덱스(Index) : 데이터의 위치 또는 순서를 의미하는 값
# • 인덱싱(Indexing) : 인덱스를 이용해 데이터를 추출하는 작업

exam[]    # 조건 없이 전체 데이터 출력 

# exam[행,열]

exam[1,]    # 1 행 추출 

exam[2,]    # 2 행 추출

# 조건을 충족하는 행 추출하기 
exam[exam$class == 1,]    # class가 1인 행 추출 

exam[exam$math >= 80,]    # 수학점수가 80점 이상인 행 추출 

# 1반 이면서 수학점수가 50점 이상 
exam[exam$class == 1 & exam$math >= 50,]

# 영어점수가 90점 미만이거나 과학점수가 50점 미만 
exam[exam$english < 90 | exam$science < 50,]

# 열 번호로 변수 추출하기 

# 대괄호안 쉼표 오른쪽에 조건을 입력 
exam[,1]    # 첫 번째 열 추출 

exam[,2]    # 두 번째 열 추출

exam[,3]    # 세 번째 열 추출 

# 변수명으로 변수 추출하기 
exam[, "class"]    # class 변수 추출 

exam[, "math"]     # math 변수 추출 

exam[,c("class", "math", "english")]    # class, math, english 변수 추출 

# 행, 변수 동시 추출하기 

# 행, 변수 모두 인덱스 
exam[1,3]

# 행 인덱스, 열 변수명 
exam[5, "english"]

# 행 부등호 조건, 열 변수명 
exam[exam$math >= 50, "english"]

# 행 부등호 조건, 열 변수명 
exam[exam$math >= 50, "english"]

# 행 부등호 조건, 열 변수명 
exam[exam$math >= 50, c("english", "science")]

# dplyr과 내장 함수의 차이

# 문제) 수학 점수 50 이상, 영어 점수 80 이상인 학생들을 대상으로 각 반의 전 과목 총평균을 구하라.

# 내장함수 코드 
exam$tot = (exam$math + exam$english + exam$science) / 3
aggregate(data = exam[exam$math >= 50 & exam$english >= 80,], tot~class,mean)

# dplyr 코드 

library(dplyr)

exam %>%
  filter(math >= 50 & english >= 80) %>% 
  mutate(tot = (math + english + science) / 3) %>% 
  group_by(class) %>% 
  summarise(mean = mean(tot))

# 혼자서 해보기 

# mpg 데이터를 이용해서 분석 문제를 해결해 보세요. 

#아래는 dplyr 패키지 함수들을 이용해 "compact"와 "suv" 차종의 '도시 및 고속도로 통합 연비' 평균을 구하는 코드입니다.

mpg = as.data.frame(ggplot2::mpg)    # mpg 데이터 불러오기 

mpg %>%
  mutate(tot = (cty + hwy) / 2) %>%     # 통합 연비 변수 생성 
  filter(class == "compact" | class == "suv") %>%     # compact, suv 추출 
  group_by(class) %>%     # class 별 분리 
  summarise(mean_tot = mean(tot))    # tot 평균 산출 


# Q1. dplyr 대신 R 내장 함수를 이용해 "suv"와 "compact"의 '도시 및 고속도로 통합 연비' 평균을 구해보세요.

mpg$tot = (mpg$cty + mpg$hwy) / 2    # 통합 연비 변수 만들기 

df_comp = mpg[mpg$class == "compact",]    # compact 추출 
df_suv = mpg[mpg$class == "suv",]    #  suv 추출 

mean(df_comp$tot)    # compact의 tot 평균 산출 

mean(df_suv$tot)    # suv의 tot 평균 산출 

