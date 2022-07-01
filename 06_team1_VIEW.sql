SELECT USER
FROM DUAL;
--==>> TEAM1
--------------------------------------------------------------------------------
-- ▣▣▣▣▣▣▣▣▣▣▣▣   [ 뷰(VIEW) 모음 ]   ▣▣▣▣▣▣▣▣▣▣▣▣    -- 
--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈◈   [ ①교수 - 로그인]    ◈◈◈◈◈◈◈◈◈◈◈◈ --
CREATE OR REPLACE VIEW VIEW_PROFESSOR_LOGIN
AS
SELECT PF.PROFNO "교수번호", SJ.NAME "과목", OS.ENDDATE "과목완료일"
FROM TBL_PROFESSOR PF RIGHT JOIN TBL_OPENCOURSE OC   ON PF.PROFNO = OC.PROFNO
                      RIGHT JOIN TBL_OPENSUBJECT OS ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                      LEFT JOIN TBL_SUBJECT SJ     ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE;
--==>> View VIEW_PROFESSOR_LOGIN이(가) 생성되었습니다.
SELECT *
FROM TBL_OPENCOURSE;
SELECT *
FROM TBL_OPENSUBJECT;
SELECT *
FROM TBL_SUBJECT;
EXEC PRC_PROFESSOR_LOGIN('P0011', '1566789');
SELECT *
FROM VIEW_PROFESSOR_LOGIN;
--==>>
/*
P0002	자바 기초	2022-04-02
           :
*/

--------------------------------------------------------------------------------
-- 중탈한 학생 성적입력 못하게 하는거 추가한 후에 마지막 테스트만 하면 됨......된 듯,,,,?
--○ ◈◈◈◈◈◈◈◈◈◈◈◈ [ ②교수 - 성적확인 ] ◈◈◈◈◈◈◈◈◈◈◈◈  
CREATE OR REPLACE VIEW VIEW_PROFESSOR_SCORE
AS
SELECT PR.NAME"교수명", ST.NAME"학생명", OP.STARTDATE "과목시작일",OP.ENDDATE "과목종료일"
     , CR.NAME"과정명", SU.NAME"과목명", BK.NAME "교재명", SR.ATTEND "출결", SR.PRACTICE "실기"
     , SR.WRITE "필기", (SR.ATTEND + SR.PRACTICE + SR.WRITE) "총점", DENSE_RANK()OVER(ORDER BY NVL(SR.ATTEND, 0)+NVL(SR.PRACTICE, 0)+NVL(SR.WRITE, 0) DESC) AS "등수"
     , CASE WHEN SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE
            THEN '○' 
            ELSE 'Ⅹ'
       END "중도탈락 여부"
     , DR.DROP_DATE "중도탈락날짜"
FROM TBL_PROFESSOR PR JOIN TBL_OPENCOURSE OP
                           ON PR.PROFNO=OP.PROFNO
                           LEFT JOIN TBL_SIGNCOURSE SC
                                ON OP.OPENCOURSE_CODE = SC.OPENCOURSE_CODE
                                LEFT JOIN TBL_COURSE CR
                                     ON OP.COURSE_CODE = CR.COURSE_CODE 
                                     LEFT JOIN TBL_CLASSROOM CM
                                          ON OP.CLASSROOM_CODE = CM.CLASSROOM_CODE
                                          LEFT JOIN TBL_OPENSUBJECT OS
                                               ON OP.OPENCOURSE_CODE= OS.OPENCOURSE_CODE
                                               LEFT JOIN TBL_SCORE SR
                                                    ON OS.OPENSUBJECT_CODE= SR.OPENSUBJECT_CODE AND SC.SIGNCOURSE_CODE = SR.SIGNCOURSE_CODE
                                                    LEFT JOIN TBL_DROP DR
                                                         ON SC.SIGNCOURSE_CODE=DR.SIGNCOURSE_CODE
                                                         LEFT JOIN TBL_DROPREASON DRS
                                                              ON DR.REASON_CODE=DRS.REASON_CODE
                                                              LEFT JOIN TBL_STUDENT ST
                                                                   ON SC.STUDNO=ST.STUDNO
                                                                   LEFT JOIN TBL_SUBJECT SU
                                                                        ON OS.SUBJECT_CODE= SU.SUBJECT_CODE
                                                                        LEFT JOIN TBL_BOOK BK
                                                                             ON OS.BOOK_CODE=BK.BOOK_CODE
ORDER BY 교수명, 과목명, 등수;                                                                             
--==>> View VIEW_PROFESSOR_SCORE이(가) 생성되었습니다.

-- 수강신청테이블 = 성적테이블의 개설과정 코드
SELECT *
FROM VIEW_PROFESSOR_SCORE; 
ROLLBACK;

SELECT *
FROM TBL_SCORE;
SELECT *
FROM TBL_STUDENT;

DELETE TBL_SCORE
WHERE SCORE_CODE = 15;
COMMIT;
--==>>
/*
이아린		2022-07-02	2023-08-02	오라클의 모든 것을 배우는 과정							1	N
*/
--------------------------------------------------------------------------------
--● ◈◈◈◈◈◈◈◈◈◈◈◈ [ ③교수 - 성적입력 ] ◈◈◈◈◈◈◈◈◈◈◈◈    --
CREATE OR REPLACE VIEW VIEW_SCORE_PRINT
AS
SELECT DECODE(DR.DROP_DATE, NULL, 'X', 'O') "중도탈락여부", SC.OPENCOURSE_CODE "개설과정코드", OS.OPENSUBJECT_CODE "개설과목코드", SD.STUDNO "학번"
, SD.NAME "학생이름", NVL(S.ATTEND, 0) "출결점수", NVL(S.PRACTICE, 0) "필기점수", NVL(S.WRITE, 0) "실기점수"
FROM TBL_SCORE S FULL JOIN TBL_SIGNCOURSE SC 
                    ON S.SIGNCOURSE_CODE = SC.SIGNCOURSE_CODE
                 FULL JOIN TBL_STUDENT SD
                    ON SC.STUDNO = SD.STUDNO
                 FULL JOIN TBL_OPENSUBJECT OS 
                    ON OS.OPENCOURSE_CODE = SC.OPENCOURSE_CODE AND OS.OPENSUBJECT_CODE = S.OPENSUBJECT_CODE
                 FULL JOIN TBL_DROP DR
                    ON SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE
ORDER BY 개설과정코드, 개설과목코드; 
--==>> View VIEW_SCORE_PRINT이(가) 생성되었습니다.

SELECT *
FROM VIEW_SCORE_PRINT;
/*
OPJAVA001	OP_SJ2	1111111	김정용	0	0	0
             :
*/
--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈  [ ④관리자 - 교수확인 ]  ◈◈◈◈◈◈◈◈◈◈◈    --
CREATE OR REPLACE VIEW VIEW_ADMIN_PROFCHECK
AS
SELECT P.NAME "교수명", SJ.NAME "과목명", OS.STARTDATE "과목시작일", OS.ENDDATE "과목종료일"
     , B.NAME "교재명", CR.CLASSROOM_CODE "강의실코드", CR.CLASSROOM_COMMENT "강의실설명"
     , CASE WHEN  SYSDATE BETWEEN OS.STARTDATE AND OS.ENDDATE
            THEN '강의중'
            WHEN  SYSDATE < OS.STARTDATE
            THEN '강의예정'
            ELSE '강의종료'
       END "강의진행여부"
FROM TBL_PROFESSOR P JOIN TBL_OPENCOURSE OC
     ON P.PROFNO = OC.PROFNO
     LEFT JOIN TBL_OPENSUBJECT OS
               ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
               LEFT JOIN TBL_SUBJECT SJ
                          ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE
                          LEFT JOIN TBL_BOOK B
                                    ON OS.BOOK_CODE = B.BOOK_CODE
                                    LEFT JOIN TBL_CLASSROOM CR
                                              ON OC.CLASSROOM_CODE = CR.CLASSROOM_CODE;
--==>> View VIEW_ADMIN_PROFCHECK이(가) 생성되었습니다.
SELECT *
FROM VIEW_ADMIN_PROFCHECK;
--==>>
/*
우수정	자바 중급	2022-04-26	2022-04-28	이것이 자바다	A동 101호	강의예정
                     :
*/
--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈  [ ⑤관리자 - 학생확인 ]  ◈◈◈◈◈◈◈◈◈◈◈    --
CREATE OR REPLACE VIEW VIEW_ADMIN_ALL_STUDENT_INFO
AS 
SELECT DISTINCT  ST.NAME "학생 이름", CR.NAME "과정명", S.NAME "수강과목"
            , SR.ATTEND + SR.PRACTICE + SR.WRITE "수강과목 총점"
            --, DECODE(NULL, DRP.DROP_DATE, 'N', 'Y') "중도탈락여부"
            , DECODE(DRP.DROP_DATE, NULL, 'N', 'Y') "중도탈락여부"
            , DRP.DROP_DATE "중도탈락날짜"
            , DRS.REASON "중도탈락사유"
FROM TBL_STUDENT ST LEFT JOIN TBL_SIGNCOURSE SC
      ON ST.STUDNO = SC.STUDNO
        LEFT JOIN TBL_SCORE SR
             ON SC.SIGNCOURSE_CODE = SR.SIGNCOURSE_CODE
                LEFT JOIN TBL_OPENSUBJECT OS
                  ON OS.OPENCOURSE_CODE = SC.OPENCOURSE_CODE 
                     LEFT JOIN TBL_SUBJECT S
                       ON OS.SUBJECT_CODE = S.SUBJECT_CODE
                          LEFT JOIN TBL_OPENCOURSE OPC
                            ON OS.OPENCOURSE_CODE = OPC.OPENCOURSE_CODE
                               LEFT JOIN TBL_COURSE CR
                                 ON OPC.COURSE_CODE = CR.COURSE_CODE
                                    LEFT JOIN TBL_DROP DRP
                                      ON SC.SIGNCOURSE_CODE = DRP.SIGNCOURSE_CODE
                                         LEFT JOIN TBL_DROPREASON DRS
                                           ON DRP.REASON_CODE = DRS.REASON_CODE;
--==>> View VIEW_ADMIN_ALL_STUDENT_INFO이(가) 생성되었습니다.
SELECT *
FROM VIEW_ADMIN_ALL_STUDENT_INFO;
/*
김정용	JAVA로 시작하는 코딩과정	자바 중급		N	(null)	(null)	
김상기	(null)		                                N	(null)	(null)		
이시우	오라클의 모든 것을 배우는 과정	자바 기초	N	(null)	(null)		
김정용	JAVA로 시작하는 코딩과정	자바 기초		N	(null)	(null)		
*/
SELECT *
FROM TBL_SUBJECT;
SELECT *
FROM TBL_OPENSUBJECT;
SELECT *
FROM TBL_OPENCOURSE;
SELECT *
FROM TBL_SIGNCOURSE;
EXEC PRC_PROFESSOR_OS_UPDATE('OPSJAVA001',20,40,40);
EXEC PRC_PROFESSOR_SCORE_INSERT('자바기초기초', '1111111', 70,70,70);
SELECT *
FROM TBL_SCORE;

ROLLBACK;


--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈◈  [ ⑥관리자 - 과목정보 ] ◈◈◈◈◈◈◈◈◈◈◈◈ --
CREATE OR REPLACE VIEW VIEW_ADMIN_ALL_SUBJECT_INFO 
AS 
SELECT  CR.NAME "과정명", CLR.CLASSROOM_CODE "강의실" , SJ.NAME "과목명", OSJ.STARTDATE "시작 연월일"
        , OSJ.ENDDATE "끝 연월일", BK.NAME "교재 명", PF.NAME "교수자 명"
FROM TBL_PROFESSOR PF  JOIN TBL_OPENCOURSE OC
     ON PF.PROFNO = OC.PROFNO
        JOIN TBL_COURSE CR
          ON OC.COURSE_CODE = CR.COURSE_CODE
             JOIN TBL_CLASSROOM CLR
               ON OC.CLASSROOM_CODE = CLR.CLASSROOM_CODE
                  JOIN TBL_OPENSUBJECT OSJ
                    ON OC.OPENCOURSE_CODE = OSJ.OPENCOURSE_CODE
                       JOIN TBL_BOOK BK
                         ON OSJ.BOOK_CODE = BK.BOOK_CODE
                            FULL OUTER JOIN TBL_SUBJECT SJ
                              ON OSJ.SUBJECT_CODE = SJ.SUBJECT_CODE;

--==>> VIEW_ADMIN_ALL_SUBJECT_INFO이(가) 생성되었습니다.
SELECT *
FROM VIEW_ADMIN_ALL_SUBJECT_INFO;
--==>>
/*
JAVA로 시작하는 코딩과정	A101	자바 중급	2022-04-26	2022-04-28	이것이 자바다	우수정
                 :
*/
--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈◈  [ ⑦관리자 - 과정정보 ] ◈◈◈◈◈◈◈◈◈◈◈◈ --
CREATE OR REPLACE VIEW VIEW_ADMIN_ALL_COURSE_INFO 
AS 
SELECT  CR.NAME "과정명", CLR.CLASSROOM_CODE "강의실" , SJ.NAME "과목명", OC.STARTDATE "과목시작일"
        , OC.ENDDATE "과정종료일", BK.NAME "교재 명", PF.NAME "교수자 명"
FROM TBL_PROFESSOR PF  JOIN TBL_OPENCOURSE OC
  ON PF.PROFNO = OC.PROFNO
    FULL OUTER JOIN TBL_COURSE CR
      ON OC.COURSE_CODE = CR.COURSE_CODE
        LEFT JOIN TBL_CLASSROOM CLR
          ON OC.CLASSROOM_CODE = CLR.CLASSROOM_CODE
             LEFT JOIN TBL_OPENSUBJECT OSJ
              ON OC.OPENCOURSE_CODE = OSJ.OPENCOURSE_CODE
                 LEFT JOIN TBL_BOOK BK
                  ON OSJ.BOOK_CODE = BK.BOOK_CODE
                    LEFT JOIN TBL_SUBJECT SJ
                      ON OSJ.SUBJECT_CODE = SJ.SUBJECT_CODE;
--==>> View VIEW_ADMIN_ALL_COURSE_INFO이(가) 생성되었습니다.
                  
SELECT *
FROM VIEW_ADMIN_ALL_COURSE_INFO;
--==>>
/*
오라클의 모든 것을 배우는 과정	A201	자바 기초	2022-03-02	2022-06-20	그것이 오라클	이아린
          :
*/

--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈ [ ⑧학생 - 중도탈락여부 ] ◈◈◈◈◈◈◈◈◈◈◈    --
CREATE OR REPLACE VIEW VIEW_DROPCHECK
AS
SELECT T.학번, SUM(T.총점) "총점입력여부", SUM(T.중도탈락) "중도탈락여부"                             
FROM 
(
    SELECT 학번, 과정명, 과목명, 종료일자
          , CASE WHEN 총점 IS NULL THEN 0 ELSE 1 END 총점
          , CASE WHEN 중도탈락 IS NULL THEN 0 ELSE 1 END 중도탈락
    FROM 
    (
      SELECT ST.STUDNO "학번", C.NAME "과정명", SJ.NAME "과목명", OC.ENDDATE "종료일자"
             , S.ATTEND "출결",  S.PRACTICE "실기", S.WRITE "필기", (S.ATTEND + S.PRACTICE + S.WRITE) "총점", D.DROP_CODE "중도탈락"
      FROM TBL_STUDENT ST JOIN TBL_SIGNCOURSE SC
             ON ST.STUDNO = SC.STUDNO
                 LEFT JOIN TBL_OPENCOURSE OC
                    ON SC.OPENCOURSE_CODE = OC.OPENCOURSE_CODE
                        LEFT JOIN TBL_COURSE C
                            ON OC.COURSE_CODE = C.COURSE_CODE
                                LEFT JOIN TBL_OPENSUBJECT OS
                                     ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                                          LEFT JOIN TBL_SUBJECT SJ
                                               ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE
                                                   LEFT JOIN TBL_SCORE S
                                                      ON SC.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE
                                                             LEFT JOIN TBL_DROP D
                                                                ON SC.SIGNCOURSE_CODE = D.SIGNCOURSE_CODE                        
    )  
) T
GROUP BY T.학번;
--==>> View VIEW_DROPCHECK이(가) 생성되었습니다.

SELECT *
FROM VIEW_DROPCHECK;
--==>> 
/*
1111111	0	0
    :
*/
--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈   [ ⑨학생 - 수강과목 ]   ◈◈◈◈◈◈◈◈◈◈◈    --

CREATE OR REPLACE VIEW VIEW_STUD_ALL_SUBJECT                                                                                                                   
AS    
SELECT 학번, 과정명, 과목명, 종료일자, 총점
FROM 
(
  SELECT ST.STUDNO "학번", C.NAME "과정명", SJ.NAME "과목명", OC.ENDDATE "종료일자"
         , S.ATTEND "출결",  S.PRACTICE "실기", S.WRITE "필기", (S.ATTEND + S.PRACTICE + S.WRITE) "총점"
  FROM TBL_STUDENT ST JOIN TBL_SIGNCOURSE SC
         ON ST.STUDNO = SC.STUDNO
             LEFT JOIN TBL_OPENCOURSE OC
                ON SC.OPENCOURSE_CODE = OC.OPENCOURSE_CODE
                    LEFT JOIN TBL_COURSE C
                        ON OC.COURSE_CODE = C.COURSE_CODE
                            LEFT JOIN TBL_OPENSUBJECT OS
                                 ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                                      LEFT JOIN TBL_SUBJECT SJ
                                           ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE
                                               LEFT JOIN TBL_SCORE S
                                                  ON SC.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE                                  
);

--==>> View VIEW_STUD_ALL_SUBJECT이(가) 생성되었습니다.

SELECT *
FROM VIEW_STUD_ALL_SUBJECT;
--==>>
/*
1111111	JAVA로 시작하는 코딩과정	자바 기초	2022-08-20	
            :
*/
--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈ [ ⑩학생 - 수강과목통합 ] ◈◈◈◈◈◈◈◈◈◈◈    --

CREATE OR REPLACE VIEW VIEW_ALL_STUDSCORE
AS
SELECT T2.학번 "학번", T2.이름 "이름", T2.과정명 "과정명", T2.과목명 "과목명", T2.시작일자 "시작일자", T2.종료일자 "종료일자"
     , T2.교재명 "교재명", T2.출결 "출결", T2.실기 "실기", T2.필기 "필기", T2.총점 "총점"
     , DENSE_RANK() OVER(PARTITION BY T2.과목코드 ORDER BY T2.총점 DESC) "등수"
     , CASE WHEN T2.중도탈락코드 IS NULL THEN '-' ELSE TO_CHAR(T2.중도탈락일) END "중도탈락일"
     , CASE WHEN T2.중도탈락코드 IS NULL THEN '-' ELSE T2.중도탈락사유 END "중도탈락사유"
FROM 
(
    SELECT T1.학번 "학번", T1.이름 "이름", T1.과정명 "과정명", T1.과목코드 "과목코드", T1.과목명 "과목명", T1.시작일자 "시작일자", T1.종료일자 "종료일자"
         , T1.교재명 "교재명", (T1.출결배점 * (T1.출결/100)) "출결", (T1.실기배점 * (T1.실기/100)) "실기", (T1.필기배점 * (T1.필기/100)) "필기"
         , ( (T1.출결배점 * (T1.출결/100)) + (T1.실기배점 * (T1.실기/100)) + (T1.필기배점 * (T1.필기/100)) ) "총점"
        , T1.중도탈락 "중도탈락코드", T1. 중도탈락일 "중도탈락일", T1.중도탈락사유 "중도탈락사유"
    FROM 
    (
        SELECT ST.STUDNO "학번", ST.NAME "이름", C.NAME "과정명", OS.SUBJECT_CODE "과목코드", SJ.NAME "과목명", OC.STARTDATE "시작일자", OC.ENDDATE "종료일자", B.NAME "교재명"
              , OS.ATTEND "출결배점", OS.PRACTICE "실기배점", OS.WRITE "필기배점"
              , S.ATTEND "출결",  S.PRACTICE "실기", S.WRITE "필기", D.DROP_CODE "중도탈락", D.DROP_DATE "중도탈락일", DR.REASON "중도탈락사유"
        FROM TBL_STUDENT ST JOIN TBL_SIGNCOURSE SC
            ON ST.STUDNO = SC.STUDNO
                LEFT JOIN TBL_OPENCOURSE OC
                    ON SC.OPENCOURSE_CODE = OC.OPENCOURSE_CODE
                        LEFT JOIN TBL_COURSE C
                            ON OC.COURSE_CODE = C.COURSE_CODE
                                LEFT JOIN TBL_OPENSUBJECT OS
                                    ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                                        LEFT JOIN TBL_SUBJECT SJ
                                            ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE
                                                LEFT JOIN TBL_BOOK B
                                                    ON OS.BOOK_CODE = B.BOOK_CODE
                                                        LEFT JOIN TBL_SCORE S
                                                            ON SC.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE
                                                                LEFT JOIN TBL_DROP D
                                                                    ON SC.SIGNCOURSE_CODE = D.SIGNCOURSE_CODE
                                                                        LEFT JOIN TBL_DROPREASON DR
                                                                            ON D.REASON_CODE = DR.REASON_CODE
    ) T1
) T2; 

--==>> View VIEW_ALL_STUDSCORE이(가) 생성되었습니다.

SELECT *
FROM VIEW_ALL_STUDSCORE;
--==>>
/*
1111111	김정용	JAVA로 시작하는 코딩과정	자바 기초	2022-03-01	2022-08-20	이것이 자바다					1	-	-
                :
*/
