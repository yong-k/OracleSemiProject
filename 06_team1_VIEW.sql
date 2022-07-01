SELECT USER
FROM DUAL;
--==>> TEAM1
--------------------------------------------------------------------------------
-- �âââââââââââ�   [ ��(VIEW) ���� ]   �âââââââââââ�    -- 
--------------------------------------------------------------------------------
--  �¢¢¢¢¢¢¢¢¢¢¢�   [ �米�� - �α���]    �¢¢¢¢¢¢¢¢¢¢¢� --
CREATE OR REPLACE VIEW VIEW_PROFESSOR_LOGIN
AS
SELECT PF.PROFNO "������ȣ", SJ.NAME "����", OS.ENDDATE "����Ϸ���"
FROM TBL_PROFESSOR PF RIGHT JOIN TBL_OPENCOURSE OC   ON PF.PROFNO = OC.PROFNO
                      RIGHT JOIN TBL_OPENSUBJECT OS ON OC.OPENCOURSE_CODE = OS.OPENCOURSE_CODE
                      LEFT JOIN TBL_SUBJECT SJ     ON OS.SUBJECT_CODE = SJ.SUBJECT_CODE;
--==>> View VIEW_PROFESSOR_LOGIN��(��) �����Ǿ����ϴ�.
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
P0002	�ڹ� ����	2022-04-02
           :
*/

--------------------------------------------------------------------------------
-- ��Ż�� �л� �����Է� ���ϰ� �ϴ°� �߰��� �Ŀ� ������ �׽�Ʈ�� �ϸ� ��......�� ��,,,,?
--�� �¢¢¢¢¢¢¢¢¢¢¢� [ �豳�� - ����Ȯ�� ] �¢¢¢¢¢¢¢¢¢¢¢�  
CREATE OR REPLACE VIEW VIEW_PROFESSOR_SCORE
AS
SELECT PR.NAME"������", ST.NAME"�л���", OP.STARTDATE "���������",OP.ENDDATE "����������"
     , CR.NAME"������", SU.NAME"�����", BK.NAME "�����", SR.ATTEND "���", SR.PRACTICE "�Ǳ�"
     , SR.WRITE "�ʱ�", (SR.ATTEND + SR.PRACTICE + SR.WRITE) "����", DENSE_RANK()OVER(ORDER BY NVL(SR.ATTEND, 0)+NVL(SR.PRACTICE, 0)+NVL(SR.WRITE, 0) DESC) AS "���"
     , CASE WHEN SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE
            THEN '��' 
            ELSE '��'
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
ORDER BY ������, �����, ���;                                                                             
--==>> View VIEW_PROFESSOR_SCORE��(��) �����Ǿ����ϴ�.

-- ������û���̺� = �������̺��� �������� �ڵ�
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
�̾Ƹ�		2022-07-02	2023-08-02	����Ŭ�� ��� ���� ���� ����							1	N
*/
--------------------------------------------------------------------------------
--�� �¢¢¢¢¢¢¢¢¢¢¢� [ �鱳�� - �����Է� ] �¢¢¢¢¢¢¢¢¢¢¢�    --
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
-- �¢¢¢¢¢¢¢¢¢¢�  [ ������� - ����Ȯ�� ]  �¢¢¢¢¢¢¢¢¢¢�    --
CREATE OR REPLACE VIEW VIEW_ADMIN_PROFCHECK
AS
SELECT P.NAME "������", SJ.NAME "�����", OS.STARTDATE "���������", OS.ENDDATE "����������"
     , B.NAME "�����", CR.CLASSROOM_CODE "���ǽ��ڵ�", CR.CLASSROOM_COMMENT "���ǽǼ���"
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
-- �¢¢¢¢¢¢¢¢¢¢�  [ ������� - �л�Ȯ�� ]  �¢¢¢¢¢¢¢¢¢¢�    --
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
������	JAVA�� �����ϴ� �ڵ�����	�ڹ� �߱�		N	(null)	(null)	
����	(null)		                                N	(null)	(null)		
�̽ÿ�	����Ŭ�� ��� ���� ���� ����	�ڹ� ����	N	(null)	(null)		
������	JAVA�� �����ϴ� �ڵ�����	�ڹ� ����		N	(null)	(null)		
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
EXEC PRC_PROFESSOR_SCORE_INSERT('�ڹٱ��ʱ���', '1111111', 70,70,70);
SELECT *
FROM TBL_SCORE;

ROLLBACK;


--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢¢¢�  [ ������� - �������� ] �¢¢¢¢¢¢¢¢¢¢¢� --
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
-- �¢¢¢¢¢¢¢¢¢¢¢�  [ ������� - �������� ] �¢¢¢¢¢¢¢¢¢¢¢� --
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
����Ŭ�� ��� ���� ���� ����	A201	�ڹ� ����	2022-03-02	2022-06-20	�װ��� ����Ŭ	�̾Ƹ�
          :
*/

--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢¢� [ ���л� - �ߵ�Ż������ ] �¢¢¢¢¢¢¢¢¢¢�    --
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

SELECT *
FROM VIEW_DROPCHECK;
--==>> 
/*
1111111	0	0
    :
*/
--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢¢�   [ ���л� - �������� ]   �¢¢¢¢¢¢¢¢¢¢�    --

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
FROM VIEW_STUD_ALL_SUBJECT;
--==>>
/*
1111111	JAVA�� �����ϴ� �ڵ�����	�ڹ� ����	2022-08-20	
            :
*/
--------------------------------------------------------------------------------
-- �¢¢¢¢¢¢¢¢¢¢� [ ���л� - ������������ ] �¢¢¢¢¢¢¢¢¢¢�    --

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
1111111	������	JAVA�� �����ϴ� �ڵ�����	�ڹ� ����	2022-03-01	2022-08-20	�̰��� �ڹٴ�					1	-	-
                :
*/
