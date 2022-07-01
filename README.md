# :woman_student: OracleSemiProject (오라클 세미 프로젝트) :100:  

#### 	:black_medium_small_square: 주제: 성적처리시스템 
:black_medium_small_square: 기간 : 20220315(화)~20220320(일)

:black_medium_small_square: 팀원 : 이시우(팀장) 김상기 김정용 우수정 이아린 이호석 

#
### :small_orange_diamond: 프로젝트 소개
주어진 요구분석서를 바탕으로 DB 논리 및 물리 설계 진행

총 13개 테이블로 구성

요구분석서를 분석하여 필요한 쿼리문, 프로시저, 트리거, 뷰 등 작성
   
### :small_orange_diamond: ERD
![논리ERD](https://user-images.githubusercontent.com/99342672/176953011-27f0ba53-b5c2-48dc-844a-60c80ee09454.png)

### :small_orange_diamond: 프로젝트 진행과정
팀원들과 함께  
① 요구분석서 분석  
② DB 논리 및 물리설계  
③ 요구분석서 바탕으로 필요 쿼리/프로시저 등 정리 후,  

역할 분담하여  
④ 각자 맡은 부분 쿼리문 작성 후,  

모여서  
⑤ 테스트 진행 및 오류 수정   
⑥ 코드 정리 및 취합  


### :small_orange_diamond: 배운점
- 로그인 방법에 따라 테이블의 구조가 달라질 수 있다.
- 복합PK 보다 따로 PK 만들어주는게 좋다.
- 식별자에 의존적이지 않는 건 분리해줘야 한다.
- 날짜컬럼 추가해주면 나중에 데이터 컨트롤하기 좋다.
- 여기저기서 쓰일 것 같은 건 함수로 만들고, 함수로 만들 필요 없는 걸 굳이 함수로 만들 필요 없다.
- 트랜잭션 처리 들어가야 하는 상황에서는 프로시저와 트리거 중 뭐가 바람직한지 논의해서 진행하면 된다.
- 예외처리 시, 팀원끼리 번호 대역대 미리 종류별로 정해놓고 해야한다.

### :small_orange_diamond: 느낀점
> 정규화가 어려웠음  
> View 작성 시, JOIN 지옥..  
> 
> 그냥 쿼리문으로만 간단히 작성해주면 되는 걸, 다 프로시저로 작성해서 예외처리 하고 있었음...!...  
> JDBC 들어가서 알게 되었다..!  





