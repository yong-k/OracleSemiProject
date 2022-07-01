
--��������� ���� ���� INSERT ���ν���  ����--
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


--��������� ���� ���� UPDATE ���ν��� ����--
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


--���ᱳ�� ���� DELETE ���ν��� ����--
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

-- �л� ���̺� INSERT(�̸�, SSN, PW:�ֹ����ڸ�) ���ν���
-- ���ν��� �� : PRC_STUDENT_INSERT
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


-- - �л� ���̺� UPDATE
-- ���ν��� �� : PRC_STUDENT_UPDATE
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


-- - �л� ���̺� DELETE
-- ���ν��� �� : PRC_STUDENT_DELETE
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

-- �ܡܡ� ���� ���̺� ���ν��� �ܡܡ� --

-- �� �������̺� �μ�Ʈ ���ν��� (������)
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


-- �� �������̺� UPDATE ���ν���(�����ڵ�, ������ �̸�)
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

-- �� �������̺� DELETE ���ν���(�����ڵ�)
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

-- TBL_OPENCOURE :  �������� ������ �߰�
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
-- �� �������� ������ UPDATE ���ν��� ����(���������ڵ�, ���ǽ�����, ����������, ������ȣ, �����ڵ�, ���ǽ��ڵ�)
--> ����������, ������ ���� �Ұ� �� ������/������ �����Ϸ��� �����ߴٰ� �ٽ� insert 
--> ������米��, �����ڵ�, ���ǽ��ڵ� update
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


-- �� �������� ������ DELETE ���ν��� ����(���������ڵ�, ���ǽ�����, ����������, ������ȣ, �����ڵ�, ���ǽ��ڵ�)
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

-- TBL_SUBJECT : ���� ������ �߰�
CREATE OR REPLACE PROCEDURE PRC_SUBJECT_INSERT
( V_NAME            IN  TBL_SUBJECT.NAME%TYPE
)
IS
    V_SUBJECT_CODE  TBL_SUBJECT.SUBJECT_CODE%TYPE;
BEGIN
    V_SUBJECT_CODE := 'SUB' || LPAD(SEQ_OPENSUBJECT.NEXTVAL, 4, 0);
    
    INSERT INTO TBL_SUBJECT
    VALUES(V_SUBJECT_CODE, V_NAME);

    --COMMIT;
END;
--==>> Procedure PRC_SUBJECT_INSERT��(��) �����ϵǾ����ϴ�.


-- TBL_SUBJECT : ���� �̸� ����
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


-- TBL_SUBJECT : ���� ������ ����
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

-- TBL_OPENSUBJECT : �������� �߰�
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


-- TBL_OPENSUBJECT : �� �������� ����(��������) UPDATE
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


-- TBL_OPENSUBJECT : �� �������� ���,�Ǳ�,�ʱ� ���� UPDATE
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


-- TBL_OPENSUBJECT : �������� ������ ����
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

-- TBL_DROP : �ߵ�Ż�� �л� INSERT
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


-- TBL_DROP : �ߵ�Ż�� �л��� Ż�������ڵ� ������ UPDATE
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


-- TBL_DROP : �ߵ�Ż�� �л� ������ DELETE
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

-- TBL_DROPREASON : �ߵ�Ż������ ���̺� INSERT
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


-- TBL_DROPREASON : �ߵ�Ż������ UPDATE
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


-- TBL_DROPREASON : �ߵ�Ż������ ������ DELETE
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

-- TBL_BOOK : ���� ���̺� INSERT
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


-- TBL_BOOK : �������� UPDATE
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


-- TBL_BOOK : ���� ������ DELETE
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

-- TBL_CLASSROOM : ���ǽ� ���̺� INSERT
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


-- TBL_CLASSROOM : ���ǽ� ���� OR �����ο� ������ UPDATE
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


-- TBL_CLASSROOM : ���ǽ� ������ DELETE
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
