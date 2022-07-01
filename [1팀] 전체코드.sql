SELECT USER
FROM DUAL;
--==>> TEAM1


/*==============================================================================
-- �������������  [ ���̺�(TABLE)��� ] �������������  -- 
===============================================================================*/

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�  [ ���� ���̺� (TBL_PROFESSOR) ]   �¢¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_PROFESSOR
( PROFNO    VARCHAR2(20)            CONSTRAINT PROFESSOR_PROFNO_NN  NOT NULL    
, NAME      VARCHAR2(50)            CONSTRAINT PROFESSOR_NAME_NN    NOT NULL
, SSN       CHAR(13)                CONSTRAINT PROFESSOR_SSN_NN     NOT NULL
, PW        VARCHAR2(20)            CONSTRAINT PROFESSOR_PW_NN      NOT NULL
, REGDATE   DATE DEFAULT SYSDATE    CONSTRAINT PROFESSOR_REGDATE_NN NOT NULL
, CONSTRAINT PROFESSOR_PROFNO_PK    PRIMARY KEY(PROFNO)
);
--==>> Table TBL_PROFESSOR��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_PROFESSOR
VALUES('P0001', '�����', '9603292234567', '0000', TO_DATE('2002-10-01', 'YYYY-MM-DD'));
INSERT INTO TBL_PROFESSOR
VALUES('P0002', '�̾Ƹ�', '9911172234567', '0000', TO_DATE('2001-11-01', 'YYYY-MM-DD'));
INSERT INTO TBL_PROFESSOR
VALUES('P0003', '��ȣ��', '9611121234567', '0000', TO_DATE('2004-12-01', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_PROFESSOR;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�   [ �л� ���̺� (TBL_STUDENT) ]    �¢¢¢¢¢¢¢¢� ---
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
--==>> Table TBL_STUDENT��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_STUDENT
VALUES('1111111', '������', '9606082234567', '1234', TO_DATE('2020-01-29', 'YYYY-MM-DD'));
INSERT INTO TBL_STUDENT
VALUES('2222222', '�̽ÿ�', '9605152234567', '1234', TO_DATE('2022-03-14', 'YYYY-MM-DD'));
INSERT INTO TBL_STUDENT
VALUES('3333333', '����', '9610041234567', '1234', TO_DATE('2019-05-07', 'YYYY-MM-DD'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_STUDENT;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�   [ ������ ���̺� (TBL_ADMIN) ]    �¢¢¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_ADMIN
( ID        VARCHAR2(20)    CONSTRAINT ADMIN_ID_NN      NOT NULL
, PW        VARCHAR2(20)    CONSTRAINT ADMIN_PW_NN      NOT NULL
, NAME      VARCHAR2(50)    CONSTRAINT ADMIN_NAME_NN    NOT NULL
, REGDATE   DATE            DEFAULT SYSDATE             CONSTRAINT ADMIN_REGDATE_NN NOT NULL 
, CONSTRAINT ADMIN_ID_PK    PRIMARY KEY(ID)
);
--==>> Table TBL_ADMIN��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_ADMIN(ID, PW, NAME, REGDATE)
VALUES('team1_1', '1234', '������', SYSDATE);
INSERT INTO TBL_ADMIN(ID, PW, NAME, REGDATE)
VALUES('team1_2', '0000', '���', SYSDATE);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_ADMIN;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�   [ ���� ���̺� (TBL_COURSE) ]   �¢¢¢¢¢¢¢¢¢� ---
-------------------------------------------------------------------------------
CREATE TABLE TBL_COURSE
( COURSE_CODE   VARCHAR2(20)     CONSTRAINT COURSE_CODE_NN   NOT NULL   
, NAME          VARCHAR2(100)    CONSTRAINT COURSE_NAME_NN   NOT NULL
, CONSTRAINT COURSE_CODE_PK      PRIMARY KEY(COURSE_CODE)
);
--==>> Table TBL_COURSE��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_COURSE
VALUES('JAVA001', 'JAVA�� �����ϴ� �ڵ�����');
INSERT INTO TBL_COURSE
VALUES('PYTHON001', '���ʺ��� �����ϴ� ���̽� ����');
INSERT INTO TBL_COURSE
VALUES('ORA001', '����Ŭ�� ��� ���� ���� ����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT * 
FROM TBL_COURSE;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�   [ �������� ���̺� (TBL_OPENCOURSE) ]  �¢¢¢¢¢¢¢� ---
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
--==>> Table TBL_OPENCOURSE��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_OPENCOURSE
VALUES('OPJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), 'P0001', 'JAVA001', 'A101');
INSERT INTO TBL_OPENCOURSE
VALUES('OPORA001', TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), TO_DATE('2021-12-30', 'YYYY-MM-DD'), 'P0002', 'ORA001', 'A201');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_OPENCOURSE;

COMMIT;

-- FOREIGN KEY �������� �߰�
ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_PROFNO_FK FOREIGN KEY(PROFNO)
                REFERENCES TBL_PROFESSOR(PROFNO);
--==>> Table TBL_OPENCOURSE��(��) ����Ǿ����ϴ�.

ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_COURSE_CODE_FK FOREIGN KEY(COURSE_CODE)
                REFERENCES TBL_COURSE(COURSE_CODE);
--==>> Table TBL_OPENCOURSE��(��) ����Ǿ����ϴ�.

ALTER TABLE TBL_OPENCOURSE
ADD CONSTRAINT OPENCOURSE_CLASSROOM_CODE_FK FOREIGN KEY(CLASSROOM_CODE)
                REFERENCES TBL_CLASSROOM(CLASSROOM_CODE);
--==>> Table TBL_OPENCOURSE��(��) ����Ǿ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�  [  ���� ���̺� (TBL_SUBJECT) ]  �¢¢¢¢¢¢¢� ---
-------------------------------------------------------------------------------
CREATE TABLE TBL_SUBJECT
( SUBJECT_CODE              VARCHAR2(20)     CONSTRAINT SUBJECT_CODE_NN NOT NULL
, NAME                      VARCHAR2(100)    CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_CODE_PK PRIMARY KEY(SUBJECT_CODE)
);
--==>> Table TBL_SUBJECT��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_SUBJECT
VALUES('SJAVA001', '�ڹ� ����');
INSERT INTO TBL_SUBJECT
VALUES('SJAVA002', '�ڹ� �߱�');
INSERT INTO TBL_SUBJECT
VALUES('SJAVA003', '�ڹ� ��ȭ');
INSERT INTO TBL_SUBJECT
VALUES('SORA001', '����Ŭ �Թ�');
INSERT INTO TBL_SUBJECT
VALUES('SORA002', '����Ŭ �߱�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_SUBJECT;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�   [ �������� ���̺� (TBL_OPENSUBJECT) ]  �¢¢¢¢¢¢� ---
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
--==>> Table TBL_OPENSUBJECT��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_OPENSUBJECT
VALUES('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-03-31', 'YYYY-MM-DD')
      , TO_DATE('2022-01-02', 'YYYY-MM-DD'), NULL, NULL, NULL, 'OPJAVA001', 'SJAVA001', 'J001');
INSERT INTO TBL_OPENSUBJECT
VALUES('OPSORA001', TO_DATE('2022-03-02', 'YYYY-MM-DD'), TO_DATE('2022-04-02', 'YYYY-MM-DD')
      , TO_DATE('2021-12-30', 'YYYY-MM-DD'), NULL, NULL, NULL, 'OPORA001', 'SORA001', 'O001');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_OPENSUBJECT;

COMMIT;

-- FOREIGN KEY �������� �߰�
ALTER TABLE TBL_OPENSUBJECT
ADD ( CONSTRAINT OPENSUBJECT_OPENCOURSE_FK FOREIGN KEY(OPENCOURSE_CODE)
                 REFERENCES TBL_OPENCOURSE(OPENCOURSE_CODE)                
    , CONSTRAINT OPENSUBJECT_SUBJECT_CODE_FK FOREIGN KEY(SUBJECT_CODE)
                 REFERENCES TBL_SUBJECT(SUBJECT_CODE)                
    , CONSTRAINT OPENSUBJECT_BOOK_CODE_FK FOREIGN KEY(BOOK_CODE)
                 REFERENCES TBL_BOOK(BOOK_CODE)
    );
--==>> Table TBL_OPENSUBJECT��(��) ����Ǿ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�   [ ������û ���̺� (TBL_SIGNCOURSE) ]  �¢¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_SIGNCOURSE
( SIGNCOURSE_CODE   NUMBER          CONSTRAINT SIGNCOURSE_CODE_NN            NOT NULL -- ������ ���        
, SIGNCOURSE_DATE   DATE            CONSTRAINT SIGNCOURSE_DATE_NN            NOT NULL
, STUDNO            VARCHAR2(20)    CONSTRAINT SIGNCOURSE_STUDNO_NN          NOT NULL
, OPENCOURSE_CODE   VARCHAR2(20)    CONSTRAINT SIGNCOURSE_OPENCOURSE_CODE_NN NOT NULL
, CONSTRAINT SIGNCOURSE_CODE_PK PRIMARY KEY(SIGNCOURSE_CODE)
);
--==>> Table TBL_SIGNCOURSE��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_SIGNCOURSE
VALUES(SEQ_SIGNCOURSE.NEXTVAL, TO_DATE('2022-01-25', 'YYYY-MM-DD'), '1111111', 'OPJAVA001');
INSERT INTO TBL_SIGNCOURSE
VALUES(SEQ_SIGNCOURSE.NEXTVAL, TO_DATE('2022-02-14', 'YYYY-MM-DD'), '2222222', 'OPORA001');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_SIGNCOURSE;

COMMIT;

-- FOREIGN KEY �������� �߰�
ALTER TABLE TBL_SIGNCOURSE
ADD CONSTRAINT SIGNCOURSE_STUDNO_FK FOREIGN KEY(STUDNO)
                REFERENCES TBL_STUDENT(STUDNO);
--==>> Table TBL_SIGNCOURSE��(��) ����Ǿ����ϴ�.                

ALTER TABLE TBL_SIGNCOURSE
ADD CONSTRAINT SIGNCOURSE_OPENCOURSE_CODE_FK FOREIGN KEY(OPENCOURSE_CODE)
                REFERENCES TBL_OPENCOURSE(OPENCOURSE_CODE);    
--==>> Table TBL_SIGNCOURSE��(��) ����Ǿ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�   [ ���� ���̺� (TBL_SCORE) ]   �¢¢¢¢¢¢¢¢¢� ---
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
--==>> Table TBL_SCORE��(��) �����Ǿ����ϴ�.


-- FOREIGN KEY �������� �߰�
ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_OPENSUBJECT_CODE_FK FOREIGN KEY(OPENSUBJECT_CODE)
                                         REFERENCES TBL_OPENSUBJECT(OPENSUBJECT_CODE);  
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

ALTER TABLE TBL_SCORE
ADD CONSTRAINT SCORE_SIGNCOURSE_CODE_FK FOREIGN KEY(SIGNCOURSE_CODE)
                                         REFERENCES TBL_SIGNCOURSE(SIGNCOURSE_CODE);  
--==>> Table TBL_SCORE��(��) ����Ǿ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�   [ �ߵ�Ż�� ���̺� (TBL_DROP) ]   �¢¢¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_DROP
(   DROP_CODE           NUMBER                      CONSTRAINT DROP_CODE_NN NOT NULL
,   DROP_DATE           DATE    DEFAULT SYSDATE     CONSTRAINT DROP_DATE_NN NOT NULL
,   SIGNCOURSE_CODE     NUMBER                      CONSTRAINT DROP_SIGNCOURSE_CODE_NN NOT NULL
,   REASON_CODE         NUMBER                      CONSTRAINT DROP_REASON_CODE_NN NOT NULL
,CONSTRAINT DROP_CODE_PK PRIMARY KEY(DROP_CODE)
);
--==>>Table TBL_DROP��(��) �����Ǿ����ϴ�.

-- FOREIGN KEY �������� �߰�
ALTER TABLE TBL_DROP
ADD( CONSTRAINT DROP_SIGNCOURSE_CODE_FK FOREIGN KEY(SIGNCOURSE_CODE)
                REFERENCES TBL_SIGNCOURSE(SIGNCOURSE_CODE)
   , CONSTRAINT DROP_REASON_CODE_FK FOREIGN KEY(REASON_CODE)
                REFERENCES TBL_DROPREASON(REASON_CODE)
    );    
--==>> Table TBL_DROP��(��) ����Ǿ����ϴ�.   

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢�   [ �ߵ�Ż������ ���̺� (TBL_DROPREASON) ]   �¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_DROPREASON
(   REASON_CODE    NUMBER               CONSTRAINT DROPREASON_REASON_CODE_NN NOT NULL
,   REASON         VARCHAR2(100)        CONSTRAINT DROPREASON_REASON_NN NOT NULL
,CONSTRAINT DROPREASON_REASON_CODE_PK   PRIMARY KEY(REASON_CODE)
);
--==>> Table TBL_DROPREASON��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '���ܰἮ5ȸ');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '���������3ȸ');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '�к�̳�');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, 'ǰ��ҷ�');
INSERT INTO TBL_DROPREASON
VALUES(SEQ_DROPREASON.NEXTVAL, '���λ���');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_DROPREASON;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�   [ ���ǽ� ���̺� (TBL_CLASSROOM) ]   �¢¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_CLASSROOM
( CLASSROOM_CODE    VARCHAR2(20)    CONSTRAINT CLASSROOM_CODE_NN   NOT NULL   
, CLASSROOM_COMMENT VARCHAR2(100)    
, CAPACITY          NUMBER
, CONSTRAINT CLASSROOM_CODE_PK     PRIMARY KEY(CLASSROOM_CODE)
);
--==>> Table TBL_CLASSROOM��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_CLASSROOM
VALUES('A101', 'A�� 101ȣ', 30);
INSERT INTO TBL_CLASSROOM
VALUES('A201', 'A�� 201ȣ', 40);
INSERT INTO TBL_CLASSROOM
VALUES('A301', 'A�� 301ȣ', 60);
INSERT INTO TBL_CLASSROOM
VALUES('B102', 'B�� 102ȣ', 30);
INSERT INTO TBL_CLASSROOM
VALUES('B202', 'B�� 202ȣ', 40);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_CLASSROOM;

COMMIT;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�   [ ���� ���̺� (TBL_BOOK) ]   �¢¢¢¢¢¢¢¢¢� ---
--------------------------------------------------------------------------------
CREATE TABLE TBL_BOOK
( BOOK_CODE                    VARCHAR2(20)     CONSTRAINT BOOK_CODE_NN NOT NULL
, NAME                         VARCHAR2(100)    CONSTRAINT BOOK_NAME_NN NOT NULL
, AUTHOR                       VARCHAR2(50)
, PUBLISHER                    VARCHAR2(50)
, CONSTRAINT BOOK_CODE_PK PRIMARY KEY(BOOK_CODE)
);
--==>> Table TBL_BOOK��(��) �����Ǿ����ϴ�.


-- ������ ����
INSERT INTO TBL_BOOK
VALUES('J001', '�̰��� �ڹٴ�', '��Ƹ�', '�������ǻ�');
INSERT INTO TBL_BOOK
VALUES('P001', 'ó�� �����ϴ� ���̽�', '��ȣ��', '������ǻ�');
INSERT INTO TBL_BOOK
VALUES('O001', '�װ��� ����Ŭ', '�Žÿ�', '�λ����ǻ�');
INSERT INTO TBL_BOOK
VALUES('M001', '�̻����', '�ֻ��', '�������ǻ�');
INSERT INTO TBL_BOOK
VALUES('C001', '������ C����', '������', '�泲���ǻ�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_BOOK;

COMMIT;



/*==============================================================================
-- ������������ [ ���ν���(PROCEDURE) ��� ] ������������  -- 
===============================================================================*/
--------------------------------------------------------------------------------
-- �ââââââââââââ�     < ������ >     �âââââââââââââ� --
--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ������ �α��� ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
-- ������ �α���
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
    USER_DEFINE_ERROR1   EXCEPTION; --ID PWƲ�����
    
    CURSOR CUR_ADMIN_IDPW
    IS
    SELECT ID, PW
    FROM TBL_ADMIN
    WHERE ID = V_ID AND PW = V_PW;
BEGIN
        OPEN CUR_ADMIN_IDPW;
          LOOP
                FETCH CUR_ADMIN_IDPW INTO C_ID, C_PW;
                -- Ŀ������ �� �̻� �����Ͱ� ����� ������ �ʴ� ���� ... ��NOTFOUND��
                EXIT WHEN CUR_ADMIN_IDPW%NOTFOUND;
                
                IF V_ID = C_ID AND V_PW = C_PW
                    THEN DBMS_OUTPUT.PUT_LINE('�α��ο� �����ϼ̽��ϴ�.');
                END IF;
          END LOOP;
        CLOSE CUR_ADMIN_IDPW;    
    IF C_ID IS NULL OR C_PW IS NULL
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;    
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20500, '�������� �ʴ� ID Ȥ�� PW �Դϴ�.');
END;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    -- ���� ���̺� �Է��� �ֹι�ȣ ���� Ȯ��
    SELECT COUNT(*) INTO CKSSN
    FROM TBL_PROFESSOR
    WHERE SSN = V_SSN;
    
    -- �̹� �ִ� �ֹι�ȣ�� ���� �߻�
    IF (CKSSN != 0)
        THEN RAISE PROFESSOR_CKSSN_ERROR;
    END IF;
    
    -- ������ȣ �� ����
    V_PROFNO := 'P' || LPAD(SEQ_PROFESSOR.NEXTVAL, 4, 0);
    
    -- ��й�ȣ DEFAULT ����
    V_PW := SUBSTR(V_SSN, 7);
    
    -- �����ۼ�
    INSERT INTO TBL_PROFESSOR(PROFNO, NAME, SSN, PW, REGDATE)
    VALUES(V_PROFNO, V_NAME, V_SSN, V_PW, SYSDATE);
    
    --����ó��
    EXCEPTION      
        WHEN PROFESSOR_CKSSN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '�̹� �����ϴ� �ֹι�ȣ�Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
        
    --Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_PROFESSOR_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�   [ �������� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    -- �Է��� ������ȣ �����ϴ��� Ȯ��
    SELECT COUNT(*) INTO PROFNO_CHECK
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;

    -- ������ȣ�� �ش��ϴ� ��� ������, ���� �߻�
    IF (PROFNO_CHECK = 0) 
        THEN RAISE PROFNO_ERROR;
    END IF;

    -- �����ۼ�
    UPDATE TBL_PROFESSOR
    SET NAME = V_NAME, PW = V_PW
    WHERE PROFNO = V_PROFNO;
        
    -- ����ó��
    EXCEPTION
        WHEN PROFNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�Է��Ͻ� ������ȣ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
            
    -- Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_PROFESSOR_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_DELETE
( 
    V_PROFNO  IN TBL_PROFESSOR.PROFNO%TYPE 
)
IS
    PROFNO_CHECK     NUMBER;    
    PROFNO_ERROR     EXCEPTION;
BEGIN
    -- �Է��� ������ȣ �����ϴ��� Ȯ��
    SELECT COUNT(*) INTO PROFNO_CHECK
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;

    -- ������ȣ�� �ش��ϴ� ��� ������, ���� �߻�
    IF (PROFNO_CHECK = 0) 
        THEN RAISE PROFNO_ERROR;
    END IF;
    
    -- �����ۼ�
    DELETE
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;
    
    -- ����ó��
    EXCEPTION
        WHEN PROFNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�Է��Ͻ� ������ȣ�� �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
            
    -- Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_PROFESSOR_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �л����� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    -- �л� ���̺� �Է��� �ֹι�ȣ ���� Ȯ��
    SELECT COUNT(*) INTO CKSSN
    FROM TBL_STUDENT
    WHERE SSN = V_SSN;
    
    -- �̹� �ִ� �ֹι�ȣ�� ���� �߻�
    IF (CKSSN != 0)
        THEN RAISE STUDENT_CKSSN_ERROR;
    END IF;
    
    -- �й� �� ����
    V_STUDNO := 'S' || LPAD(SEQ_STUDENT.NEXTVAL, 5, 0);
    
    -- ��й�ȣ DEFAULT ����
    V_PW := SUBSTR(V_SSN, 7);
    
    -- �����ۼ�
    INSERT INTO TBL_STUDENT(STUDNO, NAME, SSN, PW, REGDATE)
    VALUES(V_STUDNO, V_NAME, V_SSN, V_PW, SYSDATE);
    
    
    --����ó��
    EXCEPTION      
        WHEN STUDENT_CKSSN_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '�̹� �����ϴ� �ֹι�ȣ�Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
        
    --Ŀ��
    --COMMIT;
    
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �л����� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    -- �Է��� �й� �����ϴ��� Ȯ��
    SELECT COUNT(*) INTO STUDNO_CHECK
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;

    -- �й��� �ش��ϴ� ��� ������, ���� �߻�
    IF (STUDNO_CHECK = 0) 
        THEN RAISE STUDNO_ERROR;
    END IF;
    
    -- �����ۼ�
    UPDATE TBL_STUDENT
    SET NAME = V_NAME, PW = V_PW
    WHERE STUDNO = V_STUDNO;
    
    -- ����ó��
    EXCEPTION
        WHEN STUDNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�Է��Ͻ� �й��� �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS  
            THEN ROLLBACK;
    
    --Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_STUDENT_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �л����� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENT_DELETE
( 
    V_STUDNO   IN TBL_STUDENT.STUDNO%TYPE
)
IS
    STUDNO_CHECK     NUMBER;    
    STUDNO_ERROR     EXCEPTION;
BEGIN
    -- �Է��� �й� �����ϴ��� Ȯ��
    SELECT COUNT(*) INTO STUDNO_CHECK
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;

    -- �й��� �ش��ϴ� ��� ������, ���� �߻�
    IF (STUDNO_CHECK = 0) 
        THEN RAISE STUDNO_ERROR;
    END IF;
    
    -- �����ۼ�
    DELETE
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;
    
    
    -- ���� ó��
    EXCEPTION
        WHEN STUDNO_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '�Է��Ͻ� �й��� �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS 
            THEN ROLLBACK;
    
    --Ŀ��
    --COMMIT;
    
END;
--==>> Procedure PRC_STUDENT_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_COURSE_INSERT
( V_NAME    IN  TBL_COURSE.NAME%TYPE 
)
IS
    -- ������ �� ���յ� �����ڵ带 ���� ���� ����
    V_COURSE_CODE   TBL_COURSE.COURSE_CODE%TYPE;
BEGIN
    -- ������ �����ڵ� ������ ���
    V_COURSE_CODE := 'CO' || LPAD(SEQ_COURSE.NEXTVAL, 4, 0);
    
    -- �������̺� ������ �Է� ����
    INSERT INTO TBL_COURSE(COURSE_CODE, NAME)
    VALUES(V_COURSE_CODE, V_NAME);
    
    -- Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_COURSE_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_COURSE_UPDATE
( V_COURSE_CODE     IN  TBL_COURSE.COURSE_CODE%TYPE
, V_NAME            IN  TBL_COURSE.NAME%TYPE 
)
IS
    COURSE_CODE_CHECK   TBL_COURSE.COURSE_CODE%TYPE;
    COURSE_CODE_ERROR   EXCEPTION;
    
BEGIN
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(COURSE_CODE), NULL) INTO COURSE_CODE_CHECK
    FROM  TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (COURSE_CODE_CHECK IS NULL)
        THEN RAISE COURSE_CODE_ERROR;
    END IF;

    -- ���� �ۼ�
    UPDATE  TBL_COURSE
    SET     NAME = V_NAME
    WHERE   COURSE_CODE = V_COURSE_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN COURSE_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    --COMMIT;      
    
END;
--==>> Procedure PRC_COURSE_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_COURSE_DELETE
( V_COURSE_CODE     IN  TBL_COURSE.COURSE_CODE%TYPE
)
IS
    COURSE_CODE_CHECK   TBL_COURSE.COURSE_CODE%TYPE;
    COURSE_CODE_ERROR   EXCEPTION;
    
BEGIN
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(COURSE_CODE), NULL) INTO COURSE_CODE_CHECK
    FROM  TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (COURSE_CODE_CHECK IS NULL)
        THEN RAISE COURSE_CODE_ERROR;
    END IF;

    -- ���� �ۼ�
    DELETE
    FROM TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN COURSE_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20004, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    --COMMIT;             
END;
--==>> Procedure PRC_COURSE_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    USER_DEFINE_ERROR2  EXCEPTION; -- ���۳�¥ > ������¥ �϶� �߻�
    USER_DEFINE_ERROR3  EXCEPTION; -- �����ڵ� ������ �߻�
    USER_DEFINE_ERROR4  EXCEPTION; -- �����ڵ� ������ �߻�
    USER_DEFINE_ERROR5  EXCEPTION; -- �����ڵ� ������ �߻�
    
    CURSOR CUR_CHECK_DATE 
    IS 
    SELECT PROFNO, STARTDATE, ENDDATE, CLASSROOM_CODE
    FROM TBL_OPENCOURSE;   
    
BEGIN
    ------------------------------------ > �����ڵ� ������ ����
    SELECT NVL(MAX(PROFNO), '0') INTO V_CHECK_PROFNO 
    FROM   TBL_PROFESSOR
    WHERE PROFNO = V_PROFNO;
    
    IF V_CHECK_PROFNO = '0'
        THEN RAISE USER_DEFINE_ERROR3;
    END IF;    
    ------------------------------------ > �����ڵ� ������ ����
    SELECT NVL(MAX(COURSE_CODE), '0') INTO V_CHECK_COURSE
    FROM   TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    IF V_CHECK_COURSE = '0'
        THEN RAISE USER_DEFINE_ERROR4;
    END IF; 
    -------------------------------------- > ���ǽ��ڵ� ������ ����
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
         THEN RAISE_APPLICATION_ERROR(-20005, '�̹� �������� ������ ���ǽ� �Ǵ� �������Դϴ�.' );
              ROLLBACK; 
       WHEN USER_DEFINE_ERROR2
         THEN  RAISE_APPLICATION_ERROR(-20301, '�������� �����Ϻ��� �����Դϴ�.' ); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR3
         THEN  RAISE_APPLICATION_ERROR(-20002, '�����ڵ尡 �������� �ʽ��ϴ�.' ); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR4
         THEN  RAISE_APPLICATION_ERROR(-20004, '�����ڵ尡 �������� �ʽ��ϴ�.' ); 
              ROLLBACK;       
       WHEN USER_DEFINE_ERROR5
         THEN  RAISE_APPLICATION_ERROR(-20006, '���ǽ��ڵ尡 �������� �ʽ��ϴ�.' ); 
              ROLLBACK;              
       WHEN OTHERS
        THEN ROLLBACK;

END;
--==>> Procedure PRC_OPENCOURSE_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
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
    USER_DEFINE_ERROR1  EXCEPTION; -- ���������ڵ� ���� �� �߻�
    USER_DEFINE_ERROR2  EXCEPTION; -- �����ڵ� ������ �߻�
    USER_DEFINE_ERROR3  EXCEPTION; -- �����ڵ� ������ �߻�
    USER_DEFINE_ERROR4  EXCEPTION; -- ���ǽ��ڵ� ������ �߻�
    
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

    ------------------------------------ > ���������ڵ� ������ ����
    SELECT NVL(MAX(OPENCOURSE_CODE), '0') INTO V_CHECK_OPCODE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    IF  V_CHECK_OPCODE = '0'
        THEN RAISE USER_DEFINE_ERROR1;
    END IF;
    ------------------------------------ > �����ڵ� ������ ����
    SELECT NVL(MAX(PROFNO), '0') INTO V_CHECK_PROFNO 
    FROM   TBL_PROFESSOR
    WHERE  PROFNO = V_PROFNO;
    
    IF V_CHECK_PROFNO IN ('0')
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;    
    ------------------------------------ > �����ڵ� ������ ����
    SELECT NVL(MAX(COURSE_CODE), '0') INTO V_CHECK_COURSE
    FROM   TBL_COURSE
    WHERE COURSE_CODE = V_COURSE_CODE;
    
    IF V_CHECK_COURSE = '0'
        THEN RAISE USER_DEFINE_ERROR3;
    END IF; 
    -------------------------------------- > ���ǽ��ڵ� ������ ����
    SELECT NVL(MAX(CLASSROOM_CODE), '0') INTO V_CHECK_CLASSROOM
    FROM   TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    IF V_CHECK_CLASSROOM = '0'
        THEN RAISE USER_DEFINE_ERROR4;
    END IF; 
    
   ------------------------------------------------
   -- V_STARTDATE, V_ENDDATE �� �� ����
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
    --------------------------------------> UPDATE ����
    UPDATE TBL_OPENCOURSE
    SET PROFNO = V_PROFNO, COURSE_CODE = V_COURSE_CODE, CLASSROOM_CODE = V_CLASSROOM_CODE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
     
      EXCEPTION
       WHEN USER_DEFINE_ERROR1
         THEN RAISE_APPLICATION_ERROR(-20007, '���������ڵ尡 �������� �ʽ��ϴ�.'); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR2
         THEN RAISE_APPLICATION_ERROR(-20002, '�����ڵ尡 �������� �ʽ��ϴ�.'); 
              ROLLBACK;       
       WHEN USER_DEFINE_ERROR3
         THEN RAISE_APPLICATION_ERROR(-20004, '�����ڵ尡 �������� �ʽ��ϴ�.'); 
              ROLLBACK;              
       WHEN USER_DEFINE_ERROR4
         THEN RAISE_APPLICATION_ERROR(-20006, '���ǽ��ڵ尡 �������� �ʽ��ϴ�.'); 
              ROLLBACK;
       WHEN USER_DEFINE_ERROR
         THEN RAISE_APPLICATION_ERROR(-20005, '�̹� �������� ������ ���ǽ� �Ǵ� �������Դϴ�.' );
              ROLLBACK;        
       WHEN OTHERS
        THEN ROLLBACK;
        
    -- Ŀ��
    --COMMIT;

END;
--==>> Procedure PRC_OPENCOURSE_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
            THEN RAISE_APPLICATION_ERROR(-20007, '���������ڵ尡 ���������ʽ��ϴ�.');
        WHEN OTHERS
            THEN ROLLBACK;
    -- Ŀ��
    COMMIT;          
END;
--==>> Procedure PRC_OPENCOURSE_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
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
--==>> Procedure PRC_SUBJECT_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_UPDATE
( V_SUBJECT_CODE  IN  TBL_SUBJECT.SUBJECT_CODE%TYPE
, V_NAME          IN  TBL_SUBJECT.NAME%TYPE
)
IS
    SUBJECT_CODE_CHECK      TBL_SUBJECT.SUBJECT_CODE%TYPE;
    SUBJECT_CODE_ERROR      EXCEPTION;
    
BEGIN  
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    UPDATE TBL_SUBJECT
    SET NAME = V_NAME
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��        
    --COMMIT;
END;
--==>> Procedure PRC_SUBJECT_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_DELETE
( V_SUBJECT_CODE  IN  TBL_SUBJECT.SUBJECT_CODE%TYPE
)
IS
    SUBJECT_CODE_CHECK      TBL_SUBJECT.SUBJECT_CODE%TYPE;
    SUBJECT_CODE_ERROR      EXCEPTION;
    
BEGIN
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    DELETE TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_SUBJECT_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
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
    -- ��������� <= ����Ϸ���, �ƴϸ� ���� �߻�
    IF ( NOT(V_STARTDATE <= V_ENDDATE) )
        THEN RAISE SUBJECT_DATE_ERROR;
    END IF;
    
    -- ���������ڵ� Ȯ��
    SELECT NVL(MAX(OPENCOURSE_CODE), NULL) INTO OPENCOURSE_CODE_CHECK
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    -- ���� ���������ڵ��, ���� �߻�
    IF (OPENCOURSE_CODE_CHECK IS NULL)
        THEN RAISE OPENCOURSE_CODE_ERROR;
    END IF;
    
    -- ��������������, ���������Ϸ��� ������ �� ����
    SELECT STARTDATE, ENDDATE INTO V_COURSE_STARTDATE, V_COURSE_ENDDATE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
      
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
   
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
    
    -- �����Ⱓ �ȿ� ������, ���� �߻�
    -- (��������� >= ���������� AND ����Ϸ��� <= �����Ϸ���)
    IF ( NOT(V_STARTDATE >= V_COURSE_STARTDATE AND V_ENDDATE <= V_COURSE_ENDDATE) )
        THEN RAISE COURSE_DATE_ERROR;
    END IF;
   
    -- �������� ���� �ִ� ���񳢸� �Ⱓ ��ġ��, ���� �߻�
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
            
    -- �ش� �������� ������ �����ڵ�� ��ġ�� �����ڵ����� Ȯ��
    SELECT COUNT(*) INTO SUBJECT_OVERLAP_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE
      AND SUBJECT_CODE = V_SUBJECT_CODE;
      
    -- �ߺ��Ǵ� �����ڵ� ������, ���� �߻�  
    IF (SUBJECT_OVERLAP_CHECK != 0)
        THEN RAISE SUBJECT_OVERLAP_ERROR;
    END IF;
 
    -- ���������ڵ� �� ����
    V_OPENSUBJECT_CODE := 'OPSUB' || LPAD(SEQ_OPENSUBJECT.NEXTVAL, 4, 0);
    
    -- �����ۼ�
    INSERT INTO TBL_OPENSUBJECT(OPENSUBJECT_CODE, STARTDATE, ENDDATE, OPENCOURSE_CODE, SUBJECT_CODE, BOOK_CODE)
    VALUES(V_OPENSUBJECT_CODE, V_STARTDATE, V_ENDDATE, V_OPENCOURSE_CODE, V_SUBJECT_CODE, V_BOOK_CODE);
    
    -- ����ó��
    EXCEPTION
        WHEN SUBJECT_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20302, '���������/����Ϸ��� �Է� ����');
                 ROLLBACK; 
        WHEN OPENCOURSE_CODE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '�Է��Ͻ� ���������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;   
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN COURSE_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20303, '�����Ⱓ Ȯ�� �� �Է����ּ���');
                 ROLLBACK; 
        WHEN SUBJECT_DATE_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20010, '���� �� ����¥ �ߺ� ����');
                 ROLLBACK;                  
        WHEN SUBJECT_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '���� �ȿ� �̹� �����ϴ� �����ڵ��Դϴ�.');
                 ROLLBACK;                     
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- �¢¢¢¢¢�  [ �������� ����(��������) UPDATE ���ν��� ]  �¢¢¢¢¢¢� --
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
    -- UPDATE : ������ �Է��ߴ� ������ DELETE �� �� INSERT ����
    
    -- ���������ڵ� Ȯ��
    SELECT NVL(MAX(OPENSUBJECT_CODE), NULL) INTO OPENSUBJECT_CODE_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ���� ���������ڵ��, ���� �߻�
    IF (OPENSUBJECT_CODE_CHECK IS NULL)
        THEN RAISE OPENSUBJECT_CODE_ERROR;
    END IF;
    
    -- DELETE ���� : V_ATTEND, V_PRACTICE, V_WRITE �� ���� ���س��� �⼮, �Ǳ�, �ʱ� �� �־��ֱ�
    SELECT ATTEND, PRACTICE, WRITE INTO V_ATTEND, V_PRACTICE, V_WRITE
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- DELETE ����
    DELETE
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ��������� <= ����Ϸ���, �ƴϸ� ���� �߻�
    IF ( NOT(V_STARTDATE <= V_ENDDATE) )
        THEN RAISE SUBJECT_DATE_ERROR;
    END IF;
    
    -- ���������ڵ� Ȯ��
    SELECT NVL(MAX(OPENCOURSE_CODE), NULL) INTO OPENCOURSE_CODE_CHECK
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
    
    -- ���� ���������ڵ��, ���� �߻�
    IF (OPENCOURSE_CODE_CHECK IS NULL)
        THEN RAISE OPENCOURSE_CODE_ERROR;
    END IF;
    
    -- ��������������, ���������Ϸ��� ������ �� ����
    SELECT STARTDATE, ENDDATE INTO V_COURSE_STARTDATE, V_COURSE_ENDDATE
    FROM TBL_OPENCOURSE
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE;
      
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(SUBJECT_CODE), NULL) INTO SUBJECT_CODE_CHECK
    FROM TBL_SUBJECT
    WHERE SUBJECT_CODE = V_SUBJECT_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (SUBJECT_CODE_CHECK IS NULL)
        THEN RAISE SUBJECT_CODE_ERROR;
    END IF;
   
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
      
    -- �����Ⱓ �ȿ� ������, ���� �߻�
    -- (��������� >= ���������� AND ����Ϸ��� <= �����Ϸ���)
    IF ( NOT(V_STARTDATE >= V_COURSE_STARTDATE AND V_ENDDATE <= V_COURSE_ENDDATE) )
        THEN RAISE COURSE_DATE_ERROR;
    END IF;
   
    -- �������� ���� �ִ� ���񳢸� �Ⱓ ��ġ��, ���� �߻�
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
            
    -- �ش� �������� ������ �����ڵ�� ��ġ�� �����ڵ����� Ȯ��
    SELECT COUNT(*) INTO SUBJECT_OVERLAP_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENCOURSE_CODE = V_OPENCOURSE_CODE
      AND SUBJECT_CODE = V_SUBJECT_CODE;
      
    -- �ߺ��Ǵ� �����ڵ� ������, ���� �߻�  
    IF (SUBJECT_OVERLAP_CHECK != 0)
        THEN RAISE SUBJECT_OVERLAP_ERROR;
    END IF;

    -- �����ۼ�
    INSERT INTO TBL_OPENSUBJECT
    VALUES(V_OPENSUBJECT_CODE, V_STARTDATE, V_ENDDATE, SYSDATE
         , V_ATTEND, V_PRACTICE, V_WRITE, V_OPENCOURSE_CODE, V_SUBJECT_CODE, V_BOOK_CODE);
    
    -- ����ó��
    EXCEPTION
        WHEN OPENSUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20012, '�Է��Ͻ� ���������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN SUBJECT_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20302, '���������/����Ϸ��� �Է� ����');
                 ROLLBACK; 
        WHEN OPENCOURSE_CODE_ERROR 
            THEN RAISE_APPLICATION_ERROR(-20007, '�Է��Ͻ� ���������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;   
        WHEN SUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;   
        WHEN COURSE_DATE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20303, '�����Ⱓ Ȯ�� �� �Է����ּ���');
                 ROLLBACK; 
        WHEN SUBJECT_DATE_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20010, '���� �� ����¥ �ߺ� ����');
                 ROLLBACK;                  
        WHEN SUBJECT_OVERLAP_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '���� �ȿ� �̹� �����ϴ� �����ڵ��Դϴ�.');
                 ROLLBACK;                     
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢�  [ �������� ����(����) UPDATE ���ν��� ]  �¢¢¢¢¢¢� --
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
    -- ���������ڵ� Ȯ��
    SELECT NVL(MAX(OPENSUBJECT_CODE), NULL) INTO OPENSUBJECT_CODE_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ���� ���������ڵ��, ���� �߻�
    IF (OPENSUBJECT_CODE_CHECK IS NULL)
        THEN RAISE OPENSUBJECT_CODE_ERROR;
    END IF;
    
    -- ��� + �Ǳ� + �Ǳ� ���� = 100 Ȯ�� ��, �ƴϸ� ���� �߻�
    IF (NVL(V_ATTEND, 0) + NVL(V_PRACTICE, 0) + NVL(V_WRITE, 0) != 100)
        THEN RAISE SCORE_ALLOT_ERROR;
    END IF;
    
    -- �����ۼ�
    UPDATE TBL_OPENSUBJECT
    SET ATTEND = V_ATTEND, PRACTICE = V_PRACTICE, WRITE = V_WRITE
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ����ó��
    EXCEPTION
        WHEN OPENSUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20012, '�Է��Ͻ� ���������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN SCORE_ALLOT_ERROR
            THEN RAISE_APPLICATION_ERROR(-20401, '���� �Է� ����');
                 ROLLBACK;          
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_SCORE_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_OPENSUBJECT_DELETE
( V_OPENSUBJECT_CODE  IN  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE
)
IS
    OPENSUBJECT_CODE_CHECK      TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE;
    OPENSUBJECT_CODE_ERROR      EXCEPTION;
    
BEGIN  
    -- ���������ڵ� Ȯ��
    SELECT NVL(MAX(OPENSUBJECT_CODE), NULL) INTO OPENSUBJECT_CODE_CHECK
    FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ���� ���������ڵ��, ���� �߻�
    IF (OPENSUBJECT_CODE_CHECK IS NULL)
        THEN RAISE OPENSUBJECT_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    DELETE FROM TBL_OPENSUBJECT
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN OPENSUBJECT_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20012, '�Է��Ͻ� ���������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��
    --COMMIT;
END;
--==>> Procedure PRC_OPENSUBJECT_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�  [ �ߵ�Ż�� �л� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROP_INSERT
( V_SIGNCOURSE_CODE   IN  TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE
, V_REASON_CODE       IN  TBL_DROPREASON.REASON_CODE%TYPE
)
IS
    SIGNCOURSE_CODE_CHECK   TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE;
    SIGNCOURSE_CODE_ERROR   EXCEPTION;
BEGIN
    -- ������û�ڵ� Ȯ��
    SELECT NVL(MAX(SIGNCOURSE_CODE), NULL) INTO SIGNCOURSE_CODE_CHECK
    FROM TBL_DROP
    WHERE SIGNCOURSE_CODE = V_SIGNCOURSE_CODE;
    
    -- �̹� �����ϴ� ������û�ڵ��, ���� �߻�
    IF (SIGNCOURSE_CODE_CHECK IS NOT NULL)
        THEN RAISE SIGNCOURSE_CODE_ERROR;
    END IF;

    -- ���� �ۼ�
    INSERT INTO TBL_DROP(DROP_CODE, SIGNCOURSE_CODE, REASON_CODE)
    VALUES(SEQ_DROP.NEXTVAL, V_SIGNCOURSE_CODE, V_REASON_CODE);
    
    -- ���� ó��
    EXCEPTION
        WHEN SIGNCOURSE_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20013, '�ߺ��� ������û �ڵ��Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_DROP_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�  [ �ߵ�Ż�� ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    -- �ߵ�Ż���ڵ� Ȯ��
    SELECT NVL(MAX(DROP_CODE), NULL) INTO DROP_CODE_CHECK
    FROM TBL_DROP
    WHERE DROP_CODE = V_DROP_CODE;
    
    -- ���� �ߵ�Ż���ڵ��, ���� �߻�
    IF (DROP_CODE_CHECK IS NULL)
        THEN RAISE DROP_CODE_ERROR;
    END IF;
    
    -- �ߵ�Ż�������ڵ� Ȯ��
    SELECT NVL(MAX(REASON_CODE), NULL) INTO REASON_CODE_CHECK
    FROM TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- ���� �ߵ�Ż�������ڵ��, ���� �߻�
    IF (REASON_CODE_CHECK IS NULL)
        THEN RAISE REASON_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    UPDATE TBL_DROP
    SET REASON_CODE = V_REASON_CODE
    WHERE DROP_CODE = V_DROP_CODE;   
    
    -- ���� ó��
    EXCEPTION
        WHEN DROP_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '�Է��Ͻ� �ߵ�Ż���ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN REASON_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20015, '�Է��Ͻ� �ߵ�Ż�������ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_DROP_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�  [ �ߵ�Ż�� �л� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROP_DELETE
( V_DROP_CODE IN  TBL_DROP.DROP_CODE%TYPE
)
IS
    DROP_CODE_CHECK     TBL_DROP.DROP_CODE%TYPE;
    DROP_CODE_ERROR     EXCEPTION;
BEGIN
    -- �ߵ�Ż���ڵ� Ȯ��
    SELECT NVL(MAX(DROP_CODE), NULL) INTO DROP_CODE_CHECK
    FROM TBL_DROP
    WHERE DROP_CODE = V_DROP_CODE;
    
    -- ���� �ߵ�Ż���ڵ��, ���� �߻�
    IF (DROP_CODE_CHECK IS NULL)
        THEN RAISE DROP_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    DELETE TBL_DROP
    WHERE DROP_CODE = V_DROP_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN DROP_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '�Է��Ͻ� �ߵ�Ż���ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_DROP_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�  [ �ߵ�Ż�� ���� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROPREASON_INSERT
( V_REASON    IN  TBL_DROPREASON.REASON%TYPE
)
IS
BEGIN
    -- �����ۼ�
    INSERT INTO TBL_DROPREASON
    VALUES(SEQ_DROPREASON.NEXTVAL, V_REASON);
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_DROPREASON_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�  [ �ߵ�Ż�� ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROPREASON_UPDATE
( V_REASON_CODE   IN  TBL_DROPREASON.REASON_CODE%TYPE
, V_REASON        IN  TBL_DROPREASON.REASON%TYPE
)
IS
    REASON_CODE_CHECK   TBL_DROPREASON.REASON_CODE%TYPE;
    REASON_CODE_ERROR   EXCEPTION;
BEGIN
    -- �ߵ�Ż���ڵ� Ȯ��
    SELECT NVL(MAX(REASON_CODE), NULL) INTO REASON_CODE_CHECK
    FROM TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- ���� �ߵ�Ż���ڵ��, ���� �߻�
    IF (REASON_CODE_CHECK IS NULL)
        THEN RAISE REASON_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    UPDATE TBL_DROPREASON
    SET REASON = V_REASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN REASON_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '�Է��Ͻ� �ߵ�Ż���ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��             
    --COMMIT;
END;
--==>> Procedure PRC_DROPREASON_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢�  [ �ߵ�Ż�� ���� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_DROPREASON_DELETE
( V_REASON_CODE   IN  TBL_DROPREASON.REASON_CODE%TYPE   
)
IS
    REASON_CODE_CHECK   TBL_DROPREASON.REASON_CODE%TYPE;
    REASON_CODE_ERROR   EXCEPTION;
BEGIN
    -- �ߵ�Ż���ڵ� Ȯ��
    SELECT NVL(MAX(REASON_CODE), NULL) INTO REASON_CODE_CHECK
    FROM TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- ���� �ߵ�Ż���ڵ��, ���� �߻�
    IF (REASON_CODE_CHECK IS NULL)
        THEN RAISE REASON_CODE_ERROR;
    END IF;

    -- ���� �ۼ�
    DELETE TBL_DROPREASON
    WHERE REASON_CODE = V_REASON_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN REASON_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '�Է��Ͻ� �ߵ�Ż���ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_DROPREASON_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ���� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_BOOK_INSERT
(  V_NAME      IN  TBL_BOOK.NAME%TYPE
,  V_AUTHOR    IN  TBL_BOOK.AUTHOR%TYPE
,  V_PUBLISHER IN  TBL_BOOK.PUBLISHER%TYPE
)
IS
BEGIN
    -- �����ۼ�
    INSERT INTO TBL_BOOK
    VALUES(SEQ_BOOK.NEXTVAL, V_NAME, V_AUTHOR, V_PUBLISHER);
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_BOOK_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢¢� --
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
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    UPDATE TBL_BOOK
    SET NAME = V_NAME, AUTHOR = V_AUTHOR, PUBLISHER = V_PUBLISHER
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��             
    --COMMIT;
END;
--==>> Procedure PRC_BOOK_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ���� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_BOOK_DELETE
( V_BOOK_CODE IN  TBL_BOOK.BOOK_CODE%TYPE
)
IS
    BOOK_CODE_CHECK     TBL_BOOK.BOOK_CODE%TYPE;   
    BOOK_CODE_ERROR     EXCEPTION;
BEGIN
    -- �����ڵ� Ȯ��
    SELECT NVL(MAX(BOOK_CODE), NULL) INTO BOOK_CODE_CHECK
    FROM TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- ���� �����ڵ��, ���� �߻�
    IF (BOOK_CODE_CHECK IS NULL)
        THEN RAISE BOOK_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    DELETE TBL_BOOK
    WHERE BOOK_CODE = V_BOOK_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN BOOK_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '�Է��Ͻ� �����ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ�� 
    --COMMIT;
END;
--==>> Procedure PRC_BOOK_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���ǽ� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
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
    -- ���ǽ��ڵ� Ȯ��
    SELECT NVL(MAX(CLASSROOM_CODE), NULL) INTO CLASSROOM_CODE_CHECK
    FROM TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- �̹� �����ϴ� ���ǽ��ڵ��, ���� �߻�
    IF (CLASSROOM_CODE_CHECK IS NOT NULL)
        THEN RAISE CLASSROOM_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    INSERT INTO TBL_CLASSROOM
    VALUES(V_CLASSROOM_CODE, V_CLASSROOM_COMMENT, V_CAPACITY);
    
    -- ���� ó��
    EXCEPTION
        WHEN CLASSROOM_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20016, '�ߺ��� ���ǽ� �ڵ��Դϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�  [ ���ǽ� ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢� --
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
    -- ���ǽ� �ڵ� Ȯ��
    SELECT NVL(MAX(CLASSROOM_CODE), NULL) INTO CLASSROOM_CODE_CHECK
    FROM TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- ���� ���ǽ��̸�, ���� �߻�
    IF (CLASSROOM_CODE_CHECK IS NULL)
        THEN RAISE CLASSROOM_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    UPDATE TBL_CLASSROOM
    SET CLASSROOM_COMMENT = V_CLASSROOM_COMMENT, CAPACITY = V_CAPACITY
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN CLASSROOM_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '�Է��Ͻ� ���ǽ��ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
                
    -- Ŀ��    
    --COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ���ǽ� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_CLASSROOM_DELETE
( V_CLASSROOM_CODE        IN  TBL_CLASSROOM.CLASSROOM_CODE%TYPE
)
IS
    CLASSROOM_CODE_CHECK    TBL_CLASSROOM.CLASSROOM_CODE%TYPE;   
    CLASSROOM_CODE_ERROR    EXCEPTION;
BEGIN
    -- ���ǽ� �ڵ� Ȯ��
    SELECT NVL(MAX(CLASSROOM_CODE), NULL) INTO CLASSROOM_CODE_CHECK
    FROM TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- ���� ���ǽ��̸�, ���� �߻�
    IF (CLASSROOM_CODE_CHECK IS NULL)
        THEN RAISE CLASSROOM_CODE_ERROR;
    END IF;
    
    -- ���� �ۼ�
    DELETE TBL_CLASSROOM
    WHERE CLASSROOM_CODE = V_CLASSROOM_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN CLASSROOM_CODE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20006, '�Է��Ͻ� ���ǽ��ڵ尡 �������� �ʽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
            
    -- Ŀ��     
    --COMMIT;
END;
--==>> Procedure PRC_CLASSROOM_DELETE��(��) �����ϵǾ����ϴ�.


--------------------------------------------------------------------------------
-- �ââââââââââââ�     < ���� >     �âââââââââââââ� --
--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� LOGIN ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_PROFESSOR_LOGIN
( V_ID      IN  TBL_PROFESSOR.PROFNO%TYPE
, V_PW      IN  TBL_PROFESSOR.PW%TYPE
)
IS
    V_PW2               TBL_PROFESSOR.PW%TYPE;
    V_SUBJECT_NAME      TBL_SUBJECT.NAME%TYPE;
    V_ENDDATE           TBL_OPENSUBJECT.ENDDATE%TYPE;
    USER_DEFINE_ERROR1  EXCEPTION;  -- ���̵� �н����尡 �ùٸ��� ���� ���
    USER_DEFINE_ERROR2  EXCEPTION;  -- �ش� ������ ���� ó�� �� ���������� ���� ���
    
    CURSOR CUR_OPENSUBJECT_SELECT
    IS
    SELECT ����
    FROM VIEW_PROFESSOR_LOGIN
    WHERE ������ȣ = V_ID AND ����Ϸ��� <= SYSDATE;
    --WHERE ������ȣ = V_ID AND ����Ϸ��� = TO_DATE('2022-03-18', 'YYYY-MM-DD');
    
BEGIN
    
    V_PW2 := -1;
    V_SUBJECT_NAME := 'N';
    
    -- ������ ���̺��� ��й�ȣ ������ ���
    SELECT PW INTO V_PW2
    FROM TBL_PROFESSOR
    WHERE PROFNO = V_ID;

    
    -- ��й�ȣ �´� �� Ȯ�� �� VIEW ����
    IF (V_PW = V_PW2)
        THEN
            OPEN CUR_OPENSUBJECT_SELECT;
            
            LOOP
                FETCH CUR_OPENSUBJECT_SELECT INTO V_SUBJECT_NAME;
                
                IF(V_SUBJECT_NAME = 'N')       -- �ش� ������ ���� ó���� ���������� ���� ���
                    THEN RAISE USER_DEFINE_ERROR2;
                END IF;
        
                -- Ŀ������ �� �̻� �����Ͱ� ����� ������ �ʴ� ���� ... ��NOTFOUND��
                EXIT WHEN CUR_OPENSUBJECT_SELECT%NOTFOUND;
        
                -- ���
                DBMS_OUTPUT.PUT_LINE(V_SUBJECT_NAME);
                
            END LOOP;
    ELSE
        RAISE USER_DEFINE_ERROR1;   -- ���̵� ��й�ȣ�� �ùٸ��� ���� ��� ���� �߻�
    END IF;
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR1
            THEN RAISE_APPLICATION_ERROR(-20004, '���̵� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '���� ó���� ���������� �����ϴ�.');
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('���� �߻�');
        
    -- �̻� ���� ��
    --COMMIT;
    
END;
--==>> Procedure PRC_PRFESSOR_LOGIN��(��) �����ϵǾ����ϴ�.
--------------------------------------------------------------------------------
--  �¢�  [ ������ Ư�� ���� ������ �� ȭ�� ��� ���ν��� ]  �¢� --
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
    
    -- Ŀ�� ����
    CURSOR CUR_SCORE_SELECT
    IS 
    SELECT �й�, �л��̸�, �������, �ʱ�����, �Ǳ�����, �ߵ�Ż������
    FROM VIEW_SCORE_PRINT
    WHERE ���������ڵ� = V_OPENCOURSE_CODE AND ���������ڵ� = V_OPENSUBJECT_CODE;
    
BEGIN
    
    OPEN CUR_SCORE_SELECT; -- Ŀ�� ���� ä���
    
    LOOP
        FETCH CUR_SCORE_SELECT INTO V_STUDNO, V_NAME, V_ATTEND, V_PRACTICE, V_WRITE, V_DROPOX;
        
        -- Ŀ������ �� �̻� �����Ͱ� ����� ������ �ʴ� ���� ... ��NOTFOUND��
        EXIT WHEN CUR_SCORE_SELECT%NOTFOUND;
        
        -- ���
        IF(V_DROPOX = 'X')
            THEN DBMS_OUTPUT.PUT_LINE(V_STUDNO || '  ' || V_NAME || '  ' || V_ATTEND || '��  ' || V_PRACTICE || '��  ' || V_WRITE || '��  ');
        END IF;
                
    END LOOP;
END;

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢�  [ ������ ���� INSERT ���ν��� ]  �¢¢¢¢¢¢¢¢� --
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
    V_OPENSUBJECT_CODE  TBL_OPENSUBJECT.OPENSUBJECT_CODE%TYPE; -- ���������ڵ�
    V_SIGNCOURSE_CODE   TBL_SIGNCOURSE.SIGNCOURSE_CODE%TYPE;   -- ������û�ڵ�
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    
    V_TEST_STUDNO := '-1';
    
    IF(V_ATTEND > 100 OR V_PRACTICE > 100 OR V_WRITE > 100) -- �������� 100���� �ʰ��� ���
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT OPENSUBJECT_CODE INTO V_OPENSUBJECT_CODE
    FROM TBL_SUBJECT SJ LEFT JOIN TBL_OPENSUBJECT OS
                        ON SJ.SUBJECT_CODE = OS.SUBJECT_CODE
    WHERE NAME = V_SUBJECT_NAME AND OPENSUBJECT_CODE = VC_OPENSUBJECT_CODE;
    
    SELECT SIGNCOURSE_CODE, STUDNO INTO V_SIGNCOURSE_CODE, V_TEST_STUDNO
    FROM TBL_SIGNCOURSE
    WHERE STUDNO = V_STUDNO;
    
    -- ���� �߻�
    IF (V_TEST_STUDNO = '-1') -- �ش� �й��� ���� �������� ���� ���
        THEN RAISE NO_DATA_FOUND;
    END IF;
    
    -- INSERT ����
    INSERT INTO TBL_SCORE(SCORE_CODE, ATTEND, PRACTICE, WRITE, OPENSUBJECT_CODE, SIGNCOURSE_CODE)
           VALUES(SEQ_SCORE.NEXTVAL, V_ATTEND, V_PRACTICE, V_WRITE, V_OPENSUBJECT_CODE, V_SIGNCOURSE_CODE);
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '�� ������ 100���� �ʰ��� �� �����ϴ�.');
        WHEN NO_DATA_FOUND
            THEN RAISE_APPLICATION_ERROR(-20002, '�й��� ' || V_STUDNO || '�� �л��� �������� �ʽ��ϴ�.');
END;
--==>> Procedure PRC_PROFESSOR_SCORE_INSERT��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ���� ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    
    -- �� ������ 100���� �ƴ� ��� ���� �߻�
    IF ( V_ATTEND + V_PRACTICE + V_WRITE != 100)
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- UPDATE
    UPDATE TBL_OPENSUBJECT
    SET ATTEND = V_ATTEND, PRACTICE = V_PRACTICE, WRITE = V_WRITE
    WHERE OPENSUBJECT_CODE = V_OPENSUBJECT_CODE;
    
    -- ���� ó��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20002, '�� ���� ���� 100���̾�� �մϴ�.');
        --WHEN OTHERS
            --THEN ROLLBACK;
    
    -- �̻� ���� ��
    --COMMIT;
    
END;
--==>> Procedure PRC_PROFESSOR_OS_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ���� UPDATE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
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
    
    IF(V_ATTEND > 100 OR V_PRACTICE > 100 OR V_WRITE > 100) -- �������� 100���� �ʰ��� ���
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    SELECT SCORE_CODE INTO V_TEST_SCORE_CODE
    FROM TBL_SCORE
    WHERE SCORE_CODE = V_SCORE_CODE;
    
    -- ���� ���̺� UPDATE
    UPDATE TBL_SCORE
    SET ATTEND = V_ATTEND, PRACTICE = V_PRACTICE, WRITE = V_WRITE
      , SCORE_DATE = SYSDATE
    WHERE SCORE_CODE = V_SCORE_CODE;
    
    -- ���� �߻� ��
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '�� ������ 100���� �ʰ��� �� �����ϴ�.');
        WHEN NO_DATA_FOUND 
            THEN RAISE_APPLICATION_ERROR(-20002, '�ش� SCORE_CODE �����Ͱ� �������� �ʽ��ϴ�.');
    /*  WHEN OTHERS
            THEN ROLLBACK;*/
    
    -- �̻� ���� ��
    --COMMIT;
    
END;
--==>> Procedure PRC_PROFESSOR_SCORE_UPDATE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢�  [ ���� DELETE ���ν��� ]  �¢¢¢¢¢¢¢¢¢¢� --
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
    
    
    
    -- ���� �߻� ��
    EXCEPTION
        WHEN NO_DATA_FOUND
            THEN RAISE_APPLICATION_ERROR(-20001, '�ش� SCORE_CODE �����Ͱ� �������� �ʽ��ϴ�.');
    /*EXCEPTION
        WHEN OTHERS
            THEN ROLLBACK;*/
    
    -- �̻� ���� ��
    --COMMIT;
    
END;
--==>> Procedure PRC_PROFESSOR_SCORE_DELETE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
-- �ââââââââââââ�     < �л� >     �âââââââââââââ� --
--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �л����� LOGIN ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    SELECT ������, �����, ��������
    FROM VIEW_STUD_ALL_SUBJECT
    WHERE �й� = V_STUDNO AND �������� >= SYSDATE AND ���� IS NOT NULL;
    
    USER_DEFINE_ERROR       EXCEPTION;
    USER_DEFINE_ERROR2      EXCEPTION;
    
BEGIN
    
    SELECT PW INTO V_PW2
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;
    
    SELECT STUDNO  INTO  V_STUDNO2
    FROM TBL_DROP D JOIN TBL_SIGNCOURSE S
         ON D.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE;
    
     SELECT ���� INTO V_TOT
        FROM
        (
            SELECT STUDNO, (ATTEND + PRACTICE + WRITE) "����"
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
               DBMS_OUTPUT.PUT_LINE('������ : ' || V_COURSE || ' | ����� : ' || V_SUBJECT || ' | �������� : ' || V_ENDDATE);
           END LOOP;
      CLOSE CUR_STUDENT_SUBJECT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20001, '�й� �Ǵ� �н����带 �߸� �Է��Ͽ����ϴ�. �ٽ� �Է��ϼ���.');
            
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20002, '�������� �ߵ�Ż���� �л��Դϴ�. �����Ϸ��� ������ �����ϴ�.');

END; 
--==>> Procedure PRC_STUD_LOGIN��(��) �����ϵǾ����ϴ�.          

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ��ü���� ��� ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    SELECT �̸�, ������, �����, �����, ��������, ��������, ���, �Ǳ�, �ʱ�, ����, ���, �ߵ�Ż����, �ߵ�Ż������ 
    FROM VIEW_ALL_STUDSCORE
    WHERE �й� = V_STUDNO AND �������� <= SYSDATE AND ���� IS NOT NULL;
    
BEGIN
    
    OPEN CUR_STUDENT_SCORE;
    
    LOOP
        FETCH CUR_STUDENT_SCORE INTO V_NAME, V_COURSE, V_SUBJECT, V_BOOK, V_STARTDATE, V_ENDDATE, V_ATTEND
                                  , V_PRACTICE, V_WRITE, V_TOTAL, V_RANK, V_DROPDATE, V_DROPREASON;
        EXIT WHEN CUR_STUDENT_SCORE%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(' �̸� : ' || V_NAME || ' | ������ : ' || V_COURSE || ' | ����� : ' || V_SUBJECT || ' | ����� : ' || V_BOOK 
                            || ' | �������� : ' || V_STARTDATE || ' | �������� : ' || V_ENDDATE || ' | ��� : ' || V_ATTEND || ' | �Ǳ� : ' || V_PRACTICE
                            || ' | �ʱ� : ' || V_WRITE || ' | ���� : ' || V_TOTAL || ' | ��� : ' || V_RANK || ' | �ߵ�Ż���� : ' || V_DROPDATE || ' | �ߵ�Ż������ : ' || V_DROPREASON);
        
    END LOOP;
    
    
    CLOSE CUR_STUDENT_SCORE;
    
END;
--==>> Procedure PRC_STUD_SCORE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ �������� ��� ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
    SELECT �̸�, ������, �����, �����, ��������, ��������, ���, �Ǳ�, �ʱ�, ����, ���, �ߵ�Ż����, �ߵ�Ż������ 
    FROM VIEW_ALL_STUDSCORE
    WHERE �й� = V_STUDNO AND ����� = V_SUBJECT AND �������� <= SYSDATE AND ���� IS NOT NULL;
    
BEGIN

    OPEN CUR_STUDENT_EACH;
    
    LOOP
        FETCH CUR_STUDENT_EACH INTO V_NAME, V_COURSE, V_SUBJECT2, V_BOOK, V_STARTDATE, V_ENDDATE, V_ATTEND
                                  , V_PRACTICE, V_WRITE, V_TOTAL, V_RANK, V_DROPDATE, V_DROPREASON;
        EXIT WHEN CUR_STUDENT_EACH%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE(' �̸� : ' || V_NAME || ' | ������ : ' || V_COURSE || ' | ����� : ' || V_SUBJECT2 || ' | ����� : ' || V_BOOK 
                            || ' | �������� : ' || V_STARTDATE || ' | �������� : ' || V_ENDDATE || ' | ��� : ' || V_ATTEND || ' | �Ǳ� : ' || V_PRACTICE
                            || ' | �ʱ� : ' || V_WRITE || ' | ���� : ' || V_TOTAL || ' | ��� : ' || V_RANK || ' | �ߵ�Ż���� : ' || V_DROPDATE || ' | �ߵ�Ż������ : ' || V_DROPREASON);
        
    END LOOP;
    
    CLOSE CUR_STUDENT_EACH;

END;
--==>> Procedure PRC_STUD_EACHSCORE��(��) �����ϵǾ����ϴ�.

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�  [ ������û �Է� ���ν��� ]  �¢¢¢¢¢¢¢¢¢� --
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
            THEN RAISE_APPLICATION_ERROR(-20303, '�������� �ʴ� �й��Դϴ�.');
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20304, '�������� �ʴ� ���������ڵ� �Դϴ�.');    
                 ROLLBACK;
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20305, '������û�Ϸ��� ������ �̹� �������̰ų� �������ϴ�.');        
                 ROLLBACK;
END;
--==>> Procedure PRC_SIGNCOURSE_INSERT��(��) �����ϵǾ����ϴ�.

/*==============================================================================
-- ��������������  [ ��(VIEW) ��� ]  ��������������  -- 
===============================================================================*/

--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢�   [ ���� - �α��� �� ]   �¢¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_PROFESSOR_LOGIN
AS
SELECT PF.PROFNO "������ȣ", SJ.NAME "����", OS.ENDDATE "����Ϸ���"
FROM TBL_PROFESSOR PF RIGHT JOIN TBL_OPENCOURSE OC   ON PF.PROFNO = OC.PROFNO
                      RIGHT JOIN TBL_OPENSUBJECT OS ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                      LEFT JOIN TBL_SUBJECT SJ     ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE;
--==>> View VIEW_PROFESSOR_LOGIN��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_PROFESSOR_LOGIN;
--==>>
/*
P0002	�ڹ� ����	2022-04-02
           :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢�  [ ���� - ����Ȯ�� �� ]  �¢¢¢¢¢¢¢¢¢¢¢�  --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_PROFESSOR_SCORE
AS
SELECT PR.NAME"������", ST.NAME"�л���", OP.STARTDATE "���������",OP.ENDDATE "����������"
     , CR.NAME"������", SU.NAME"�����", BK.NAME "�����", SR.ATTEND "���", SR.PRACTICE "�Ǳ�"
     , SR.WRITE "�ʱ�", (SR.ATTEND + SR.PRACTICE + SR.WRITE) "����", DENSE_RANK()OVER(ORDER BY SR.ATTEND+SR.PRACTICE+SR.WRITE DESC) AS "���"
     , CASE WHEN SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE
            THEN 'Y' 
            ELSE 'N'
       END "�ߵ�Ż�� ����"
     , DR.DROP_DATE "�ߵ�Ż����¥"
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
--==>> View VIEW_PROFESSOR_SCORE��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_PROFESSOR_SCORE; 
--==>>
/*
�̾Ƹ�		2022-07-02	2023-08-02	����Ŭ�� ��� ���� ���� ����							1	N
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢�  [ ���� - �����Է� �� ] �¢¢¢¢¢¢¢¢¢¢¢�   --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_SCORE_PRINT
AS
SELECT DECODE(DR.DROP_DATE, NULL, 'X', 'O') "�ߵ�Ż������", SC.OPENCOURSE_CODE "���������ڵ�", OS.OPENSUBJECT_CODE "���������ڵ�", SD.STUDNO "�й�"
, SD.NAME "�л��̸�", NVL(S.ATTEND, 0) "�������", NVL(S.PRACTICE, 0) "�ʱ�����", NVL(S.WRITE, 0) "�Ǳ�����"
FROM TBL_SCORE S FULL JOIN TBL_SIGNCOURSE SC 
                    ON S.SIGNCOURSE_CODE = SC.SIGNCOURSE_CODE
                 FULL JOIN TBL_STUDENT SD
                    ON SC.STUDNO = SD.STUDNO
                 FULL JOIN TBL_OPENSUBJECT OS 
                    ON OS.OPENCOURSE_CODE = SC.OPENCOURSE_CODE AND OS.OPENSUBJECT_CODE = S.OPENSUBJECT_CODE
                 FULL JOIN TBL_DROP DR
                    ON SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE
ORDER BY ���������ڵ�, ���������ڵ�; 
--==>> View VIEW_SCORE_PRINT��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_SCORE_PRINT;
/*
OPJAVA001	OP_SJ2	1111111	������	0	0	0
                         :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢�  [ ������ - ����Ȯ�� �� ]  �¢¢¢¢¢¢¢¢¢�    --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_ADMIN_PROFCHECK
AS
SELECT P.NAME "������", SJ.NAME "�����", OS.STARTDATE "���������", OS.ENDDATE "����������"
     , B.NAME "�����", CR.CLASSROOM_COMMENT "���ǽ�"
     , CASE WHEN  SYSDATE BETWEEN OS.STARTDATE AND OS.ENDDATE
            THEN '������'
            WHEN  SYSDATE < OS.STARTDATE
            THEN '���ǿ���'
            ELSE '��������'
       END "�������࿩��"
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
--==>> View VIEW_ADMIN_PROFCHECK��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_ADMIN_PROFCHECK;
--==>>
/*
�����	�ڹ� �߱�	2022-04-26	2022-04-28	�̰��� �ڹٴ�	A�� 101ȣ	���ǿ���
                                  :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢�  [ ������ - �л�Ȯ�� �� ]  �¢¢¢¢¢¢¢¢¢�    --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_ADMIN_ALL_STUDENT_INFO
AS 
SELECT DISTINCT  ST.NAME "�л� �̸�", CR.NAME "������", S.NAME "��������"
            , SR.ATTEND + SR.PRACTICE + SR.WRITE "�������� ����"
            --, DECODE(NULL, DRP.DROP_DATE, 'N', 'Y') "�ߵ�Ż������"
            , DECODE(DRP.DROP_DATE, NULL, 'N', 'Y') "�ߵ�Ż������"
            , DRP.DROP_DATE "�ߵ�Ż����¥"
            , DRS.REASON "�ߵ�Ż������"
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
--==>> View VIEW_ADMIN_ALL_STUDENT_INFO��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_ADMIN_ALL_STUDENT_INFO;
/*
������	JAVA�� �����ϴ� �ڵ�����	�ڹ� �߱�		    N	(null)	(null)	
����	(null)		                                N	(null)	(null)		
�̽ÿ�	����Ŭ�� ��� ���� ���� ����	�ڹ� ����	N	(null)	(null)		
������	JAVA�� �����ϴ� �ڵ�����	�ڹ� ����		    N	(null)	(null)		
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢¢�  [ ������ - �������� �� ] �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_ADMIN_ALL_SUBJECT_INFO 
AS 
SELECT  CR.NAME "������", CLR.CLASSROOM_CODE "���ǽ�" , SJ.NAME "�����", OSJ.STARTDATE "���� ������"
        , OSJ.ENDDATE "�� ������", BK.NAME "���� ��", PF.NAME "������ ��"
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

--==>> VIEW_ADMIN_ALL_SUBJECT_INFO��(��) �����Ǿ����ϴ�.
SELECT *
FROM VIEW_ADMIN_ALL_SUBJECT_INFO;
--==>>
/*
JAVA�� �����ϴ� �ڵ�����	A101	�ڹ� �߱�	2022-04-26	2022-04-28	�̰��� �ڹٴ�	�����
                                      :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢¢�  [ ������ - �������� �� ] �¢¢¢¢¢¢¢¢¢¢� --
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_ADMIN_ALL_COURSE_INFO 
AS 
SELECT  CR.NAME "������", CLR.CLASSROOM_CODE "���ǽ�" , SJ.NAME "�����", OC.STARTDATE "���������"
        , OC.ENDDATE "����������", BK.NAME "���� ��", PF.NAME "������ ��"
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
--==>> View VIEW_ADMIN_ALL_COURSE_INFO��(��) �����Ǿ����ϴ�.
                  
SELECT *
FROM VIEW_ADMIN_ALL_COURSE_INFO;
--==>>
/*
����Ŭ�� ��� ���� ���� ����	A201	    �ڹ� ����	2022-03-02	2022-06-20	�װ��� ����Ŭ	�̾Ƹ�
                                    :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢�   [ �л� - �������� �� ]   �¢¢¢¢¢¢¢¢¢�    --
--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW VIEW_STUD_ALL_SUBJECT                                                                                                                   
AS    
SELECT �й�, ������, �����, ��������, ����
FROM 
(
  SELECT ST.STUDNO "�й�", C.NAME "������", SJ.NAME "�����", OC.ENDDATE "��������"
         , S.ATTEND "���",  S.PRACTICE "�Ǳ�", S.WRITE "�ʱ�", (S.ATTEND + S.PRACTICE + S.WRITE) "����"
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

--==>> View VIEW_STUD_ALL_SUBJECT��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_STUD_ALL_SUBJECT;
--==>>
/*
1111111	JAVA�� �����ϴ� �ڵ�����	�ڹ� ����	2022-08-20	
                     :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢�  [ �л� - ������������ �� ] �¢¢¢¢¢¢¢¢¢�    --
--------------------------------------------------------------------------------

CREATE OR REPLACE VIEW VIEW_ALL_STUDSCORE
AS
SELECT T2.�й� "�й�", T2.�̸� "�̸�", T2.������ "������", T2.����� "�����", T2.�������� "��������", T2.�������� "��������"
     , T2.����� "�����", T2.��� "���", T2.�Ǳ� "�Ǳ�", T2.�ʱ� "�ʱ�", T2.���� "����"
     , DENSE_RANK() OVER(PARTITION BY T2.�����ڵ� ORDER BY T2.���� DESC) "���"
     , CASE WHEN T2.�ߵ�Ż���ڵ� IS NULL THEN '-' ELSE TO_CHAR(T2.�ߵ�Ż����) END "�ߵ�Ż����"
     , CASE WHEN T2.�ߵ�Ż���ڵ� IS NULL THEN '-' ELSE T2.�ߵ�Ż������ END "�ߵ�Ż������"
FROM 
(
    SELECT T1.�й� "�й�", T1.�̸� "�̸�", T1.������ "������", T1.�����ڵ� "�����ڵ�", T1.����� "�����", T1.�������� "��������", T1.�������� "��������"
         , T1.����� "�����", (T1.������ * (T1.���/100)) "���", (T1.�Ǳ���� * (T1.�Ǳ�/100)) "�Ǳ�", (T1.�ʱ���� * (T1.�ʱ�/100)) "�ʱ�"
         , ( (T1.������ * (T1.���/100)) + (T1.�Ǳ���� * (T1.�Ǳ�/100)) + (T1.�ʱ���� * (T1.�ʱ�/100)) ) "����"
        , T1.�ߵ�Ż�� "�ߵ�Ż���ڵ�", T1. �ߵ�Ż���� "�ߵ�Ż����", T1.�ߵ�Ż������ "�ߵ�Ż������"
    FROM 
    (
        SELECT ST.STUDNO "�й�", ST.NAME "�̸�", C.NAME "������", OS.SUBJECT_CODE "�����ڵ�", SJ.NAME "�����", OC.STARTDATE "��������", OC.ENDDATE "��������", B.NAME "�����"
              , OS.ATTEND "������", OS.PRACTICE "�Ǳ����", OS.WRITE "�ʱ����"
              , S.ATTEND "���",  S.PRACTICE "�Ǳ�", S.WRITE "�ʱ�", D.DROP_CODE "�ߵ�Ż��", D.DROP_DATE "�ߵ�Ż����", DR.REASON "�ߵ�Ż������"
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

--==>> View VIEW_ALL_STUDSCORE��(��) �����Ǿ����ϴ�.

SELECT *
FROM VIEW_ALL_STUDSCORE;
--==>>
/*
1111111	������	JAVA�� �����ϴ� �ڵ�����	    �ڹ� ����	2022-03-01	2022-08-20	�̰��� �ڹٴ�					1	-	-
                                                :
*/



/*==============================================================================
-- ������������  [ ������(SEQUENCE) ��� ]  ������������  -- 
===============================================================================*/

-- �� ������û ������
CREATE SEQUENCE SEQ_SIGNCOURSE
NOCACHE;
--==>> Sequence SEQ_SIGNCOURSE��(��) �����Ǿ����ϴ�.

-- �� �ߵ�Ż�� ������
CREATE SEQUENCE SEQ_DROP
NOCACHE;
--==>> Sequence SEQ_DROP��(��) �����Ǿ����ϴ�.

-- �� �ߵ�Ż������ ������
CREATE SEQUENCE SEQ_DROPREASON
NOCACHE;
--==>> Sequence SEQ_DROPREASON��(��) �����Ǿ����ϴ�.

-- �� ���� ������
CREATE SEQUENCE SEQ_SUBJECT
NOCACHE;
--==>> Sequence SEQ_SUBJECT��(��) �����Ǿ����ϴ�.

-- �� ���� ���� ������
CREATE SEQUENCE SEQ_OPENSUBJECT
NOCACHE;
--==>> Sequence SEQ_OPENSUBJECT��(��) �����Ǿ����ϴ�.

-- �� ���� ������ 
CREATE SEQUENCE SEQ_BOOK
NOCACHE;
--==>> Sequence SEQ_BOOK��(��) �����Ǿ����ϴ�.

-- �� �л� ������
CREATE SEQUENCE SEQ_STUDENT
NOCACHE;
--==>> Sequence SEQ_STUDENT��(��) �����Ǿ����ϴ�.

-- �� ���� ������
CREATE SEQUENCE SEQ_PROFESSOR
NOCACHE;
--==>> Sequence SEQ_PROFESSOR��(��) �����Ǿ����ϴ�.

-- �� ���� ������
CREATE SEQUENCE SEQ_COURSE
NOCACHE;
--==>> Sequence SEQ_COURSE��(��) �����Ǿ����ϴ�.

-- �� �������� ������
CREATE SEQUENCE SEQ_OPENCOURSE_CODE
NOCACHE;
--==>> Sequence SEQ_OPENCOURSE_CODE��(��) �����Ǿ����ϴ�.

-- �� �����Է� ������
CREATE SEQUENCE SEQ_SCORE
NOCACHE;
--==>> Sequence SEQ_SCORE��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------

