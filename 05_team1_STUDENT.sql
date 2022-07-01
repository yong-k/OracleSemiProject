SET SERVEROUTPUT ON;
-- [ 학생 ] 
-- ① 과정 중도탈락 학생 확인 VIEW          (VIEW_DROPCHECK)
-- ② 학생 수강과목 출력 VIEW               (VIEW_STUD_ALL_SUBJECT)
-- ③ 학생 로그인 프로시저                  (PRC_STUD_LOGIN)
-- ④ 수강완료과목 성적 통합 출력 VIEW      (VIEW_ALL_STUDSCORE)
-- ⑤ 수강완료과목 성적 통합 출력 프로시저  (PRC_STUD_SCORE)
-- ⑥ 개별과목 성적 확인 프로시저           (PRC_STUD_EACHSCORE)
-- ⑦ 수강신청 INSERT 프로시저              (PRC_SIGNCOURSE_INSERT)


-- ① 과정 중도탈락 학생 확인 VIEW

-- 학생 로그인 시, '과정에서 중도탈락한 학생 중 수강완료한 과목이 존재하지 않는 학생'의 학번 걸러내기 위한 VIEW.

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



-- ② 학생 수강과목 출력 VIEW

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
FROM TBL_STUDENT;
EXEC PRC_STUD_LOGIN('S00005', '2111111');
                                        
-- ③ 학생 로그인 프로시저

-- IN 매개변수 : 학번, 패스워드

-- 1. 입력된 학번 또는 패스워드 정보 불일치 → 학번 또는 패스워드 에러 
-- 2-1. 로그인 성공 → 수강완료한 과목 존재하지 않고, 과정에서 중도탈락한 학생 → 과정 중도탈락 + 수강완료 과목 부존재 에러 
-- 2-2. 로그인 성공 → 중도탈락 여부 상관없이 최소 한 개 이상의 수강완료한 과목 존재하는 학생 → 수강완료과목명 목록 VIEW 출력

CREATE OR REPLACE PROCEDURE PRC_STUD_LOGIN
( V_STUDNO      IN  TBL_STUDENT.STUDNO%TYPE
, V_PW          IN  TBL_STUDENT.PW%TYPE
)
IS
    V_STUDNO2       TBL_STUDENT.STUDNO%TYPE;
    V_PW2           TBL_STUDENT.PW%TYPE;
    V_COURSE        TBL_COURSE.NAME%TYPE;
    V_SUBJECT       TBL_SUBJECT.NAME%TYPE;
    V_ENDDATE       TBL_OPENSUBJECT.ENDDATE%TYPE;
    
    CURSOR CUR_STUDENT_SUBJECT
    IS
    SELECT 과정명, 과목명, 종료일자
    FROM VIEW_STUD_ALL_SUBJECT
    WHERE 학번 = V_STUDNO AND 종료일자 <= SYSDATE AND 총점 IS NOT NULL;
    
    USER_DEFINE_ERROR       EXCEPTION;
    USER_DEFINE_ERROR2      EXCEPTION;
    
BEGIN
    
    SELECT PW INTO V_PW2
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;
    
    SELECT 학번 INTO V_STUDNO2
    FROM VIEW_DROPCHECK
    WHERE 학번 = V_STUDNO AND 총점입력여부 = 0 AND 중도탈락여부 > 0;
    

    IF (V_PW != V_PW2)
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF (V_STUDNO = V_STUDNO2)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSE
            OPEN CUR_STUDENT_SUBJECT;
        
            LOOP
                FETCH CUR_STUDENT_SUBJECT INTO V_COURSE, V_SUBJECT, V_ENDDATE;
                EXIT WHEN CUR_STUDENT_SUBJECT%NOTFOUND;
                
                DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COURSE || ' | 과목명 : ' || V_SUBJECT || ' | 종료일자 : ' || V_ENDDATE);
            END LOOP;
            
            CLOSE CUR_STUDENT_SUBJECT;     
    END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND
            THEN RAISE_APPLICATION_ERROR(-20999, '학번 또는 패스워드를 잘못 입력하였습니다. 다시 입력하세요.');
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20402, '학번 또는 패스워드를 잘못 입력하였습니다. 다시 입력하세요.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20405, '과정에서 중도탈락한 학생입니다. 수강완료한 과목이 없습니다.');
END; 
--==>> Procedure PRC_STUD_LOGIN이(가) 컴파일되었습니다.          



-- ④ 수강완료과목 성적 통합 출력 VIEW

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


-- ⑤ 수강완료과목 성적 통합 출력 프로시저

-- IN 매개변수 : 학번
-- 해당 학번의 수강완료과목에 대한 성적 정보를 출력.

CREATE OR REPLACE PROCEDURE PRC_STUD_SCORE
( V_STUDNO  IN  TBL_STUDENT.STUDNO%TYPE
)
IS
    V_NAME          TBL_STUDENT.NAME%TYPE;
    V_COURSE        TBL_COURSE.NAME%TYPE;
    V_SUBJECT       TBL_SUBJECT.NAME%TYPE;
    V_STARTDATE     TBL_OPENSUBJECT.STARTDATE%TYPE;
    V_ENDDATE       TBL_OPENSUBJECT.ENDDATE%TYPE;
    V_BOOK          TBL_BOOK.NAME%TYPE;
    V_ATTEND        TBL_SCORE.ATTEND%TYPE;
    V_PRACTICE      TBL_SCORE.PRACTICE%TYPE;
    V_WRITE         TBL_SCORE.WRITE%TYPE;
    V_TOTAL         NUMBER(3);
    V_RANK          NUMBER(3);
    V_DROPDATE      TBL_DROP.DROP_DATE%TYPE;
    V_DROPREASON    TBL_DROPREASON.REASON%TYPE;

    CURSOR CUR_STUDENT_SCORE
    IS
    SELECT 이름, 과정명, 과목명, 교재명, 시작일자, 종료일자, 출결, 실기, 필기, 총점, 등수, 중도탈락일, 중도탈락사유 
    FROM VIEW_ALL_STUDSCORE
    WHERE 학번 = V_STUDNO AND 종료일자 <= SYSDATE AND 총점 IS NOT NULL;
    
BEGIN
    
    OPEN CUR_STUDENT_SCORE;
    
    LOOP
        FETCH CUR_STUDENT_SCORE INTO V_NAME, V_COURSE, V_SUBJECT, V_BOOK, V_STARTDATE, V_ENDDATE, V_ATTEND
                                  , V_PRACTICE, V_WRITE, V_TOTAL, V_RANK, V_DROPDATE, V_DROPREASON;
        EXIT WHEN CUR_STUDENT_SCORE%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(' 이름 : ' || V_NAME || ' | 과정명 : ' || V_COURSE || ' | 과목명 : ' || V_SUBJECT || ' | 교재명 : ' || V_BOOK 
                            || ' | 시작일자 : ' || V_STARTDATE || ' | 종료일자 : ' || V_ENDDATE || ' | 출결 : ' || V_ATTEND || ' | 실기 : ' || V_PRACTICE
                            || ' | 필기 : ' || V_WRITE || ' | 총점 : ' || V_TOTAL || ' | 등수 : ' || V_RANK || ' | 중도탈락일 : ' || V_DROPDATE || ' | 중도탈락사유 : ' || V_DROPREASON);
        
    END LOOP;
    
    
    CLOSE CUR_STUDENT_SCORE;
    
END;
--==>> Procedure PRC_STUD_SCORE이(가) 컴파일되었습니다.



-- ⑥ 개별과목 성적 확인 프로시저

-- 로그인 성공 시 수강완료한 과목명 목록 출력
-- 과목명 목록 중에서 성적 확인하려는 과목명 클릭 

-- IN 매개변수 : 로그인 시 입력된 학번, 선택한 과목명 
-- 입력된 학번의 전체 성적정보 중 총점이 입력되어있고 학생이 선택한 과목명에 해당하는 성적정보만 출력

CREATE OR REPLACE PROCEDURE PRC_STUD_EACHSCORE
( V_STUDNO      IN  TBL_STUDENT.STUDNO%TYPE
, V_SUBJECT     IN  TBL_SUBJECT.NAME%TYPE
)
IS
    V_NAME          TBL_STUDENT.NAME%TYPE;
    V_COURSE        TBL_COURSE.NAME%TYPE;
    V_SUBJECT2      TBL_SUBJECT.NAME%TYPE;
    V_STARTDATE     TBL_OPENSUBJECT.STARTDATE%TYPE;
    V_ENDDATE       TBL_OPENSUBJECT.ENDDATE%TYPE;
    V_BOOK          TBL_BOOK.NAME%TYPE;
    V_ATTEND        TBL_SCORE.ATTEND%TYPE;
    V_PRACTICE      TBL_SCORE.PRACTICE%TYPE;
    V_WRITE         TBL_SCORE.WRITE%TYPE;
    V_TOTAL         NUMBER(3);
    V_RANK          NUMBER(3);
    V_DROPDATE      TBL_DROP.DROP_DATE%TYPE;
    V_DROPREASON    TBL_DROPREASON.REASON%TYPE;

    CURSOR CUR_STUDENT_EACH
    IS
    SELECT 이름, 과정명, 과목명, 교재명, 시작일자, 종료일자, 출결, 실기, 필기, 총점, 등수, 중도탈락일, 중도탈락사유 
    FROM VIEW_ALL_STUDSCORE
    WHERE 학번 = V_STUDNO AND 과목명 = V_SUBJECT AND 종료일자 <= SYSDATE AND 총점 IS NOT NULL;
    
BEGIN

    OPEN CUR_STUDENT_EACH;
    
    LOOP
        FETCH CUR_STUDENT_EACH INTO V_NAME, V_COURSE, V_SUBJECT2, V_BOOK, V_STARTDATE, V_ENDDATE, V_ATTEND
                                  , V_PRACTICE, V_WRITE, V_TOTAL, V_RANK, V_DROPDATE, V_DROPREASON;
        EXIT WHEN CUR_STUDENT_EACH%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(' 이름 : ' || V_NAME || ' | 과정명 : ' || V_COURSE || ' | 과목명 : ' || V_SUBJECT2 || ' | 교재명 : ' || V_BOOK 
                            || ' | 시작일자 : ' || V_STARTDATE || ' | 종료일자 : ' || V_ENDDATE || ' | 출결 : ' || V_ATTEND || ' | 실기 : ' || V_PRACTICE
                            || ' | 필기 : ' || V_WRITE || ' | 총점 : ' || V_TOTAL || ' | 등수 : ' || V_RANK || ' | 중도탈락일 : ' || V_DROPDATE || ' | 중도탈락사유 : ' || V_DROPREASON);
        
    END LOOP;
    
    CLOSE CUR_STUDENT_EACH;

END;
--==>> Procedure PRC_STUD_EACHSCORE이(가) 컴파일되었습니다.


-- ⑦ 수강신청 INSERT 프로시저 
CREATE OR REPLACE PROCEDURE PRC_SIGNCOURSE_INSERT
( V_STUDNO              IN TBL_SIGNCOURSE.STUDNO%TYPE
, V_OPENCOURSE_CODE     IN TBL_SIGNCOURSE.OPENCOURSE_CODE%TYPE
)
IS
    USER_DEFINE_ERROR1   EXCEPTION; 
    USER_DEFINE_ERROR2   EXCEPTION;
    USER_DEFINE_ERROR3   EXCEPTION; 
    
    CHECK_STUDNO    TBL_SIGNCOURSE.STUDNO%TYPE;
    CHECK_OPCODE    TBL_SIGNCOURSE.OPENCOURSE_CODE%TYPE;
    
    CHECK_SDATE     TBL_OPENCOURSE.STARTDATE%TYPE;
BEGIN
    SELECT NVL(MAX(STUDNO), '0') INTO CHECK_STUDNO
    FROM   TBL_STUDENT
    WHERE  STUDNO = V_STUDNO; 

    SELECT NVL(MAX(OPENCOURSE_CODE), '0') INTO CHECK_OPCODE
    FROM   TBL_OPENCOURSE
    WHERE  OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    
    IF CHECK_STUDNO = '0'
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    
    IF CHECK_OPCODE = '0'
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    SELECT STARTDATE INTO CHECK_SDATE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    
    IF SYSDATE >= CHECK_SDATE
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;
    
    INSERT INTO TBL_SIGNCOURSE(SIGNCOURSE_CODE, SIGNCOURSE_DATE, STUDNO, OPENCOURSE_CODE)
    VALUES(SEQ_SIGNCOURSE.NEXTVAL, SYSDATE, V_STUDNO, V_OPENCOURSE_CODE);    
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20303, '존재하지 않는 학번입니다.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20304, '존재하지 않는 개설과정코드 입니다.');    
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20305, '수강신청하려는 과정이 이미 진행중이거나 끝났습니다.');        
                 ROLLBACK;
END;
--==>> Procedure PRC_SIGNCOURSE_INSERT이(가) 컴파일되었습니다.















