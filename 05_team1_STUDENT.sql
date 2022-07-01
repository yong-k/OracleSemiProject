SET SERVEROUTPUT ON;
-- [ �л� ] 
-- �� ���� �ߵ�Ż�� �л� Ȯ�� VIEW          (VIEW_DROPCHECK)
-- �� �л� �������� ��� VIEW               (VIEW_STUD_ALL_SUBJECT)
-- �� �л� �α��� ���ν���                  (PRC_STUD_LOGIN)
-- �� �����Ϸ���� ���� ���� ��� VIEW      (VIEW_ALL_STUDSCORE)
-- �� �����Ϸ���� ���� ���� ��� ���ν���  (PRC_STUD_SCORE)
-- �� �������� ���� Ȯ�� ���ν���           (PRC_STUD_EACHSCORE)
-- �� ������û INSERT ���ν���              (PRC_SIGNCOURSE_INSERT)


-- �� ���� �ߵ�Ż�� �л� Ȯ�� VIEW

-- �л� �α��� ��, '�������� �ߵ�Ż���� �л� �� �����Ϸ��� ������ �������� �ʴ� �л�'�� �й� �ɷ����� ���� VIEW.

CREATE OR REPLACE VIEW VIEW_DROPCHECK
AS
SELECT T.�й�, SUM(T.����) "�����Է¿���", SUM(T.�ߵ�Ż��) "�ߵ�Ż������"                             
FROM 
(
    SELECT �й�, ������, �����, ��������
          , CASE WHEN ���� IS NULL THEN 0 ELSE 1 END ����
          , CASE WHEN �ߵ�Ż�� IS NULL THEN 0 ELSE 1 END �ߵ�Ż��
    FROM 
    (
      SELECT ST.STUDNO "�й�", C.NAME "������", SJ.NAME "�����", OC.ENDDATE "��������"
             , S.ATTEND "���",  S.PRACTICE "�Ǳ�", S.WRITE "�ʱ�", (S.ATTEND + S.PRACTICE + S.WRITE) "����", D.DROP_CODE "�ߵ�Ż��"
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
GROUP BY T.�й�;
--==>> View VIEW_DROPCHECK��(��) �����Ǿ����ϴ�.



-- �� �л� �������� ��� VIEW

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
                                                  ON SC.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE                                  
);
--==>> View VIEW_STUD_ALL_SUBJECT��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_STUDENT;
EXEC PRC_STUD_LOGIN('S00005', '2111111');
                                        
-- �� �л� �α��� ���ν���

-- IN �Ű����� : �й�, �н�����

-- 1. �Էµ� �й� �Ǵ� �н����� ���� ����ġ �� �й� �Ǵ� �н����� ���� 
-- 2-1. �α��� ���� �� �����Ϸ��� ���� �������� �ʰ�, �������� �ߵ�Ż���� �л� �� ���� �ߵ�Ż�� + �����Ϸ� ���� ������ ���� 
-- 2-2. �α��� ���� �� �ߵ�Ż�� ���� ������� �ּ� �� �� �̻��� �����Ϸ��� ���� �����ϴ� �л� �� �����Ϸ����� ��� VIEW ���

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
    SELECT ������, �����, ��������
    FROM VIEW_STUD_ALL_SUBJECT
    WHERE �й� = V_STUDNO AND �������� <= SYSDATE AND ���� IS NOT NULL;
    
    USER_DEFINE_ERROR       EXCEPTION;
    USER_DEFINE_ERROR2      EXCEPTION;
    
BEGIN
    
    SELECT PW INTO V_PW2
    FROM TBL_STUDENT
    WHERE STUDNO = V_STUDNO;
    
    SELECT �й� INTO V_STUDNO2
    FROM VIEW_DROPCHECK
    WHERE �й� = V_STUDNO AND �����Է¿��� = 0 AND �ߵ�Ż������ > 0;
    

    IF (V_PW != V_PW2)
        THEN RAISE USER_DEFINE_ERROR;
    ELSIF (V_STUDNO = V_STUDNO2)
        THEN RAISE USER_DEFINE_ERROR2;
    ELSE
            OPEN CUR_STUDENT_SUBJECT;
        
            LOOP
                FETCH CUR_STUDENT_SUBJECT INTO V_COURSE, V_SUBJECT, V_ENDDATE;
                EXIT WHEN CUR_STUDENT_SUBJECT%NOTFOUND;
                
                DBMS_OUTPUT.PUT_LINE('������ : ' || V_COURSE || ' | ����� : ' || V_SUBJECT || ' | �������� : ' || V_ENDDATE);
            END LOOP;
            
            CLOSE CUR_STUDENT_SUBJECT;     
    END IF;
    
    EXCEPTION
        WHEN NO_DATA_FOUND
            THEN RAISE_APPLICATION_ERROR(-20999, '�й� �Ǵ� �н����带 �߸� �Է��Ͽ����ϴ�. �ٽ� �Է��ϼ���.');
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20402, '�й� �Ǵ� �н����带 �߸� �Է��Ͽ����ϴ�. �ٽ� �Է��ϼ���.');
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20405, '�������� �ߵ�Ż���� �л��Դϴ�. �����Ϸ��� ������ �����ϴ�.');
END; 
--==>> Procedure PRC_STUD_LOGIN��(��) �����ϵǾ����ϴ�.          



-- �� �����Ϸ���� ���� ���� ��� VIEW

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


-- �� �����Ϸ���� ���� ���� ��� ���ν���

-- IN �Ű����� : �й�
-- �ش� �й��� �����Ϸ���� ���� ���� ������ ���.

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



-- �� �������� ���� Ȯ�� ���ν���

-- �α��� ���� �� �����Ϸ��� ����� ��� ���
-- ����� ��� �߿��� ���� Ȯ���Ϸ��� ����� Ŭ�� 

-- IN �Ű����� : �α��� �� �Էµ� �й�, ������ ����� 
-- �Էµ� �й��� ��ü �������� �� ������ �ԷµǾ��ְ� �л��� ������ ����� �ش��ϴ� ���������� ���

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


-- �� ������û INSERT ���ν��� 
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















