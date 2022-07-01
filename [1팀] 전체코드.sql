SELECT USER
FROM DUAL;
--==>> TEAM1


/*==============================================================================
-- ■□■□■□■□■□■□  [ 테이블(TABLE)목록 ] □■□■□■□■□■□■  -- 
===============================================================================*/

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈  [ 교수 테이블 (TBL_PROFESSOR) ]   ◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_PROFESSOR
( PROFNO    VARCHAR2(20)            CONSTRAINT PROFESSOR_PROFNO_NN  NOT NULL    
, NAME      VARCHAR2(50)            CONSTRAINT PROFESSOR_NAME_NN    NOT NULL
, SSN       CHAR(13)                CONSTRAINT PROFESSOR_SSN_NN     NOT NULL
, PW        VARCHAR2(20)            CONSTRAINT PROFESSOR_PW_NN      NOT NULL
, REGDATE   DATE DEFAULT SYSDATE    CONSTRAINT PROFESSOR_REGDATE_NN NOT NULL
, CONSTRAINT PROFESSOR_PROFNO_PK    PRIMARY KEY(PROFNO)
);
--==>> Table TBL_PROFESSOR이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_PROFESSOR
VALUES('P0001', '우수정', '9603292234567', '0000', TO_DATE('2002-10-01', 'YYYY-MM-DD'));
INSERT INTO TBL_PROFESSOR
VALUES('P0002', '이아린', '9911172234567', '0000', TO_DATE('2001-11-01', 'YYYY-MM-DD'));
INSERT INTO TBL_PROFESSOR
VALUES('P0003', '이호석', '9611121234567', '0000', TO_DATE('2004-12-01', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_PROFESSOR;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈   [ 학생 테이블 (TBL_STUDENT) ]    ◈◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_STUDENT
( STUDNO        VARCHAR2(20)    CONSTRAINT STUDENT_STUDNO_NN  NOT NULL
, NAME          VARCHAR2(50)    CONSTRAINT STUDENT_NAME_N     NOT NULL
, SSN           CHAR(13)        CONSTRAINT STUDENT_SSN_NN     NOT NULL
, PW            VARCHAR2(20)    CONSTRAINT STUDENT_PW_NN      NOT NULL
, REGDATE       DATE            DEFAULT SYSDATE
                                CONSTRAINT STUDENT_REGDATE_NN NOT NULL
, CONSTRAINT STUDENT_STUDNO_PK PRIMARY KEY(STUDNO)
);
--==>> Table TBL_STUDENT이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_STUDENT
VALUES('1111111', '김정용', '9606082234567', '1234', TO_DATE('2020-01-29', 'YYYY-MM-DD'));
INSERT INTO TBL_STUDENT
VALUES('2222222', '이시우', '9605152234567', '1234', TO_DATE('2022-03-14', 'YYYY-MM-DD'));
INSERT INTO TBL_STUDENT
VALUES('3333333', '김상기', '9610041234567', '1234', TO_DATE('2019-05-07', 'YYYY-MM-DD'));
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_STUDENT;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈   [ 관리자 테이블 (TBL_ADMIN) ]    ◈◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_ADMIN
( ID        VARCHAR2(20)    CONSTRAINT ADMIN_ID_NN      NOT NULL
, PW        VARCHAR2(20)    CONSTRAINT ADMIN_PW_NN      NOT NULL
, NAME      VARCHAR2(50)    CONSTRAINT ADMIN_NAME_NN    NOT NULL
, REGDATE   DATE            DEFAULT SYSDATE             CONSTRAINT ADMIN_REGDATE_NN NOT NULL 
, CONSTRAINT ADMIN_ID_PK    PRIMARY KEY(ID)
);
--==>> Table TBL_ADMIN이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_ADMIN(ID, PW, NAME, REGDATE)
VALUES('team1_1', '1234', '관리자', SYSDATE);
INSERT INTO TBL_ADMIN(ID, PW, NAME, REGDATE)
VALUES('team1_2', '0000', '운영자', SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_ADMIN;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈   [ 과정 테이블 (TBL_COURSE) ]   ◈◈◈◈◈◈◈◈◈◈ ---
-------------------------------------------------------------------------------
CREATE TABLE TBL_COURSE
( COURSE_CODE   VARCHAR2(20)     CONSTRAINT COURSE_CODE_NN   NOT NULL   
, NAME          VARCHAR2(100)    CONSTRAINT COURSE_NAME_NN   NOT NULL
, CONSTRAINT COURSE_CODE_PK      PRIMARY KEY(COURSE_CODE)
);
--==>> Table TBL_COURSE이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_COURSE
VALUES('JAVA001', 'JAVA로 시작하는 코딩과정');
INSERT INTO TBL_COURSE
VALUES('PYTHON001', '기초부터 시작하는 파이썬 과정');
INSERT INTO TBL_COURSE
VALUES('ORA001', '오라클의 모든 것을 배우는 과정');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT * 
FROM TBL_COURSE;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈   [ 개설과정 테이블 (TBL_OPENCOURSE) ]  ◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_OPENCOURSE
( OPENCOURSE_CODE   VARCHAR2(20)    CONSTRAINT OPENCOURSE_CODE_NN           NOT NULL
, STARTDATE         DATE            CONSTRAINT OPENCOURSE_STARTDATE_NN      NOT NULL
, ENDDATE           DATE            CONSTRAINT OPENCOURSE_ENDDATE_NN        NOT NULL
, OPENCOURSE_DATE   DATE            CONSTRAINT OPENCOURSE_DATE_NN           NOT NULL
, PROFNO            VARCHAR2(20)    CONSTRAINT OPENCOURSE_PROFNO_NN         NOT NULL
, COURSE_CODE       VARCHAR2(20)    CONSTRAINT OPENCOURSE_COURSE_CODE_NN    NOT NULL
, CLASSROOM_CODE    VARCHAR2(20)    CONSTRAINT OPENCOURSE_CLASSROOM_CODE_NN NOT NULL
, CONSTRAINT OPENCOURSE_CODE_PK PRIMARY KEY(OPENCOURSE_CODE)
);
--==>> Table TBL_OPENCOURSE이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_OPENCOURSE
VALUES('OPJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), 'P0001', 'JAVA001', 'A101');
INSERT INTO TBL_OPENCOURSE
VALUES('OPORA001', TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), TO_DATE('2021-12-30', 'YYYY-MM-DD'), 'P0002', 'ORA001', 'A201');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_OPENCOURSE;

COMMIT;

-- FOREIGN KEY 제약조건 추가
ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_PROFNO_FK FOREIGN KEY(PROFNO)
                REFERENCES TBL_PROFESSOR(PROFNO);
--==>> Table TBL_OPENCOURSE이(가) 변경되었습니다.

ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_COURSE_CODE_FK FOREIGN KEY(COURSE_CODE)
                REFERENCES TBL_COURSE(COURSE_CODE);
--==>> Table TBL_OPENCOURSE이(가) 변경되었습니다.

ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_CLASSROOM_CODE_FK FOREIGN KEY(CLASSROOM_CODE)
                REFERENCES TBL_CLASSROOM(CLASSROOM_CODE);
--==>> Table TBL_OPENCOURSE이(가) 변경되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈  [  과목 테이블 (TBL_SUBJECT) ]  ◈◈◈◈◈◈◈◈ ---
-------------------------------------------------------------------------------
CREATE TABLE TBL_SUBJECT
( SUBJECT_CODE              VARCHAR2(20)     CONSTRAINT SUBJECT_CODE_NN NOT NULL
, NAME                      VARCHAR2(100)    CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_CODE_PK PRIMARY KEY(SUBJECT_CODE)
);
--==>> Table TBL_SUBJECT이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_SUBJECT
VALUES('SJAVA001', '자바 기초');
INSERT INTO TBL_SUBJECT
VALUES('SJAVA002', '자바 중급');
INSERT INTO TBL_SUBJECT
VALUES('SJAVA003', '자바 심화');
INSERT INTO TBL_SUBJECT
VALUES('SORA001', '오라클 입문');
INSERT INTO TBL_SUBJECT
VALUES('SORA002', '오라클 중급');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_SUBJECT;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈   [ 개설과목 테이블 (TBL_OPENSUBJECT) ]  ◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_OPENSUBJECT
( OPENSUBJECT_CODE  VARCHAR2(20)            CONSTRAINT OPENSUBJECT_CODE_NN            NOT NULL
, STARTDATE         DATE                    CONSTRAINT OPENSUBJECT_STARTDATE_NN       NOT NULL
, ENDDATE           DATE                    CONSTRAINT OPENSUBJECT_ENDDATE_NN         NOT NULL
, OPENSUBJECT_DATE  DATE DEFAULT SYSDATE    CONSTRAINT OPENSUBJECT_DATE_NN            NOT NULL
, ATTEND            NUMBER(3) DEFAULT 0     CONSTRAINT OPENSUBJECT_ATTEND_CK          CHECK(ATTEND   BETWEEN 0 AND 100)
, PRACTICE          NUMBER(3) DEFAULT 0     CONSTRAINT OPENSUBJECT_PRACTICE_CK        CHECK(PRACTICE BETWEEN 0 AND 100)
, WRITE             NUMBER(3) DEFAULT 0     CONSTRAINT OPENSUBJECT_WRITE_CK           CHECK(WRITE    BETWEEN 0 AND 100)
, OPENCOURSE_CODE   VARCHAR2(20)            CONSTRAINT OPENSUBJECT_OPENCOURSE_CODE_NN NOT NULL
, SUBJECT_CODE      VARCHAR2(20)            CONSTRAINT OPENSUBJECT_SUBJECT_CODE_NN    NOT NULL
, BOOK_CODE         VARCHAR2(20)            CONSTRAINT OPENSUBJECT_BOOK_CODE_NN       NOT NULL
, CONSTRAINT OPENSUBJECT_CODE_PK PRIMARY KEY(OPENSUBJECT_CODE) 
);
--==>> Table TBL_OPENSUBJECT이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_OPENSUBJECT
VALUES('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-31', 'YYYY-MM-DD')
      , TO_DATE('2022-01-02', 'YYYY-MM-DD'), NULL, NULL, NULL, 'OPJAVA001', 'SJAVA001', 'J001');
INSERT INTO TBL_OPENSUBJECT
VALUES('OPSORA001', TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-04-02', 'YYYY-MM-DD')
      , TO_DATE('2021-12-30', 'YYYY-MM-DD'), NULL, NULL, NULL, 'OPORA001', 'SORA001', 'O001');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_OPENSUBJECT;

COMMIT;

-- FOREIGN KEY 제약조건 추가
ALTER TABLE TBL_OPENSUBJECT
ADD ( CONSTRAINT OPENSUBJECT_OPENCOURSE_FK FOREIGN KEY(OPENCOURSE_CODE)
                 REFERENCES TBL_OPENCOURSE(OPENCOURSE_CODE)                
    , CONSTRAINT OPENSUBJECT_SUBJECT_CODE_FK FOREIGN KEY(SUBJECT_CODE)
                 REFERENCES TBL_SUBJECT(SUBJECT_CODE)                
    , CONSTRAINT OPENSUBJECT_BOOK_CODE_FK FOREIGN KEY(BOOK_CODE)
                 REFERENCES TBL_BOOK(BOOK_CODE)
    );
--==>> Table TBL_OPENSUBJECT이(가) 변경되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈   [ 수강신청 테이블 (TBL_SIGNCOURSE) ]  ◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_SIGNCOURSE
( SIGNCOURSE_CODE   NUMBER          CONSTRAINT SIGNCOURSE_CODE_NN            NOT NULL -- 시퀀스 사용        
, SIGNCOURSE_DATE   DATE            CONSTRAINT SIGNCOURSE_DATE_NN            NOT NULL
, STUDNO            VARCHAR2(20)    CONSTRAINT SIGNCOURSE_STUDNO_NN          NOT NULL
, OPENCOURSE_CODE   VARCHAR2(20)    CONSTRAINT SIGNCOURSE_OPENCOURSE_CODE_NN NOT NULL
, CONSTRAINT SIGNCOURSE_CODE_PK PRIMARY KEY(SIGNCOURSE_CODE)
);
--==>> Table TBL_SIGNCOURSE이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_SIGNCOURSE
VALUES(SEQ_SIGNCOURSE.NEXTVAL, TO_DATE('2022-01-25', 'YYYY-MM-DD'), '1111111', 'OPJAVA001');
INSERT INTO TBL_SIGNCOURSE
VALUES(SEQ_SIGNCOURSE.NEXTVAL, TO_DATE('2022-02-14', 'YYYY-MM-DD'), '2222222', 'OPORA001');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_SIGNCOURSE;

COMMIT;

-- FOREIGN KEY 제약조건 추가
ALTER TABLE TBL_SIGNCOURSE
ADD CONSTRAINT SIGNCOURSE_STUDNO_FK FOREIGN KEY(STUDNO)
                REFERENCES TBL_STUDENT(STUDNO);
--==>> Table TBL_SIGNCOURSE이(가) 변경되었습니다.                

ALTER TABLE TBL_SIGNCOURSE
ADD CONSTRAINT SIGNCOURSE_OPENCOURSE_CODE_FK FOREIGN KEY(OPENCOURSE_CODE)
                REFERENCES TBL_OPENCOURSE(OPENCOURSE_CODE);    
--==>> Table TBL_SIGNCOURSE이(가) 변경되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈   [ 성적 테이블 (TBL_SCORE) ]   ◈◈◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_SCORE
( SCORE_CODE        VARCHAR2(20)    CONSTRAINT SCORE_CODE_NN      NOT NULL
, ATTEND            NUMBER(3)       DEFAULT 0
                                    CONSTRAINT SCORE_ATTEND_CK    CHECK(ATTEND BETWEEN 0 AND 100)
, PRACTICE          NUMBER(3)       DEFAULT 0
                                    CONSTRAINT SCORE_PRACTICE_CK  CHECK(PRACTICE BETWEEN 0 AND 100)
, WRITE             NUMBER(3)       DEFAULT 0
                                    CONSTRAINT SCORE_WRITE_CK     CHECK(WRITE BETWEEN 0 AND 100)
, SCORE_DATE        DATE            DEFAULT SYSDATE 
                                    CONSTRAINT SCORE_SCORE_DATE_NN        NOT NULL
, OPENSUBJECT_CODE  VARCHAR2(20)    CONSTRAINT SCORE_OPENSUBJECT_CODE_NN  NOT NULL
, SIGNCOURSE_CODE   NUMBER          CONSTRAINT SCORE_SIGNCOURSE_CODE_NN   NOT NULL
, CONSTRAINT SCORE_CODE_PK PRIMARY KEY(SCORE_CODE)
);
--==>> Table TBL_SCORE이(가) 생성되었습니다.


-- FOREIGN KEY 제약조건 추가
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_OPENSUBJECT_CODE_FK FOREIGN KEY(OPENSUBJECT_CODE)
                                         REFERENCES TBL_OPENSUBJECT(OPENSUBJECT_CODE);  
--==>> Table TBL_SCORE이(가) 변경되었습니다.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SIGNCOURSE_CODE_FK FOREIGN KEY(SIGNCOURSE_CODE)
                                         REFERENCES TBL_SIGNCOURSE(SIGNCOURSE_CODE);  
--==>> Table TBL_SCORE이(가) 변경되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈   [ 중도탈락 테이블 (TBL_DROP) ]   ◈◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_DROP
(   DROP_CODE           NUMBER                      CONSTRAINT DROP_CODE_NN NOT NULL
,   DROP_DATE           DATE    DEFAULT SYSDATE     CONSTRAINT DROP_DATE_NN NOT NULL
,   SIGNCOURSE_CODE     NUMBER                      CONSTRAINT DROP_SIGNCOURSE_CODE_NN NOT NULL
,   REASON_CODE         NUMBER                      CONSTRAINT DROP_REASON_CODE_NN NOT NULL
,CONSTRAINT DROP_CODE_PK PRIMARY KEY(DROP_CODE)
);
--==>>Table TBL_DROP이(가) 생성되었습니다.

-- FOREIGN KEY 제약조건 추가
ALTER TABLE TBL_DROP
ADD( CONSTRAINT DROP_SIGNCOURSE_CODE_FK FOREIGN KEY(SIGNCOURSE_CODE)
                REFERENCES TBL_SIGNCOURSE(SIGNCOURSE_CODE)
   , CONSTRAINT DROP_REASON_CODE_FK FOREIGN KEY(REASON_CODE)
                REFERENCES TBL_DROPREASON(REASON_CODE)
    );    
--==>> Table TBL_DROP이(가) 변경되었습니다.   

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈   [ 중도탈락사유 테이블 (TBL_DROPREASON) ]   ◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_DROPREASON
(   REASON_CODE    NUMBER               CONSTRAINT DROPREASON_REASON_CODE_NN NOT NULL
,   REASON         VARCHAR2(100)        CONSTRAINT DROPREASON_REASON_NN NOT NULL
,CONSTRAINT DROPREASON_REASON_CODE_PK   PRIMARY KEY(REASON_CODE)
);
--==>> Table TBL_DROPREASON이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '무단결석5회');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '시험미응시3회');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '학비미납');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '품행불량');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '개인사유');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_DROPREASON;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈   [ 강의실 테이블 (TBL_CLASSROOM) ]   ◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_CLASSROOM
( CLASSROOM_CODE    VARCHAR2(20)    CONSTRAINT CLASSROOM_CODE_NN   NOT NULL   
, CLASSROOM_COMMENT VARCHAR2(100)    
, CAPACITY          NUMBER
, CONSTRAINT CLASSROOM_CODE_PK     PRIMARY KEY(CLASSROOM_CODE)
);
--==>> Table TBL_CLASSROOM이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_CLASSROOM
VALUES('A101', 'A동 101호', 30);
INSERT INTO TBL_CLASSROOM
VALUES('A201', 'A동 201호', 40);
INSERT INTO TBL_CLASSROOM
VALUES('A301', 'A동 301호', 60);
INSERT INTO TBL_CLASSROOM
VALUES('B102', 'B동 102호', 30);
INSERT INTO TBL_CLASSROOM
VALUES('B202', 'B동 202호', 40);
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_CLASSROOM;

COMMIT;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈   [ 교재 테이블 (TBL_BOOK) ]   ◈◈◈◈◈◈◈◈◈◈ ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_BOOK
( BOOK_CODE                    VARCHAR2(20)     CONSTRAINT BOOK_CODE_NN NOT NULL
, NAME                         VARCHAR2(100)    CONSTRAINT BOOK_NAME_NN NOT NULL
, AUTHOR                       VARCHAR2(50)
, PUBLISHER                    VARCHAR2(50)
, CONSTRAINT BOOK_CODE_PK PRIMARY KEY(BOOK_CODE)
);
--==>> Table TBL_BOOK이(가) 생성되었습니다.


-- 데이터 삽입
INSERT INTO TBL_BOOK
VALUES('J001', '이것이 자바다', '김아린', '서울출판사');
INSERT INTO TBL_BOOK
VALUES('P001', '처음 시작하는 파이썬', '우호석', '경기출판사');
INSERT INTO TBL_BOOK
VALUES('O001', '그것이 오라클', '신시우', '부산출판사');
INSERT INTO TBL_BOOK
VALUES('M001', '이산수학', '최상기', '제주출판사');
INSERT INTO TBL_BOOK
VALUES('C001', '저것이 C언어다', '유수정', '경남출판사');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_BOOK;

COMMIT;



/*==============================================================================
-- ■□■□■□■□■□■ [ 프로시저(PROCEDURE) 목록 ] ■□■□■□■□■□■  -- 
===============================================================================*/
--------------------------------------------------------------------------------
-- ▣▣▣▣▣▣▣▣▣▣▣▣▣     < 관리자 >     ▣▣▣▣▣▣▣▣▣▣▣▣▣▣ --
--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 관리자 로그인 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
-- 관리자 로그인
SELECT *
FROM TBL_ADMIN;
/*
team1_1   1234
team1_2   0000
*/

EXEC PRC_ADMIN_LOGIN('team1_1', '1234');
EXEC PRC_ADMIN_LOGIN('team1_1', '');

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_ADMIN_LOGIN
( V_ID      IN TBL_ADMIN.ID%TYPE
, V_PW      IN TBL_ADMIN.PW%TYPE
)
IS
    C_ID                TBL_ADMIN.ID%TYPE;
    C_PW                TBL_ADMIN.PW%TYPE;
    USER_DEFINE_ERROR1   EXCEPTION; --ID PW틀린경우
    
    CURSOR CUR_ADMIN_IDPW
    IS
    SELECT ID, PW
    FROM TBL_ADMIN
    WHERE ID = V_ID AND PW = V_PW;
BEGIN
        OPEN CUR_ADMIN_IDPW;
          LOOP
                FETCH CUR_ADMIN_IDPW INTO C_ID, C_PW;
                -- 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태 ... 『NOTFOUND』
                EXIT WHEN CUR_ADMIN_IDPW%NOTFOUND;
                
                IF V_ID = C_ID AND V_PW = C_PW
                    THEN DBMS_OUTPUT.PUT_LINE('로그인에 성공하셨습니다.');
                END IF;
          END LOOP;
        CLOSE CUR_ADMIN_IDPW;    
    IF C_ID IS NULL OR C_PW IS NULL
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20500, '존재하지 않는 ID 혹은 PW 입니다.');
END;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 교수계정 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_INSERT
( V_NAME        IN TBL_PROFESSOR.NAME%TYPE
, V_SSN         IN TBL_PROFESSOR.SSN%TYPE
)
IS
    V_PROFNO                TBL_PROFESSOR.PROFNO%TYPE;
    V_PW                    TBL_PROFESSOR.PW%TYPE;
    CKSSN                   TBL_PROFESSOR.SSN%TYPE;
    
    PROFESSOR_CKSSN_ERROR   EXCEPTION;

BEGIN
    -- 교수 테이블에 입력한 주민번호 존재 확인
    SELECT COUNT(*) INTO CKSSN
    FROM TBL_PROFESSOR
    WHERE SSN = V_SSN;
    
    -- 이미 있는 주민번호면 예외 발생
    IF (CKSSN != 0)
        THEN RAISE PROFESSOR_CKSSN_ERROR;
    END IF;
    
    -- 교수번호 값 대입
    V_PROFNO := 'P' || LPAD(SEQ_PROFESSOR.NEXTVAL, 4, 0);
    
    -- 비밀번호 DEFAULT 설정
    V_PW := SUBSTR(V_SSN, 7);
    
    -- 쿼리작성
    INSERT INTO TBL_PROFESSOR(PROFNO, NAME, SSN, PW, REGDATE)
    VALUES(V_PROFNO, V_NAME, V_SSN, V_PW, SYSDATE);
    
    --예외처리
    EXCEPTION      
        WHEN PROFESSOR_CKSSN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '이미 존재하는 주민번호입니다.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
        
    --커밋
    --COMMIT;
END;
--==>> Procedure PRC_PROFESSOR_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈   [ 교수계정 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_UPDATE
( V_PROFNO  IN TBL_PROFESSOR.PROFNO%TYPE
, V_NAME    IN TBL_PROFESSOR.NAME%TYPE
, V_PW      IN TBL_PROFESSOR.PW%TYPE
)
IS
    PROFNO_CHECK     NUMBER;    
    PROFNO_ERROR     EXCEPTION;
BEGIN
    -- 입력한 교수번호 존재하는지 확인
    SELECT COUNT(*) INTO PROFNO_CHECK
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;

    -- 교수번호에 해당하는 사람 없으면, 예외 발생
    IF (PROFNO_CHECK = 0) 
        THEN RAISE PROFNO_ERROR;
    END IF;

    -- 쿼리작성
    UPDATE TBL_PROFESSOR
    SET NAME = V_NAME, PW = V_PW
    WHERE PROFNO = V_PROFNO;
        
    -- 예외처리
    EXCEPTION
        WHEN PROFNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '입력하신 교수번호가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
            
    -- 커밋
    --COMMIT;
END;
--==>> Procedure PRC_PROFESSOR_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 교수계정 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_DELETE
( 
    V_PROFNO  IN TBL_PROFESSOR.PROFNO%TYPE 
)
IS
    PROFNO_CHECK     NUMBER;    
    PROFNO_ERROR     EXCEPTION;
BEGIN
    -- 입력한 교수번호 존재하는지 확인
    SELECT COUNT(*) INTO PROFNO_CHECK
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;

    -- 교수번호에 해당하는 사람 없으면, 예외 발생
    IF (PROFNO_CHECK = 0) 
        THEN RAISE PROFNO_ERROR;
    END IF;
    
    -- 쿼리작성
    DELETE
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;
    
    -- 예외처리
    EXCEPTION
        WHEN PROFNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '입력하신 교수번호가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
            
    -- 커밋
    --COMMIT;
END;
--==>> Procedure PRC_PROFESSOR_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 학생계정 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_NAME   IN TBL_STUDENT.NAME%TYPE
, V_SSN    IN TBL_STUDENT.SSN%TYPE
)
IS
    V_STUDNO    TBL_STUDENT.STUDNO%TYPE;
    V_PW        TBL_STUDENT.PW%TYPE;
    CKSSN       TBL_STUDENT.SSN%TYPE;
    
    STUDENT_CKSSN_ERROR  EXCEPTION;
    
BEGIN
    -- 학생 테이블에 입력한 주민번호 존재 확인
    SELECT COUNT(*) INTO CKSSN
    FROM TBL_STUDENT
    WHERE SSN = V_SSN;
    
    -- 이미 있는 주민번호면 예외 발생
    IF (CKSSN != 0)
        THEN RAISE STUDENT_CKSSN_ERROR;
    END IF;
    
    -- 학번 값 대입
    V_STUDNO := 'S' || LPAD(SEQ_STUDENT.NEXTVAL, 5, 0);
    
    -- 비밀번호 DEFAULT 설정
    V_PW := SUBSTR(V_SSN, 7);
    
    -- 쿼리작성
    INSERT INTO TBL_STUDENT(STUDNO, NAME, SSN, PW, REGDATE)
    VALUES(V_STUDNO, V_NAME, V_SSN, V_PW, SYSDATE);
    
    
    --예외처리
    EXCEPTION      
        WHEN STUDENT_CKSSN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '이미 존재하는 주민번호입니다.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
        
    --커밋
    --COMMIT;
    
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 학생계정 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( V_STUDNO   IN TBL_STUDENT.STUDNO%TYPE
, V_NAME     IN TBL_STUDENT.NAME%TYPE
, V_PW       IN TBL_STUDENT.PW%TYPE
)
IS
    STUDNO_CHECK     NUMBER;    
    STUDNO_ERROR     EXCEPTION;
   
BEGIN
    -- 입력한 학번 존재하는지 확인
    SELECT COUNT(*) INTO STUDNO_CHECK
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;

    -- 학번에 해당하는 사람 없으면, 예외 발생
    IF (STUDNO_CHECK = 0) 
        THEN RAISE STUDNO_ERROR;
    END IF;
    
    -- 쿼리작성
    UPDATE TBL_STUDENT
    SET NAME = V_NAME, PW = V_PW
    WHERE STUDNO = V_STUDNO;
    
    -- 예외처리
    EXCEPTION
        WHEN STUDNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '입력하신 학번이 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS  
            THEN ROLLBACK;
    
    --커밋
    --COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 학생계정 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENT_DELETE
( 
    V_STUDNO   IN TBL_STUDENT.STUDNO%TYPE
)
IS
    STUDNO_CHECK     NUMBER;    
    STUDNO_ERROR     EXCEPTION;
BEGIN
    -- 입력한 학번 존재하는지 확인
    SELECT COUNT(*) INTO STUDNO_CHECK
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;

    -- 학번에 해당하는 사람 없으면, 예외 발생
    IF (STUDNO_CHECK = 0) 
        THEN RAISE STUDNO_ERROR;
    END IF;
    
    -- 쿼리작성
    DELETE
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;
    
    
    -- 예외 처리
    EXCEPTION
        WHEN STUDNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '입력하신 학번이 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
    
    --커밋
    --COMMIT;
    
END;
--==>> Procedure PRC_STUDENT_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 과정 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_COURSE_INSERT
( V_NAME    IN  TBL_COURSE.NAME%TYPE 
)
IS
    -- 시퀀스 및 조합된 과정코드를 담을 변수 선언
    V_COURSE_CODE   TBL_COURSE.COURSE_CODE%TYPE;
BEGIN
    -- 변수에 과정코드 시퀀스 담기
    V_COURSE_CODE := 'CO' || LPAD(SEQ_COURSE.NEXTVAL, 4, 0);
    
    -- 과정테이블 데이터 입력 쿼리
    INSERT INTO TBL_COURSE(COURSE_CODE, NAME)
    VALUES(V_COURSE_CODE, V_NAME);
    
    -- 커밋
    --COMMIT;
END;
--==>> Procedure PRC_COURSE_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 과정 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_COURSE_UPDATE
( V_COURSE_CODE     IN  TBL_COURSE.COURSE_CODE%TYPE
, V_NAME            IN  TBL_COURSE.NAME%TYPE 
)
IS
    COURSE_CODE_CHECK   TBL_COURSE.COURSE_CODE%TYPE;
    COURSE_CODE_ERROR   EXCEPTION;
    
BEGIN
    -- 과정코드 확인
    SELECT NVL(MAX(COURSE_CODE), NULL) INTO COURSE_CODE_CHECK
    FROM  TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    -- 없는 과목코드면, 예외 발생
    IF (COURSE_CODE_CHECK IS NULL)
        THEN RAISE COURSE_CODE_ERROR;
    END IF;

    -- 쿼리 작성
    UPDATE  TBL_COURSE
    SET     NAME = V_NAME
    WHERE   COURSE_CODE = V_COURSE_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN COURSE_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '입력하신 과정코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋
    --COMMIT;      
    
END;
--==>> Procedure PRC_COURSE_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 과정 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_COURSE_DELETE
( V_COURSE_CODE     IN  TBL_COURSE.COURSE_CODE%TYPE
)
IS
    COURSE_CODE_CHECK   TBL_COURSE.COURSE_CODE%TYPE;
    COURSE_CODE_ERROR   EXCEPTION;
    
BEGIN
    -- 과정코드 확인
    SELECT NVL(MAX(COURSE_CODE), NULL) INTO COURSE_CODE_CHECK
    FROM  TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    -- 없는 과목코드면, 예외 발생
    IF (COURSE_CODE_CHECK IS NULL)
        THEN RAISE COURSE_CODE_ERROR;
    END IF;

    -- 쿼리 작성
    DELETE
    FROM TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN COURSE_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '입력하신 과정코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋
    --COMMIT;             
END;
--==>> Procedure PRC_COURSE_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 개설과정 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENCOURSE_INSERT
( V_STARTDATE            IN TBL_OPENCOURSE.STARTDATE%TYPE
, V_ENDDATE              IN TBL_OPENCOURSE.ENDDATE%TYPE
, V_OPENCOURSE_DATE      IN TBL_OPENCOURSE.OPENCOURSE_DATE%TYPE
, V_PROFNO               IN TBL_OPENCOURSE.PROFNO%TYPE
, V_COURSE_CODE          IN TBL_OPENCOURSE.COURSE_CODE%TYPE
, V_CLASSROOM_CODE       IN TBL_OPENCOURSE.CLASSROOM_CODE%TYPE
)
IS
    V_OPENCOURSE_CODE  TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE;
    V_COUNT NUMBER := 0;
    V_OLD_ST_DATE       TBL_OPENCOURSE.STARTDATE%TYPE;
    V_OLD_END_DATE      TBL_OPENCOURSE.ENDDATE%TYPE;
    V_OLD_PROF_ID       TBL_OPENCOURSE.PROFNO%TYPE;
    V_OLD_CLASS         TBL_OPENCOURSE.CLASSROOM_CODE%TYPE;
    
    
    V_CHECK_PROFNO      TBL_OPENCOURSE.PROFNO%TYPE;
    V_CHECK_COURSE      TBL_OPENCOURSE.COURSE_CODE%TYPE;
    V_CHECK_CLASSROOM   TBL_OPENCOURSE.CLASSROOM_CODE%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION; -- 시작날짜 > 끝난날짜 일때 발생
    USER_DEFINE_ERROR3  EXCEPTION; -- 교수코드 없을시 발생
    USER_DEFINE_ERROR4  EXCEPTION; -- 과정코드 없을시 발생
    USER_DEFINE_ERROR5  EXCEPTION; -- 과정코드 없을시 발생
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT PROFNO, STARTDATE, ENDDATE, CLASSROOM_CODE
    FROM TBL_OPENCOURSE;   
    
BEGIN
    ------------------------------------ > 교수코드 없을시 예외
    SELECT NVL(MAX(PROFNO), '0') INTO V_CHECK_PROFNO 
    FROM   TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;
    
    IF V_CHECK_PROFNO = '0'
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;    
    ------------------------------------ > 과정코드 없을시 예외
    SELECT NVL(MAX(COURSE_CODE), '0') INTO V_CHECK_COURSE
    FROM   TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    IF V_CHECK_COURSE = '0'
        THEN RAISE USER_DEFINE_ERROR4;
    END IF; 
    -------------------------------------- > 강의실코드 없을시 예외
    SELECT NVL(MAX(CLASSROOM_CODE), '0') INTO V_CHECK_CLASSROOM
    FROM   TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    IF V_CHECK_CLASSROOM = '0'
        THEN RAISE USER_DEFINE_ERROR5;
    END IF; 
    --------------------------------------

    IF  (V_ENDDATE - V_STARTDATE < 0) 
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;    
    
    OPEN CUR_CHECK_DATE;
    
    LOOP 
        FETCH CUR_CHECK_DATE INTO V_OLD_PROF_ID, V_OLD_ST_DATE, V_OLD_END_DATE, V_OLD_CLASS;
        
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;
  
        IF(V_STARTDATE <= V_OLD_ST_DATE AND  V_ENDDATE >= V_OLD_ST_DATE AND (V_OLD_PROF_ID = V_PROFNO OR V_OLD_CLASS = V_CLASSROOM_CODE))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_STARTDATE <= V_OLD_END_DATE AND V_ENDDATE >= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROFNO OR V_OLD_CLASS = V_CLASSROOM_CODE))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_STARTDATE >= V_OLD_ST_DATE AND V_ENDDATE <= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROFNO OR V_OLD_CLASS = V_CLASSROOM_CODE))  
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
       
  
    END LOOP;
    
    CLOSE CUR_CHECK_DATE;
    
    V_OPENCOURSE_CODE := CONCAT('OP_CO', TO_CHAR(SEQ_OPENCOURSE_CODE.NEXTVAL));
    
    INSERT INTO TBL_OPENCOURSE(OPENCOURSE_CODE, STARTDATE, ENDDATE, OPENCOURSE_DATE, PROFNO, COURSE_CODE, CLASSROOM_CODE)
    VALUES (V_OPENCOURSE_CODE, V_STARTDATE, V_ENDDATE, V_OPENCOURSE_DATE, V_PROFNO, V_COURSE_CODE, V_CLASSROOM_CODE);  
    
   COMMIT;   

   EXCEPTION
       WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20005, '이미 진행중인 과정의 강의실 또는 교수님입니다.' );
              ROLLBACK; 
       WHEN USER_DEFINE_ERROR2
         THEN  RAISE_APPLICATION_ERROR(-20301, '시작일이 종료일보다 이후입니다.' ); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR3
         THEN  RAISE_APPLICATION_ERROR(-20002, '교수코드가 존재하지 않습니다.' ); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR4
         THEN  RAISE_APPLICATION_ERROR(-20004, '과정코드가 존재하지 않습니다.' ); 
              ROLLBACK;       
       WHEN USER_DEFINE_ERROR5
         THEN  RAISE_APPLICATION_ERROR(-20006, '강의실코드가 존재하지 않습니다.' ); 
              ROLLBACK;              
       WHEN OTHERS
        THEN ROLLBACK;

END;
--==>> Procedure PRC_OPENCOURSE_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 개설과정 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENCOURSE_UPDATE
( V_OPENCOURSE_CODE      IN TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE
, V_PROFNO               IN TBL_OPENCOURSE.PROFNO%TYPE
, V_COURSE_CODE          IN TBL_OPENCOURSE.COURSE_CODE%TYPE
, V_CLASSROOM_CODE       IN TBL_OPENCOURSE.CLASSROOM_CODE%TYPE
)
IS
    V_CHECK_OPCODE   TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE;
    V_CHECK_PROFNO   TBL_OPENCOURSE.PROFNO%TYPE;
    V_CHECK_COURSE   TBL_OPENCOURSE.COURSE_CODE%TYPE;
    V_CHECK_CLASSROOM   TBL_OPENCOURSE.CLASSROOM_CODE%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;    
    USER_DEFINE_ERROR1  EXCEPTION; -- 개설과정코드 없을 시 발생
    USER_DEFINE_ERROR2  EXCEPTION; -- 교수코드 없을시 발생
    USER_DEFINE_ERROR3  EXCEPTION; -- 과정코드 없을시 발생
    USER_DEFINE_ERROR4  EXCEPTION; -- 강의실코드 없을시 발생
    
    V_STARTDATE      TBL_OPENCOURSE.STARTDATE%TYPE;
    V_ENDDATE        TBL_OPENCOURSE.ENDDATE%TYPE;
    V_OLD_ST_DATE    TBL_OPENCOURSE.STARTDATE%TYPE;
    V_OLD_END_DATE   TBL_OPENCOURSE.ENDDATE%TYPE;
    V_OLD_PROF_ID    TBL_OPENCOURSE.PROFNO%TYPE;
    V_OLD_CLASS      TBL_OPENCOURSE.CLASSROOM_CODE%TYPE;  
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT PROFNO, STARTDATE, ENDDATE, CLASSROOM_CODE
    FROM TBL_OPENCOURSE;   
BEGIN

    ------------------------------------ > 개설과정코드 없을시 예외
    SELECT NVL(MAX(OPENCOURSE_CODE), '0') INTO V_CHECK_OPCODE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    IF  V_CHECK_OPCODE = '0'
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    ------------------------------------ > 교수코드 없을시 예외
    SELECT NVL(MAX(PROFNO), '0') INTO V_CHECK_PROFNO 
    FROM   TBL_PROFESSOR
    WHERE  PROFNO = V_PROFNO;
    
    IF V_CHECK_PROFNO IN ('0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;    
    ------------------------------------ > 과정코드 없을시 예외
    SELECT NVL(MAX(COURSE_CODE), '0') INTO V_CHECK_COURSE
    FROM   TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    IF V_CHECK_COURSE = '0'
        THEN RAISE USER_DEFINE_ERROR3;
    END IF; 
    -------------------------------------- > 강의실코드 없을시 예외
    SELECT NVL(MAX(CLASSROOM_CODE), '0') INTO V_CHECK_CLASSROOM
    FROM   TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    IF V_CHECK_CLASSROOM = '0'
        THEN RAISE USER_DEFINE_ERROR4;
    END IF; 
    
   ------------------------------------------------
   -- V_STARTDATE, V_ENDDATE 에 값 대입
   SELECT STARTDATE, ENDDATE INTO V_STARTDATE, V_ENDDATE
   FROM TBL_OPENCOURSE
   WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
   
   OPEN CUR_CHECK_DATE;
    
    LOOP 
        FETCH CUR_CHECK_DATE INTO V_OLD_PROF_ID, V_OLD_ST_DATE, V_OLD_END_DATE, V_OLD_CLASS;
        
        EXIT WHEN CUR_CHECK_DATE%NOTFOUND;
  
        IF(V_STARTDATE <= V_OLD_ST_DATE AND  V_ENDDATE >= V_OLD_ST_DATE AND (V_OLD_PROF_ID = V_PROFNO OR V_OLD_CLASS = V_CLASSROOM_CODE))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_STARTDATE <= V_OLD_END_DATE AND V_ENDDATE >= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROFNO OR V_OLD_CLASS = V_CLASSROOM_CODE))
            THEN RAISE USER_DEFINE_ERROR;
        ELSIF (V_STARTDATE >= V_OLD_ST_DATE AND V_ENDDATE <= V_OLD_END_DATE AND (V_OLD_PROF_ID = V_PROFNO OR V_OLD_CLASS = V_CLASSROOM_CODE))  
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
    END LOOP;
    
    CLOSE CUR_CHECK_DATE;
    --------------------------------------> UPDATE 쿼리
    UPDATE TBL_OPENCOURSE
    SET PROFNO = V_PROFNO, COURSE_CODE = V_COURSE_CODE, CLASSROOM_CODE = V_CLASSROOM_CODE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
     
      EXCEPTION
       WHEN USER_DEFINE_ERROR1
         THEN RAISE_APPLICATION_ERROR(-20007, '개설과정코드가 존재하지 않습니다.'); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR2
         THEN RAISE_APPLICATION_ERROR(-20002, '교수코드가 존재하지 않습니다.'); 
              ROLLBACK;       
       WHEN USER_DEFINE_ERROR3
         THEN RAISE_APPLICATION_ERROR(-20004, '과정코드가 존재하지 않습니다.'); 
              ROLLBACK;              
       WHEN USER_DEFINE_ERROR4
         THEN RAISE_APPLICATION_ERROR(-20006, '강의실코드가 존재하지 않습니다.'); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20005, '이미 진행중인 과정의 강의실 또는 교수님입니다.' );
              ROLLBACK;        
       WHEN OTHERS
        THEN ROLLBACK;
        
    -- 커밋
    --COMMIT;

END;
--==>> Procedure PRC_OPENCOURSE_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 개설과정 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENCOURSE_DELETE
( V_OPENCOURSE_CODE      IN TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE
)
IS
    USER_DEFINE_ERROR   EXCEPTION;
    V_OPCODE            TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE;
BEGIN   
    
    SELECT NVL(MAX(OPENCOURSE_CODE), '0') INTO V_OPCODE
    FROM   TBL_OPENCOURSE 
    WHERE  OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    IF V_OPCODE = '0'
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    DELETE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    EXCEPTION   
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20007, '개설과정코드가 존재하지않습니다.');
        WHEN OTHERS
            THEN ROLLBACK;
    -- 커밋
    COMMIT;          
END;
--==>> Procedure PRC_OPENCOURSE_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 과목 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_INSERT
( V_NAME            IN  TBL_SUBJECT.NAME%TYPE
)
IS
    V_SUBJECT_CODE  TBL_SUBJECT.SUBJECT_CODE%TYPE;
BEGIN
    V_SUBJECT_CODE := 'SUB' || LPAD(SEQ_SUBJECT.NEXTVAL, 4, 0);
    
    INSERT INTO TBL_SUBJECT
    VALUES(V_SUBJECT_CODE, V_NAME);

    --COMMIT;
END;
--==>> Procedure PRC_SUBJECT_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 과목 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_UPDATE
( V_SUBJECT_CODE  IN  TBL_SUBJECT.SUBJECT_CODE%TYPE
, V_NAME          IN  TBL_SUBJECT.NAME%TYPE
)
IS
    SUBJECT_CODE_CHECK      TBL_SUBJECT.SUBJECT_CODE%TYPE;
    SUBJECT_CODE_ERROR      EXCEPTION;
    
BEGIN  
    -- 과목코드 확인
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- 없는 과목코드면, 예외 발생
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    UPDATE TBL_SUBJECT
    SET NAME = V_NAME
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '입력하신 과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋        
    --COMMIT;
END;
--==>> Procedure PRC_SUBJECT_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 과목 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_DELETE
( V_SUBJECT_CODE  IN  TBL_SUBJECT.SUBJECT_CODE%TYPE
)
IS
    SUBJECT_CODE_CHECK      TBL_SUBJECT.SUBJECT_CODE%TYPE;
    SUBJECT_CODE_ERROR      EXCEPTION;
    
BEGIN
    -- 과목코드 확인
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- 없는 과목코드면, 예외 발생
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    DELETE TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '입력하신 과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋
    --COMMIT;
END;
--==>> Procedure PRC_SUBJECT_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 개설과목 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_INSERT
( V_STARTDATE         IN  TBL_OPENSUBJECT.STARTDATE%TYPE
, V_ENDDATE           IN  TBL_OPENSUBJECT.ENDDATE%TYPE
, V_OPENCOURSE_CODE   IN  TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE
, V_SUBJECT_CODE      IN  TBL_SUBJECT.SUBJECT_CODE%TYPE
, V_BOOK_CODE         IN  TBL_BOOK.BOOK_CODE%TYPE
)
IS
    V_COURSE_STARTDATE      TBL_OPENCOURSE.STARTDATE%TYPE;
    V_COURSE_ENDDATE        TBL_OPENCOURSE.ENDDATE%TYPE;
    V_OPENSUBJECT_CODE      TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE;
    V_CUR_STARTDATE         TBL_OPENSUBJECT.STARTDATE%TYPE;
    V_CUR_ENDDATE           TBL_OPENSUBJECT.ENDDATE%TYPE;
    
    OPENCOURSE_CODE_CHECK   TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE;
    SUBJECT_CODE_CHECK      TBL_SUBJECT.SUBJECT_CODE%TYPE;
    SUBJECT_OVERLAP_CHECK   NUMBER;
    BOOK_CODE_CHECK         TBL_BOOK.BOOK_CODE%TYPE;  
    
    SUBJECT_DATE_ERROR          EXCEPTION;
    COURSE_DATE_ERROR           EXCEPTION;
    SUBJECT_DATE_OVERLAP_ERROR  EXCEPTION;
    OPENCOURSE_CODE_ERROR       EXCEPTION;  
    BOOK_CODE_ERROR             EXCEPTION;
    SUBJECT_CODE_ERROR          EXCEPTION;
    SUBJECT_OVERLAP_ERROR       EXCEPTION;
    
    CURSOR CUR_OPENSUBJECT_DATE
    IS
    SELECT STARTDATE, ENDDATE
    FROM TBL_OPENSUBJECT
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE
    ORDER BY STARTDATE;
BEGIN
    -- 과목시작일 <= 과목완료일, 아니면 예외 발생
    IF ( NOT(V_STARTDATE <= V_ENDDATE) )
        THEN RAISE SUBJECT_DATE_ERROR;
    END IF;
    
    -- 개설과정코드 확인
    SELECT NVL(MAX(OPENCOURSE_CODE), NULL) INTO OPENCOURSE_CODE_CHECK
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    -- 없는 개설과정코드면, 예외 발생
    IF (OPENCOURSE_CODE_CHECK IS NULL)
        THEN RAISE OPENCOURSE_CODE_ERROR;
    END IF;
    
    -- 개설과정시작일, 개설과정완료일 변수에 값 대입
    SELECT STARTDATE, ENDDATE INTO V_COURSE_STARTDATE, V_COURSE_ENDDATE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
      
    -- 과목코드 확인
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- 없는 과목코드면, 예외 발생
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
   
    -- 교재코드 확인
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- 없는 교재코드면, 예외 발생
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
    
    -- 과정기간 안에 없으면, 예외 발생
    -- (과목시작일 >= 과정시작일 AND 과목완료일 <= 과정완료일)
    IF ( NOT(V_STARTDATE >= V_COURSE_STARTDATE AND V_ENDDATE <= V_COURSE_ENDDATE) )
        THEN RAISE COURSE_DATE_ERROR;
    END IF;
   
    -- 같은과정 내에 있는 과목끼리 기간 겹치면, 예외 발생
    OPEN CUR_OPENSUBJECT_DATE;
    
    LOOP
        FETCH CUR_OPENSUBJECT_DATE INTO V_CUR_STARTDATE, V_CUR_ENDDATE;
        
        EXIT WHEN CUR_OPENSUBJECT_DATE%NOTFOUND;
        
        IF (V_STARTDATE <= V_CUR_STARTDATE AND V_ENDDATE >= V_CUR_STARTDATE)
            THEN RAISE SUBJECT_DATE_OVERLAP_ERROR;
        ELSIF (V_STARTDATE <= V_CUR_ENDDATE AND V_ENDDATE >= V_CUR_ENDDATE)
            THEN RAISE SUBJECT_DATE_OVERLAP_ERROR;    
        ELSIF (V_STARTDATE >= V_CUR_STARTDATE AND V_ENDDATE <= V_CUR_ENDDATE)
            THEN RAISE SUBJECT_DATE_OVERLAP_ERROR;
        END IF;
     END LOOP;  
     
    CLOSE CUR_OPENSUBJECT_DATE;  
            
    -- 해당 과정내에 개설된 과목코드와 겹치는 과목코드인지 확인
    SELECT COUNT(*) INTO SUBJECT_OVERLAP_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE
      AND SUBJECT_CODE = V_SUBJECT_CODE;
      
    -- 중복되는 과목코드 있으면, 예외 발생  
    IF (SUBJECT_OVERLAP_CHECK != 0)
        THEN RAISE SUBJECT_OVERLAP_ERROR;
    END IF;
 
    -- 개설과목코드 값 대입
    V_OPENSUBJECT_CODE := 'OPSUB' || LPAD(SEQ_OPENSUBJECT.NEXTVAL, 4, 0);
    
    -- 쿼리작성
    INSERT INTO TBL_OPENSUBJECT(OPENSUBJECT_CODE, STARTDATE, ENDDATE, OPENCOURSE_CODE, SUBJECT_CODE, BOOK_CODE)
    VALUES(V_OPENSUBJECT_CODE, V_STARTDATE, V_ENDDATE, V_OPENCOURSE_CODE, V_SUBJECT_CODE, V_BOOK_CODE);
    
    -- 예외처리
    EXCEPTION
        WHEN SUBJECT_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20302, '과목시작일/과목완료일 입력 오류');
                 ROLLBACK; 
        WHEN OPENCOURSE_CODE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '입력하신 개설과정코드가 존재하지 않습니다.');
                 ROLLBACK;   
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '입력하신 과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '입력하신 교재코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN COURSE_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20303, '과정기간 확인 후 입력해주세요');
                 ROLLBACK; 
        WHEN SUBJECT_DATE_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20010, '과정 내 과목날짜 중복 오류');
                 ROLLBACK;                  
        WHEN SUBJECT_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '과정 안에 이미 존재하는 과목코드입니다.');
                 ROLLBACK;                     
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈  [ 개설과목 정보(배점제외) UPDATE 프로시저 ]  ◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_UPDATE
( V_OPENSUBJECT_CODE  IN  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
, V_STARTDATE         IN  TBL_OPENSUBJECT.STARTDATE%TYPE
, V_ENDDATE           IN  TBL_OPENSUBJECT.ENDDATE%TYPE
, V_OPENCOURSE_CODE   IN  TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE
, V_SUBJECT_CODE      IN  TBL_SUBJECT.SUBJECT_CODE%TYPE
, V_BOOK_CODE         IN  TBL_BOOK.BOOK_CODE%TYPE    
)
IS 
    V_ATTEND                    TBL_OPENSUBJECT.ATTEND%TYPE;  
    V_PRACTICE                  TBL_OPENSUBJECT.PRACTICE%TYPE;
    V_WRITE                     TBL_OPENSUBJECT.WRITE%TYPE; 
    V_COURSE_STARTDATE          TBL_OPENCOURSE.STARTDATE%TYPE;
    V_COURSE_ENDDATE            TBL_OPENCOURSE.ENDDATE%TYPE;
    V_CUR_STARTDATE             TBL_OPENSUBJECT.STARTDATE%TYPE;
    V_CUR_ENDDATE               TBL_OPENSUBJECT.ENDDATE%TYPE;
    
    OPENSUBJECT_CODE_CHECK      TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE;
    OPENCOURSE_CODE_CHECK       TBL_OPENCOURSE.OPENCOURSE_CODE%TYPE;
    SUBJECT_CODE_CHECK          TBL_SUBJECT.SUBJECT_CODE%TYPE;
    SUBJECT_OVERLAP_CHECK       NUMBER;
    BOOK_CODE_CHECK             TBL_BOOK.BOOK_CODE%TYPE;  
    
    OPENSUBJECT_CODE_ERROR      EXCEPTION;
    SUBJECT_DATE_ERROR          EXCEPTION;
    COURSE_DATE_ERROR           EXCEPTION;
    SUBJECT_DATE_OVERLAP_ERROR  EXCEPTION;
    OPENCOURSE_CODE_ERROR       EXCEPTION;  
    BOOK_CODE_ERROR             EXCEPTION;
    SUBJECT_CODE_ERROR          EXCEPTION;
    SUBJECT_OVERLAP_ERROR       EXCEPTION;
    
    CURSOR CUR_OPENSUBJECT_DATE
    IS
    SELECT STARTDATE, ENDDATE
    FROM TBL_OPENSUBJECT
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE
    ORDER BY STARTDATE;

BEGIN
    -- UPDATE : 예전에 입력했던 데이터 DELETE 후 → INSERT 진행
    
    -- 개설과목코드 확인
    SELECT NVL(MAX(OPENSUBJECT_CODE), NULL) INTO OPENSUBJECT_CODE_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 없는 개설과목코드면, 예외 발생
    IF (OPENSUBJECT_CODE_CHECK IS NULL)
        THEN RAISE OPENSUBJECT_CODE_ERROR;
    END IF;
    
    -- DELETE 전에 : V_ATTEND, V_PRACTICE, V_WRITE 에 원래 정해놓은 출석, 실기, 필기 값 넣어주기
    SELECT ATTEND, PRACTICE, WRITE INTO V_ATTEND, V_PRACTICE, V_WRITE
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- DELETE 진행
    DELETE
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 과목시작일 <= 과목완료일, 아니면 예외 발생
    IF ( NOT(V_STARTDATE <= V_ENDDATE) )
        THEN RAISE SUBJECT_DATE_ERROR;
    END IF;
    
    -- 개설과정코드 확인
    SELECT NVL(MAX(OPENCOURSE_CODE), NULL) INTO OPENCOURSE_CODE_CHECK
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    -- 없는 개설과정코드면, 예외 발생
    IF (OPENCOURSE_CODE_CHECK IS NULL)
        THEN RAISE OPENCOURSE_CODE_ERROR;
    END IF;
    
    -- 개설과정시작일, 개설과정완료일 변수에 값 대입
    SELECT STARTDATE, ENDDATE INTO V_COURSE_STARTDATE, V_COURSE_ENDDATE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
      
    -- 과목코드 확인
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- 없는 과목코드면, 예외 발생
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
   
    -- 교재코드 확인
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- 없는 교재코드면, 예외 발생
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
      
    -- 과정기간 안에 없으면, 예외 발생
    -- (과목시작일 >= 과정시작일 AND 과목완료일 <= 과정완료일)
    IF ( NOT(V_STARTDATE >= V_COURSE_STARTDATE AND V_ENDDATE <= V_COURSE_ENDDATE) )
        THEN RAISE COURSE_DATE_ERROR;
    END IF;
   
    -- 같은과정 내에 있는 과목끼리 기간 겹치면, 예외 발생
    OPEN CUR_OPENSUBJECT_DATE;
    
    LOOP
        FETCH CUR_OPENSUBJECT_DATE INTO V_CUR_STARTDATE, V_CUR_ENDDATE;
        
        EXIT WHEN CUR_OPENSUBJECT_DATE%NOTFOUND;
        
        IF (V_STARTDATE <= V_CUR_STARTDATE AND V_ENDDATE >= V_CUR_STARTDATE)
            THEN RAISE SUBJECT_DATE_OVERLAP_ERROR;
        ELSIF (V_STARTDATE <= V_CUR_ENDDATE AND V_ENDDATE >= V_CUR_ENDDATE)
            THEN RAISE SUBJECT_DATE_OVERLAP_ERROR;    
        ELSIF (V_STARTDATE >= V_CUR_STARTDATE AND V_ENDDATE <= V_CUR_ENDDATE)
            THEN RAISE SUBJECT_DATE_OVERLAP_ERROR;
        END IF;
     END LOOP;  
     
    CLOSE CUR_OPENSUBJECT_DATE;  
            
    -- 해당 과정내에 개설된 과목코드와 겹치는 과목코드인지 확인
    SELECT COUNT(*) INTO SUBJECT_OVERLAP_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE
      AND SUBJECT_CODE = V_SUBJECT_CODE;
      
    -- 중복되는 과목코드 있으면, 예외 발생  
    IF (SUBJECT_OVERLAP_CHECK != 0)
        THEN RAISE SUBJECT_OVERLAP_ERROR;
    END IF;

    -- 쿼리작성
    INSERT INTO TBL_OPENSUBJECT
    VALUES(V_OPENSUBJECT_CODE, V_STARTDATE, V_ENDDATE, SYSDATE
         , V_ATTEND, V_PRACTICE, V_WRITE, V_OPENCOURSE_CODE, V_SUBJECT_CODE, V_BOOK_CODE);
    
    -- 예외처리
    EXCEPTION
        WHEN OPENSUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20012, '입력하신 개설과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN SUBJECT_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20302, '과목시작일/과목완료일 입력 오류');
                 ROLLBACK; 
        WHEN OPENCOURSE_CODE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '입력하신 개설과정코드가 존재하지 않습니다.');
                 ROLLBACK;   
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '입력하신 과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '입력하신 교재코드가 존재하지 않습니다.');
                 ROLLBACK;   
        WHEN COURSE_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20303, '과정기간 확인 후 입력해주세요');
                 ROLLBACK; 
        WHEN SUBJECT_DATE_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20010, '과정 내 과목날짜 중복 오류');
                 ROLLBACK;                  
        WHEN SUBJECT_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '과정 안에 이미 존재하는 과목코드입니다.');
                 ROLLBACK;                     
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈  [ 개설과목 정보(배점) UPDATE 프로시저 ]  ◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_SCORE_UPDATE
( V_OPENSUBJECT_CODE  IN  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
, V_ATTEND            IN  TBL_OPENSUBJECT.ATTEND%TYPE  
, V_PRACTICE          IN  TBL_OPENSUBJECT.PRACTICE%TYPE
, V_WRITE             IN  TBL_OPENSUBJECT.WRITE%TYPE  
)
IS
    OPENSUBJECT_CODE_CHECK      TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE; 
    
    OPENSUBJECT_CODE_ERROR      EXCEPTION;
    SCORE_ALLOT_ERROR           EXCEPTION;

BEGIN
    -- 개설과목코드 확인
    SELECT NVL(MAX(OPENSUBJECT_CODE), NULL) INTO OPENSUBJECT_CODE_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 없는 개설과목코드면, 예외 발생
    IF (OPENSUBJECT_CODE_CHECK IS NULL)
        THEN RAISE OPENSUBJECT_CODE_ERROR;
    END IF;
    
    -- 출결 + 실기 + 실기 배점 = 100 확인 후, 아니면 예외 발생
    IF (NVL(V_ATTEND, 0) + NVL(V_PRACTICE, 0) + NVL(V_WRITE, 0) != 100)
        THEN RAISE SCORE_ALLOT_ERROR;
    END IF;
    
    -- 쿼리작성
    UPDATE TBL_OPENSUBJECT
    SET ATTEND = V_ATTEND, PRACTICE = V_PRACTICE, WRITE = V_WRITE
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 예외처리
    EXCEPTION
        WHEN OPENSUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20012, '입력하신 개설과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN SCORE_ALLOT_ERROR
            THEN RAISE_APPLICATION_ERROR(-20401, '배점 입력 오류');
                 ROLLBACK;          
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_SCORE_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 개설과목 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_DELETE
( V_OPENSUBJECT_CODE  IN  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
)
IS
    OPENSUBJECT_CODE_CHECK      TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE;
    OPENSUBJECT_CODE_ERROR      EXCEPTION;
    
BEGIN  
    -- 개설과목코드 확인
    SELECT NVL(MAX(OPENSUBJECT_CODE), NULL) INTO OPENSUBJECT_CODE_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 없는 개설과목코드면, 예외 발생
    IF (OPENSUBJECT_CODE_CHECK IS NULL)
        THEN RAISE OPENSUBJECT_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    DELETE FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN OPENSUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20012, '입력하신 개설과목코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈  [ 중도탈락 학생 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROP_INSERT
( V_SIGNCOURSE_CODE   IN  TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE
, V_REASON_CODE       IN  TBL_DROPREASON.REASON_CODE%TYPE
)
IS
    SIGNCOURSE_CODE_CHECK   TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE;
    SIGNCOURSE_CODE_ERROR   EXCEPTION;
BEGIN
    -- 수강신청코드 확인
    SELECT NVL(MAX(SIGNCOURSE_CODE), NULL) INTO SIGNCOURSE_CODE_CHECK
    FROM TBL_DROP
    WHERE SIGNCOURSE_CODE = V_SIGNCOURSE_CODE;
    
    -- 이미 존재하는 수강신청코드면, 예외 발생
    IF (SIGNCOURSE_CODE_CHECK IS NOT NULL)
        THEN RAISE SIGNCOURSE_CODE_ERROR;
    END IF;

    -- 쿼리 작성
    INSERT INTO TBL_DROP(DROP_CODE, SIGNCOURSE_CODE, REASON_CODE)
    VALUES(SEQ_DROP.NEXTVAL, V_SIGNCOURSE_CODE, V_REASON_CODE);
    
    -- 예외 처리
    EXCEPTION
        WHEN SIGNCOURSE_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20013, '중복된 수강신청 코드입니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_DROP_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈  [ 중도탈락 사유 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROP_UPDATE
( V_DROP_CODE    IN  TBL_DROP.DROP_CODE%TYPE
, V_REASON_CODE  IN  TBL_DROPREASON.REASON_CODE%TYPE
)
IS
    DROP_CODE_CHECK     TBL_DROP.DROP_CODE%TYPE;
    REASON_CODE_CHECK   TBL_DROPREASON.REASON_CODE%TYPE;
    
    DROP_CODE_ERROR     EXCEPTION;
    REASON_CODE_ERROR   EXCEPTION;
    
BEGIN
    -- 중도탈락코드 확인
    SELECT NVL(MAX(DROP_CODE), NULL) INTO DROP_CODE_CHECK
    FROM TBL_DROP
    WHERE DROP_CODE = V_DROP_CODE;
    
    -- 없는 중도탈락코드면, 예외 발생
    IF (DROP_CODE_CHECK IS NULL)
        THEN RAISE DROP_CODE_ERROR;
    END IF;
    
    -- 중도탈락사유코드 확인
    SELECT NVL(MAX(REASON_CODE), NULL) INTO REASON_CODE_CHECK
    FROM TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- 없는 중도탈락사유코드면, 예외 발생
    IF (REASON_CODE_CHECK IS NULL)
        THEN RAISE REASON_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    UPDATE TBL_DROP
    SET REASON_CODE = V_REASON_CODE
    WHERE DROP_CODE = V_DROP_CODE;   
    
    -- 예외 처리
    EXCEPTION
        WHEN DROP_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '입력하신 중도탈락코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN REASON_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20015, '입력하신 중도탈락사유코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_DROP_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈  [ 중도탈락 학생 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROP_DELETE
( V_DROP_CODE IN  TBL_DROP.DROP_CODE%TYPE
)
IS
    DROP_CODE_CHECK     TBL_DROP.DROP_CODE%TYPE;
    DROP_CODE_ERROR     EXCEPTION;
BEGIN
    -- 중도탈락코드 확인
    SELECT NVL(MAX(DROP_CODE), NULL) INTO DROP_CODE_CHECK
    FROM TBL_DROP
    WHERE DROP_CODE = V_DROP_CODE;
    
    -- 없는 중도탈락코드면, 예외 발생
    IF (DROP_CODE_CHECK IS NULL)
        THEN RAISE DROP_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    DELETE TBL_DROP
    WHERE DROP_CODE = V_DROP_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN DROP_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '입력하신 중도탈락코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_DROP_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈  [ 중도탈락 사유 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROPREASON_INSERT
( V_REASON    IN  TBL_DROPREASON.REASON%TYPE
)
IS
BEGIN
    -- 쿼리작성
    INSERT INTO TBL_DROPREASON
    VALUES(SEQ_DROPREASON.NEXTVAL, V_REASON);
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_DROPREASON_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈  [ 중도탈락 사유 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROPREASON_UPDATE
( V_REASON_CODE   IN  TBL_DROPREASON.REASON_CODE%TYPE
, V_REASON        IN  TBL_DROPREASON.REASON%TYPE
)
IS
    REASON_CODE_CHECK   TBL_DROPREASON.REASON_CODE%TYPE;
    REASON_CODE_ERROR   EXCEPTION;
BEGIN
    -- 중도탈락코드 확인
    SELECT NVL(MAX(REASON_CODE), NULL) INTO REASON_CODE_CHECK
    FROM TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- 없는 중도탈락코드면, 예외 발생
    IF (REASON_CODE_CHECK IS NULL)
        THEN RAISE REASON_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    UPDATE TBL_DROPREASON
    SET REASON = V_REASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN REASON_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '입력하신 중도탈락코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋             
    --COMMIT;
END;
--==>> Procedure PRC_DROPREASON_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈  [ 중도탈락 사유 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROPREASON_DELETE
( V_REASON_CODE   IN  TBL_DROPREASON.REASON_CODE%TYPE   
)
IS
    REASON_CODE_CHECK   TBL_DROPREASON.REASON_CODE%TYPE;
    REASON_CODE_ERROR   EXCEPTION;
BEGIN
    -- 중도탈락코드 확인
    SELECT NVL(MAX(REASON_CODE), NULL) INTO REASON_CODE_CHECK
    FROM TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- 없는 중도탈락코드면, 예외 발생
    IF (REASON_CODE_CHECK IS NULL)
        THEN RAISE REASON_CODE_ERROR;
    END IF;

    -- 쿼리 작성
    DELETE TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN REASON_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '입력하신 중도탈락코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_DROPREASON_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 교재 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_BOOK_INSERT
(  V_NAME      IN  TBL_BOOK.NAME%TYPE
,  V_AUTHOR    IN  TBL_BOOK.AUTHOR%TYPE
,  V_PUBLISHER IN  TBL_BOOK.PUBLISHER%TYPE
)
IS
BEGIN
    -- 쿼리작성
    INSERT INTO TBL_BOOK
    VALUES(SEQ_BOOK.NEXTVAL, V_NAME, V_AUTHOR, V_PUBLISHER);
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_BOOK_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 교재 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_BOOK_UPDATE
( V_BOOK_CODE IN  TBL_BOOK.BOOK_CODE%TYPE
, V_NAME      IN  TBL_BOOK.NAME%TYPE
, V_AUTHOR    IN  TBL_BOOK.AUTHOR%TYPE
, V_PUBLISHER IN  TBL_BOOK.PUBLISHER%TYPE    
)
IS
    BOOK_CODE_CHECK     TBL_BOOK.BOOK_CODE%TYPE;   
    BOOK_CODE_ERROR     EXCEPTION;
BEGIN
    -- 교재코드 확인
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- 없는 교재코드면, 예외 발생
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    UPDATE TBL_BOOK
    SET NAME = V_NAME, AUTHOR = V_AUTHOR, PUBLISHER = V_PUBLISHER
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '입력하신 교재코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋             
    --COMMIT;
END;
--==>> Procedure PRC_BOOK_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 교재 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_BOOK_DELETE
( V_BOOK_CODE IN  TBL_BOOK.BOOK_CODE%TYPE
)
IS
    BOOK_CODE_CHECK     TBL_BOOK.BOOK_CODE%TYPE;   
    BOOK_CODE_ERROR     EXCEPTION;
BEGIN
    -- 교재코드 확인
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- 없는 교재코드면, 예외 발생
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    DELETE TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '입력하신 교재코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋 
    --COMMIT;
END;
--==>> Procedure PRC_BOOK_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 강의실 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_INSERT
( V_CLASSROOM_CODE        IN  TBL_CLASSROOM.CLASSROOM_CODE%TYPE
, V_CLASSROOM_COMMENT     IN  TBL_CLASSROOM.CLASSROOM_COMMENT%TYPE
, V_CAPACITY              IN  TBL_CLASSROOM.CAPACITY%TYPE    
)
IS
    CLASSROOM_CODE_CHECK    TBL_CLASSROOM.CLASSROOM_CODE%TYPE;   
    CLASSROOM_CODE_ERROR    EXCEPTION;
BEGIN
    -- 강의실코드 확인
    SELECT NVL(MAX(CLASSROOM_CODE), NULL) INTO CLASSROOM_CODE_CHECK
    FROM TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- 이미 존재하는 강의실코드면, 예외 발생
    IF (CLASSROOM_CODE_CHECK IS NOT NULL)
        THEN RAISE CLASSROOM_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    INSERT INTO TBL_CLASSROOM
    VALUES(V_CLASSROOM_CODE, V_CLASSROOM_COMMENT, V_CAPACITY);
    
    -- 예외 처리
    EXCEPTION
        WHEN CLASSROOM_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20016, '중복된 강의실 코드입니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈  [ 강의실 정보 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_UPDATE
( V_CLASSROOM_CODE        IN  TBL_CLASSROOM.CLASSROOM_CODE%TYPE
, V_CLASSROOM_COMMENT     IN  TBL_CLASSROOM.CLASSROOM_COMMENT%TYPE
, V_CAPACITY              IN  TBL_CLASSROOM.CAPACITY%TYPE    
)
IS
    CLASSROOM_CODE_CHECK    TBL_CLASSROOM.CLASSROOM_CODE%TYPE;   
    CLASSROOM_CODE_ERROR    EXCEPTION;
BEGIN
    -- 강의실 코드 확인
    SELECT NVL(MAX(CLASSROOM_CODE), NULL) INTO CLASSROOM_CODE_CHECK
    FROM TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- 없는 강의실이면, 예외 발생
    IF (CLASSROOM_CODE_CHECK IS NULL)
        THEN RAISE CLASSROOM_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    UPDATE TBL_CLASSROOM
    SET CLASSROOM_COMMENT = V_CLASSROOM_COMMENT, CAPACITY = V_CAPACITY
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN CLASSROOM_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '입력하신 강의실코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
                
    -- 커밋    
    --COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 강의실 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_DELETE
( V_CLASSROOM_CODE        IN  TBL_CLASSROOM.CLASSROOM_CODE%TYPE
)
IS
    CLASSROOM_CODE_CHECK    TBL_CLASSROOM.CLASSROOM_CODE%TYPE;   
    CLASSROOM_CODE_ERROR    EXCEPTION;
BEGIN
    -- 강의실 코드 확인
    SELECT NVL(MAX(CLASSROOM_CODE), NULL) INTO CLASSROOM_CODE_CHECK
    FROM TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- 없는 강의실이면, 예외 발생
    IF (CLASSROOM_CODE_CHECK IS NULL)
        THEN RAISE CLASSROOM_CODE_ERROR;
    END IF;
    
    -- 쿼리 작성
    DELETE TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN CLASSROOM_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '입력하신 강의실코드가 존재하지 않습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- 커밋     
    --COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_DELETE이(가) 컴파일되었습니다.


--------------------------------------------------------------------------------
-- ▣▣▣▣▣▣▣▣▣▣▣▣▣     < 교수 >     ▣▣▣▣▣▣▣▣▣▣▣▣▣▣ --
--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 교수계정 LOGIN 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_LOGIN
( V_ID      IN  TBL_PROFESSOR.PROFNO%TYPE
, V_PW      IN  TBL_PROFESSOR.PW%TYPE
)
IS
    V_PW2               TBL_PROFESSOR.PW%TYPE;
    V_SUBJECT_NAME      TBL_SUBJECT.NAME%TYPE;
    V_ENDDATE           TBL_OPENSUBJECT.ENDDATE%TYPE;
    USER_DEFINE_ERROR1  EXCEPTION;  -- 아이디나 패스워드가 올바르지 않은 경우
    USER_DEFINE_ERROR2  EXCEPTION;  -- 해당 교수가 성적 처리 할 개설과목이 없는 경우
    
    CURSOR CUR_OPENSUBJECT_SELECT
    IS
    SELECT 과목
    FROM VIEW_PROFESSOR_LOGIN
    WHERE 교수번호 = V_ID AND 과목완료일 <= SYSDATE;
    --WHERE 교수번호 = V_ID AND 과목완료일 = TO_DATE('2022-03-18', 'YYYY-MM-DD');
    
BEGIN
    
    V_PW2 := -1;
    V_SUBJECT_NAME := 'N';
    
    -- 관리자 테이블의 비밀번호 변수에 담기
    SELECT PW INTO V_PW2
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_ID;

    
    -- 비밀번호 맞는 지 확인 후 VIEW 띄우기
    IF (V_PW = V_PW2)
        THEN
            OPEN CUR_OPENSUBJECT_SELECT;
            
            LOOP
                FETCH CUR_OPENSUBJECT_SELECT INTO V_SUBJECT_NAME;
                
                IF(V_SUBJECT_NAME = 'N')       -- 해당 교수가 성적 처리할 개설과목이 없는 경우
                    THEN RAISE USER_DEFINE_ERROR2;
                END IF;
        
                -- 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태 ... 『NOTFOUND』
                EXIT WHEN CUR_OPENSUBJECT_SELECT%NOTFOUND;
        
                -- 출력
                DBMS_OUTPUT.PUT_LINE(V_SUBJECT_NAME);
                
            END LOOP;
    ELSE
        RAISE USER_DEFINE_ERROR1;   -- 아이디나 비밀번호가 올바르지 않은 경우 에러 발생
    END IF;
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20004, '아이디나 비밀번호가 올바르지 않습니다.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '성적 처리할 개설과목이 없습니다.');
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('오류 발생');
        
    -- 이상 없을 시
    --COMMIT;
    
END;
--==>> Procedure PRC_PRFESSOR_LOGIN이(가) 컴파일되었습니다.
--------------------------------------------------------------------------------
--  ◈◈  [ 교수가 특정 과목 눌렀을 때 화면 출력 프로시저 ]  ◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_SUBJECT_SELECT
( V_OPENSUBJECT_CODE    IN  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
, V_OPENCOURSE_CODE     IN  TBL_OPENSUBJECT.OPENCOURSE_CODE%TYPE
)
IS
    V_STUDNO            TBL_STUDENT.STUDNO%TYPE;
    V_NAME              TBL_STUDENT.NAME%TYPE;
    V_ATTEND            TBL_SCORE.ATTEND%TYPE;
    V_PRACTICE          TBL_SCORE.PRACTICE%TYPE;
    V_WRITE             TBL_SCORE.WRITE%TYPE;
    V_SIGNCOURSE_CODE   TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE;
    V_DROPOX            CHAR(2);
    
    -- 커서 정의
    CURSOR CUR_SCORE_SELECT
    IS 
    SELECT 학번, 학생이름, 출결점수, 필기점수, 실기점수, 중도탈락여부
    FROM VIEW_SCORE_PRINT
    WHERE 개설과정코드 = V_OPENCOURSE_CODE AND 개설과목코드 = V_OPENSUBJECT_CODE;
    
BEGIN
    
    OPEN CUR_SCORE_SELECT; -- 커서 내용 채우기
    
    LOOP
        FETCH CUR_SCORE_SELECT INTO V_STUDNO, V_NAME, V_ATTEND, V_PRACTICE, V_WRITE, V_DROPOX;
        
        -- 커서에서 더 이상 데이터가 쏟아져 나오지 않는 상태 ... 『NOTFOUND』
        EXIT WHEN CUR_SCORE_SELECT%NOTFOUND;
        
        -- 출력
        IF(V_DROPOX = 'X')
            THEN DBMS_OUTPUT.PUT_LINE(V_STUDNO || '  ' || V_NAME || '  ' || V_ATTEND || '점  ' || V_PRACTICE || '점  ' || V_WRITE || '점  ');
        END IF;
                
    END LOOP;
END;

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈  [ 담당과목 성적 INSERT 프로시저 ]  ◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_SCORE_INSERT
( VC_OPENSUBJECT_CODE   IN TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
, V_SUBJECT_NAME        IN  TBL_SUBJECT.NAME%TYPE
, V_STUDNO              IN  TBL_STUDENT.STUDNO%TYPE
, V_ATTEND              IN  TBL_SCORE.ATTEND%TYPE
, V_PRACTICE            IN  TBL_SCORE.PRACTICE%TYPE
, V_WRITE               IN  TBL_SCORE.WRITE%TYPE
)
IS
    V_TEST_STUDNO       TBL_STUDENT.STUDNO%TYPE;
    V_OPENSUBJECT_CODE  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE; -- 개설과목코드
    V_SIGNCOURSE_CODE   TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE;   -- 수강신청코드
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    V_TEST_STUDNO := '-1';
    
    IF(V_ATTEND > 100 OR V_PRACTICE > 100 OR V_WRITE > 100) -- 점수들이 100점을 초과할 경우
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT OPENSUBJECT_CODE INTO V_OPENSUBJECT_CODE
    FROM TBL_SUBJECT SJ LEFT JOIN TBL_OPENSUBJECT OS
                        ON SJ.SUBJECT_CODE = OS.SUBJECT_CODE
    WHERE NAME = V_SUBJECT_NAME AND OPENSUBJECT_CODE = VC_OPENSUBJECT_CODE;
    
    SELECT SIGNCOURSE_CODE, STUDNO INTO V_SIGNCOURSE_CODE, V_TEST_STUDNO
    FROM TBL_SIGNCOURSE
    WHERE STUDNO = V_STUDNO;
    
    -- 예외 발생
    IF (V_TEST_STUDNO = '-1') -- 해당 학번이 과목에 존재하지 않을 경우
        THEN RAISE NO_DATA_FOUND;
    END IF;
    
    -- INSERT 구문
    INSERT INTO TBL_SCORE(SCORE_CODE, ATTEND, PRACTICE, WRITE, OPENSUBJECT_CODE, SIGNCOURSE_CODE)
           VALUES(SEQ_SCORE.NEXTVAL, V_ATTEND, V_PRACTICE, V_WRITE, V_OPENSUBJECT_CODE, V_SIGNCOURSE_CODE);
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '각 점수는 100점을 초과할 수 없습니다.');
        WHEN NO_DATA_FOUND
            THEN RAISE_APPLICATION_ERROR(-20002, '학번이 ' || V_STUDNO || '인 학생이 존재하지 않습니다.');
END;
--==>> Procedure PRC_PROFESSOR_SCORE_INSERT이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 성적 배점 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_OS_UPDATE
( V_OPENSUBJECT_CODE  IN  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
, V_ATTEND            IN  TBL_OPENSUBJECT.ATTEND%TYPE
, V_PRACTICE          IN  TBL_OPENSUBJECT.PRACTICE%TYPE
, V_WRITE             IN  TBL_OPENSUBJECT.WRITE%TYPE
)
IS
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    -- 총 배점이 100점이 아닐 경우 에러 발생
    IF ( V_ATTEND + V_PRACTICE + V_WRITE != 100)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE TBL_OPENSUBJECT
    SET ATTEND = V_ATTEND, PRACTICE = V_PRACTICE, WRITE = V_WRITE
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '총 배점 합은 100점이어야 합니다.');
        --WHEN OTHERS
            --THEN ROLLBACK;
    
    -- 이상 없을 시
    --COMMIT;
    
END;
--==>> Procedure PRC_PROFESSOR_OS_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 성적 UPDATE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_SCORE_UPDATE
( V_SCORE_CODE          IN  TBL_SCORE.SCORE_CODE%TYPE
, V_ATTEND              IN  TBL_SCORE.ATTEND%TYPE
, V_PRACTICE            IN  TBL_SCORE.PRACTICE%TYPE
, V_WRITE               IN  TBL_SCORE.WRITE%TYPE
)
IS
    V_TEST_SCORE_CODE   TBL_SCORE.SCORE_CODE%TYPE;
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    IF(V_ATTEND > 100 OR V_PRACTICE > 100 OR V_WRITE > 100) -- 점수들이 100점을 초과할 경우
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT SCORE_CODE INTO V_TEST_SCORE_CODE
    FROM TBL_SCORE
    WHERE SCORE_CODE = V_SCORE_CODE;
    
    -- 성적 테이블 UPDATE
    UPDATE TBL_SCORE
    SET ATTEND = V_ATTEND, PRACTICE = V_PRACTICE, WRITE = V_WRITE
      , SCORE_DATE = SYSDATE
    WHERE SCORE_CODE = V_SCORE_CODE;
    
    -- 에러 발생 시
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '각 점수는 100점을 초과할 수 없습니다.');
        WHEN NO_DATA_FOUND 
            THEN RAISE_APPLICATION_ERROR(-20002, '해당 SCORE_CODE 데이터가 존재하지 않습니다.');
    /*  WHEN OTHERS
            THEN ROLLBACK;*/
    
    -- 이상 없을 시
    --COMMIT;
    
END;
--==>> Procedure PRC_PROFESSOR_SCORE_UPDATE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈◈  [ 성적 DELETE 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_SCORE_DELETE
( V_SCORE_CODE  IN  TBL_SCORE.SCORE_CODE%TYPE
)
IS
    V_TEST_SCORE_CODE   TBL_SCORE.SCORE_CODE%TYPE;
    
BEGIN

    SELECT SCORE_CODE INTO V_TEST_SCORE_CODE
    FROM TBL_SCORE
    WHERE SCORE_CODE = V_SCORE_CODE;
    
    -- DELETE
    DELETE
    FROM TBL_SCORE
    WHERE SCORE_CODE = V_SCORE_CODE;
    
    
    
    -- 에러 발생 시
    EXCEPTION
        WHEN NO_DATA_FOUND
            THEN RAISE_APPLICATION_ERROR(-20001, '해당 SCORE_CODE 데이터가 존재하지 않습니다.');
    /*EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;*/
    
    -- 이상 없을 시
    --COMMIT;
    
END;
--==>> Procedure PRC_PROFESSOR_SCORE_DELETE이(가) 컴파일되었습니다.

--------------------------------------------------------------------------------
-- ▣▣▣▣▣▣▣▣▣▣▣▣▣     < 학생 >     ▣▣▣▣▣▣▣▣▣▣▣▣▣▣ --
--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 학생계정 LOGIN 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUD_LOGIN
( V_STUDNO      IN  TBL_STUDENT.STUDNO%TYPE
, V_PW          IN  TBL_STUDENT.PW%TYPE
)
IS
    V_STUDNO2       TBL_STUDENT.STUDNO%TYPE;
    V_PW2           TBL_STUDENT.PW%TYPE;
    V_TOT           NUMBER(3);
    V_COURSE        TBL_COURSE.NAME%TYPE;
    V_SUBJECT       TBL_SUBJECT.NAME%TYPE;
    V_ENDDATE       TBL_OPENSUBJECT.ENDDATE%TYPE;
    
    CURSOR CUR_STUDENT_SUBJECT
    IS
    SELECT 과정명, 과목명, 종료일자
    FROM VIEW_STUD_ALL_SUBJECT
    WHERE 학번 = V_STUDNO AND 종료일자 >= SYSDATE AND 총점 IS NOT NULL;
    
    USER_DEFINE_ERROR       EXCEPTION;
    USER_DEFINE_ERROR2      EXCEPTION;
    
BEGIN
    
    SELECT PW INTO V_PW2
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;
    
    SELECT STUDNO  INTO  V_STUDNO2
    FROM TBL_DROP D JOIN TBL_SIGNCOURSE S
         ON D.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE;
    
     SELECT 총점 INTO V_TOT
        FROM
        (
            SELECT STUDNO, (ATTEND + PRACTICE + WRITE) "총점"
                FROM TBL_SIGNCOURSE SC LEFT JOIN TBL_SCORE CR
                        ON SC.SIGNCOURSE_CODE = CR.SIGNCOURSE_CODE
        )
        WHERE STUDNO = V_STUDNO;

    
    IF (V_PW != V_PW2)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    IF (V_STUDNO = V_STUDNO2 AND V_TOT IS NULL)
            THEN RAISE USER_DEFINE_ERROR2;
    END IF;

    OPEN CUR_STUDENT_SUBJECT;
           LOOP
               FETCH CUR_STUDENT_SUBJECT INTO V_COURSE, V_SUBJECT, V_ENDDATE;
               EXIT WHEN CUR_STUDENT_SUBJECT%NOTFOUND;
               DBMS_OUTPUT.PUT_LINE('과정명 : ' || V_COURSE || ' | 과목명 : ' || V_SUBJECT || ' | 종료일자 : ' || V_ENDDATE);
           END LOOP;
      CLOSE CUR_STUDENT_SUBJECT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '학번 또는 패스워드를 잘못 입력하였습니다. 다시 입력하세요.');
            
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '과정에서 중도탈락한 학생입니다. 수강완료한 과목이 없습니다.');

END; 
--==>> Procedure PRC_STUD_LOGIN이(가) 컴파일되었습니다.          

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 전체성적 출력 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
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
    V_DROPDATE      VARCHAR2(50);
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

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 개별성적 출력 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
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
    V_DROPDATE      VARCHAR2(50);
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

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈  [ 수강신청 입력 프로시저 ]  ◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
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

/*==============================================================================
-- ■□■□■□■□■□■□■  [ 뷰(VIEW) 목록 ]  ■□■□■□■□■□■□■  -- 
===============================================================================*/

--------------------------------------------------------------------------------
--  ◈◈◈◈◈◈◈◈◈◈   [ 교수 - 로그인 뷰 ]   ◈◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_PROFESSOR_LOGIN
AS
SELECT PF.PROFNO "교수번호", SJ.NAME "과목", OS.ENDDATE "과목완료일"
FROM TBL_PROFESSOR PF RIGHT JOIN TBL_OPENCOURSE OC   ON PF.PROFNO = OC.PROFNO
                      RIGHT JOIN TBL_OPENSUBJECT OS ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                      LEFT JOIN TBL_SUBJECT SJ     ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE;
--==>> View VIEW_PROFESSOR_LOGIN이(가) 생성되었습니다.

SELECT *
FROM VIEW_PROFESSOR_LOGIN;
--==>>
/*
P0002	자바 기초	2022-04-02
           :
*/

--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈  [ 교수 - 성적확인 뷰 ]  ◈◈◈◈◈◈◈◈◈◈◈◈  --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_PROFESSOR_SCORE
AS
SELECT PR.NAME"교수명", ST.NAME"학생명", OP.STARTDATE "과목시작일",OP.ENDDATE "과목종료일"
     , CR.NAME"과정명", SU.NAME"과목명", BK.NAME "교재명", SR.ATTEND "출결", SR.PRACTICE "실기"
     , SR.WRITE "필기", (SR.ATTEND + SR.PRACTICE + SR.WRITE) "총점", DENSE_RANK()OVER(ORDER BY SR.ATTEND+SR.PRACTICE+SR.WRITE DESC) AS "등수"
     , CASE WHEN SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE
            THEN 'Y' 
            ELSE 'N'
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
                                                    ON OS.OPENSUBJECT_CODE= SR.OPENSUBJECT_CODE
                                                    LEFT JOIN TBL_DROP DR
                                                         ON SC.SIGNCOURSE_CODE=DR.SIGNCOURSE_CODE
                                                         LEFT JOIN TBL_DROPREASON DRS
                                                              ON DR.REASON_CODE=DRS.REASON_CODE
                                                              LEFT JOIN TBL_STUDENT ST
                                                                   ON SC.STUDNO=ST.STUDNO
                                                                   LEFT JOIN TBL_SUBJECT SU
                                                                        ON OS.SUBJECT_CODE= SU.SUBJECT_CODE
                                                                        LEFT JOIN TBL_BOOK BK
                                                                             ON OS.BOOK_CODE=BK.BOOK_CODE;
--==>> View VIEW_PROFESSOR_SCORE이(가) 생성되었습니다.

SELECT *
FROM VIEW_PROFESSOR_SCORE; 
--==>>
/*
이아린		2022-07-02	2023-08-02	오라클의 모든 것을 배우는 과정							1	N
*/

--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈  [ 교수 - 성적입력 뷰 ] ◈◈◈◈◈◈◈◈◈◈◈◈   --
--------------------------------------------------------------------------------
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
-- ◈◈◈◈◈◈◈◈◈◈  [ 관리자 - 교수확인 뷰 ]  ◈◈◈◈◈◈◈◈◈◈    --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_ADMIN_PROFCHECK
AS
SELECT P.NAME "교수명", SJ.NAME "과목명", OS.STARTDATE "과목시작일", OS.ENDDATE "과목종료일"
     , B.NAME "교재명", CR.CLASSROOM_COMMENT "강의실"
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
-- ◈◈◈◈◈◈◈◈◈◈  [ 관리자 - 학생확인 뷰 ]  ◈◈◈◈◈◈◈◈◈◈    --
--------------------------------------------------------------------------------
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
김정용	JAVA로 시작하는 코딩과정	자바 중급		    N	(null)	(null)	
김상기	(null)		                                N	(null)	(null)		
이시우	오라클의 모든 것을 배우는 과정	자바 기초	N	(null)	(null)		
김정용	JAVA로 시작하는 코딩과정	자바 기초		    N	(null)	(null)		
*/

--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈◈  [ 관리자 - 과목정보 뷰 ] ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
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
-- ◈◈◈◈◈◈◈◈◈◈◈  [ 관리자 - 과정정보 뷰 ] ◈◈◈◈◈◈◈◈◈◈◈ --
--------------------------------------------------------------------------------
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
오라클의 모든 것을 배우는 과정	A201	    자바 기초	2022-03-02	2022-06-20	그것이 오라클	이아린
                                    :
*/

--------------------------------------------------------------------------------
-- ◈◈◈◈◈◈◈◈◈◈   [ 학생 - 수강과목 뷰 ]   ◈◈◈◈◈◈◈◈◈◈    --
--------------------------------------------------------------------------------

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
                                                  ON SC.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE AND OS.OPENSUBJECT_CODE = S.OPENSUBJECT_CODE                              
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
-- ◈◈◈◈◈◈◈◈◈◈  [ 학생 - 수강과목통합 뷰 ] ◈◈◈◈◈◈◈◈◈◈    --
--------------------------------------------------------------------------------

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
1111111	김정용	JAVA로 시작하는 코딩과정	    자바 기초	2022-03-01	2022-08-20	이것이 자바다					1	-	-
                                                :
*/



/*==============================================================================
-- ■□■□■□■□■□■  [ 시퀀스(SEQUENCE) 목록 ]  ■□■□■□■□■□■  -- 
===============================================================================*/

-- ◈ 수강신청 시퀀스
CREATE SEQUENCE SEQ_SIGNCOURSE
NOCACHE;
--==>> Sequence SEQ_SIGNCOURSE이(가) 생성되었습니다.

-- ◈ 중도탈락 시퀀스
CREATE SEQUENCE SEQ_DROP
NOCACHE;
--==>> Sequence SEQ_DROP이(가) 생성되었습니다.

-- ◈ 중도탈락사유 시퀀스
CREATE SEQUENCE SEQ_DROPREASON
NOCACHE;
--==>> Sequence SEQ_DROPREASON이(가) 생성되었습니다.

-- ◈ 과목 시퀀스
CREATE SEQUENCE SEQ_SUBJECT
NOCACHE;
--==>> Sequence SEQ_SUBJECT이(가) 생성되었습니다.

-- ◈ 개설 과목 시퀀스
CREATE SEQUENCE SEQ_OPENSUBJECT
NOCACHE;
--==>> Sequence SEQ_OPENSUBJECT이(가) 생성되었습니다.

-- ◈ 교재 시퀀스 
CREATE SEQUENCE SEQ_BOOK
NOCACHE;
--==>> Sequence SEQ_BOOK이(가) 생성되었습니다.

-- ◈ 학생 시퀀스
CREATE SEQUENCE SEQ_STUDENT
NOCACHE;
--==>> Sequence SEQ_STUDENT이(가) 생성되었습니다.

-- ◈ 교수 시퀀스
CREATE SEQUENCE SEQ_PROFESSOR
NOCACHE;
--==>> Sequence SEQ_PROFESSOR이(가) 생성되었습니다.

-- ◈ 과정 시퀀스
CREATE SEQUENCE SEQ_COURSE
NOCACHE;
--==>> Sequence SEQ_COURSE이(가) 생성되었습니다.

-- ◈ 개설과정 시퀀스
CREATE SEQUENCE SEQ_OPENCOURSE_CODE
NOCACHE;
--==>> Sequence SEQ_OPENCOURSE_CODE이(가) 생성되었습니다.

-- ◈ 성적입력 시퀀스
CREATE SEQUENCE SEQ_SCORE
NOCACHE;
--==>> Sequence SEQ_SCORE이(가) 생성되었습니다.
--------------------------------------------------------------------------------

