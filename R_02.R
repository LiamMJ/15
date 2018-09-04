# 15-2. 변수 타입

# 변수에는 여러 가지 타입(Type, 속성)이 있음
# • 함수에 따라 적용 가능한 변수 타입 다름
# • 분석 전에 변수 타입이 무엇인지 확인 필요
# • 함수 실행했을 때 오류 발생 또는 예상과 다른 결과가 출력되면 변수 타입 확인 후 함수에 맞게 변경

# • 1. 연속 변수(Continuous Variable) - Numeric 타입
# – 값이 연속적이고 크기를 의미
# – 더하기 빼기, 평균 구하기 등 산술 가능
# – ex) 키, 몸무게, 소득

# • 2. 범주 변수(Categorical Variable) - Factor 타입
# – 값이 대상을 분류하는 의미를 지님
# – 산술 불가능
# – ex) 성별, 거주지


# 변수         Data Type                   예
# --------------------------------------------------------------------------
# 연속 변수     Numeric    키(..., 151, 152, ...), 몸무게(..., 58, 59, ...)

# 범주 변수     Factor     성별(1, 2), 지역(1, 2, 3, 4)

# 변수 타입 간 차이 알아보기 
var1 = c(1,2,3,1,2)    # numeric 변수 생성 
var2 = factor(c(1,2,3,1,2))    # factor 변수 생성 

var1    # numeric 변수 출력 

var2    # factor 변수 출력 

var1 +2    # numeric 변수로 연산 

var2 +2    # factor 변수로 연산 

# 변수 타입 확인하기 
class(var1)

class(var2)

# factor 변수의 구성 범주 확인하기 
levels(var1)

levels(var2)

# 문자로 구성된 factor 변수 
var3 = c("a", "b", "b", "c")    # 문자 변수 생성 

var4 = factor(c("a", "b", "b", "c"))    # 문자로 된 factor 변수 생성 

var3

var4

class(var3)

class(var4)

# 함수마다 적용 가능한 변수 타입이 다르다 
mean(var1)

mean(var2)

# 변수 타입 바꾸기 
var2 = as.numeric(var2)    # numeric 타입으로 변환 

mean(var2)    # 함수 재적용 

class(var2)    # 타입 확인 

levels(var2)    # 범주 확인 

# 변환 함수(Coercion Function)

# 함수                   기능
# --------------------------------------
# as.numeric()     numeric으로 변환
# as.factor()      factor로 변환
# as.character()   character로 변환
# as.Date()        Date로 변환
# as.data.frame()  Data Frame으로 변환

# 혼자서 해보기 

# • Q1. drv 변수의 타입을 확인해 보세요. 
class(mpg$drv)

# • Q2. drv 변수를 as.factor()를 이용해 factor 타입으로 변환한 후 다시 타입을 확인해 보세요. 
as.factor(mpg$drv)

class(mpg$drv)

# • Q3. drv가 어떤 범주로 구성되는지 확인해 보세요.
levels(mpg$drv)
