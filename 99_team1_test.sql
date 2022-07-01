/*
����
����UPDATE      : �����ڵ� ����Ȯ��
����DELETE      : �����ڵ� ����Ȯ��
��������INSERT  : ��������� <= ����Ϸ���
                  �������ڰ� �����Ⱓ �ȿ� �־�� ��������
                  �������� ���� ���񳢸� �Ⱓ ��ġ�� �ȵ�
                  ����(���+�ʱ�+�Ǳ� = 100) Ȯ��
                  �����ڵ� �ߺ��Ǵ��� Ȯ��
                  ���������ڵ� ����Ȯ��
                  �����ڵ� ����Ȯ��
                  �����ڵ� ����Ȯ��
��������UPDATE
    _��������� : ���������ڵ� ����Ȯ��
                  �������ڰ� �����Ⱓ �ȿ� �־�� ��������
                  �������� ���� ���񳢸� �Ⱓ ��ġ�� �ȵ�
                  �����ڵ� �ߺ��Ǵ��� Ȯ��
                  ���������ڵ� ����Ȯ��
                  �����ڵ� ����Ȯ��
                  �����ڵ� ����Ȯ��
��������UPDATE
       _�����  : ���������ڵ� ����Ȯ��
                  ����(���+�ʱ�+�Ǳ� = 100) Ȯ��
��������DELETE  : ���������ڵ� ����Ȯ��
��ŻINSERT      : ������û�ڵ� �ߺ�Ȯ��
��ŻUPDATE      : ��Ż�ڵ� ����Ȯ��
                  ��Ż�����ڵ� ����Ȯ��
��ŻDELETE      : ��Ż�ڵ� ����Ȯ��
��Ż����UPDATE  : ��Ż�����ڵ� ����Ȯ��
��Ż����DELETE  : ��Ż�����ڵ� ����Ȯ��
����UPDATE      : �����ڵ� ����Ȯ��
����DELETE      : �����ڵ� ����Ȯ��
���ǽ�INSERT    : ���ǽ��ڵ� �ߺ�Ȯ��
���ǽ�UPDATE    : ���ǽ��ڵ� ����Ȯ��
���ǽ�DELETE    : ���ǽ��ڵ� ����Ȯ��
*/

--------------------------------------------------------------------------------
-- ���� �׽�Ʈ
-- INSERT
EXEC PRC_PROFESSOR_INSERT('������', '9603292234567');
EXEC PRC_PROFESSOR_INSERT('������', '8603292234567');

SELECT *
FROM TBL_PROFESSOR;


-- UPDATE
EXEC PRC_PROFESSOR_UPDATE('S0001', '�̼���', '1234');
EXEC PRC_PROFESSOR_UPDATE('P0004', '������', '9999');

SELECT *
FROM TBL_PROFESSOR;


-- DELETE
EXEC PRC_PROFESSOR_DELETE('S0001');
EXEC PRC_PROFESSOR_DELETE('P0004');

SELECT *
FROM TBL_PROFESSOR;

ROLLBACK;

--------------------------------------------------------------------------------
-- �л� �׽�Ʈ
-- INSERT
EXEC PRC_STUDENT_INSERT('�л�1', '9606082234567');
EXEC PRC_STUDENT_INSERT('�л�1', '9906082234567');

SELECT *
FROM TBL_STUDENT;


-- UPDATE
EXEC PRC_STUDENT_UPDATE('9999999', '0�л�0', '9999');
EXEC PRC_STUDENT_UPDATE('S00004', '�л�11', '1111');

SELECT *
FROM TBL_STUDENT;


-- DELETE
EXEC PRC_STUDENT_DELETE('9999999');
EXEC PRC_STUDENT_DELETE('S00004');

SELECT *
FROM TBL_STUDENT;

ROLLBACK;
--------------------------------------------------------------------------------
-- ���� �׽�Ʈ
-- INSERT
EXEC PRC_COURSE_INSERT('�ڷᱸ�� ������');

SELECT *
FROM TBL_COURSE;


-- UPDATE
EXEC PRC_COURSE_UPDATE('C1111', '����');
EXEC PRC_COURSE_UPDATE('CO0002', '�ڷᱸ�� MASTER');

SELECT *
FROM TBL_COURSE;


-- DELETE
EXEC PRC_COURSE_DELETE('C11111');
EXEC PRC_COURSE_DELETE('CO0002');

SELECT *
FROM TBL_COURSE;

ROLLBACK;

--------------------------------------------------------------------------------
-- �������� �׽�Ʈ

-- INSERT (STARTDATE, ENDDATE, ����������, ������ȣ, �����ڵ�, ���ǽ��ڵ�
-- �����ڵ� ������ ���� 
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), SYSDATE, 'P9999', 'PYTHON001', 'A301');

-- �����ڵ� ������ ����
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'YYYYYY001', 'A301');

-- ���ǽ��ڵ� ������ ����
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A399');

-- ���������� > ������
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-12-24', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A301');

-- �̹� �������� ������ ���ǽ� OR ������
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A101');
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0001', 'PYTHON001', 'A301');

-- ����
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A301');

SELECT *
FROM TBL_PROFESSOR;
SELECT *
FROM TBL_STUDENT;
SELECT *
FROM TBL_COURSE;
SELECT *
FROM TBL_CLASSROOM;
SELECT *
FROM TBL_OPENCOURSE;


-- UPDATE (�����ڵ�, �����̸�)
-- �ش� �������� �ڵ� ���� ��, ����ó��
EXEC PRC_OPENCOURSE_UPDATE('OOOOO1', 'P0001', 'JAVA001', 'A101');

-- �����ڵ� ������ ���� 
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001', 'P9999', 'JAVA001', 'A101');

-- �����ڵ� ������ ����
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001', 'P0001', 'JJJJ01', 'A101');

-- ���ǽ��ڵ� ������ ����
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001','P0001', 'JAVA001', 'A999');

-- �̹� �������� ������ ���ǽ� OR ������
-- ���ǽ�
EXEC PRC_OPENCOURSE_UPDATE('OPORA001','P0002', 'ORA001', 'A101');
-- ������
EXEC PRC_OPENCOURSE_UPDATE('OPORA001','P0001', 'ORA001', 'A201'); 

-- ����
INSERT INTO TBL_PROFESSOR VALUES('P0004', '����', '7801011234567', '0000', TO_DATE('2004-12-01', 'YYYY-MM-DD'));
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001', 'P0004', 'JAVA001', 'B202');

SELECT *
FROM TBL_OPENCOURSE;
SELECT *
FROM TBL_PROFESSOR;
SELECT *
FROM TBL_COURSE;
SELECT *
FROM TBL_SUBJECT;
SELECT *
FROM TBL_CLASSROOM;

ROLLBACK;


-- DELETE
EXEC PRC_OPENCOURSE_DELETE('OPDDDD001');
EXEC PRC_OPENCOURSE_DELETE('OPJAVA001');
--==>> �����޴� �� �־ ���� ����
EXEC PRC_OPENCOURSE_DELETE('OP_CO1');

SELECT *
FROM TBL_OPENCOURSE;

ROLLBACK;
--------------------------------------------------------------------------------
-- ���� �׽�Ʈ
-- INSERT
EXEC PRC_SUBJECT_INSERT('�ѱ���');

SELECT *
FROM TBL_SUBJECT;


-- UPDATE
EXEC PRC_SUBJECT_UPDATE('SUB0111', '����');
EXEC PRC_SUBJECT_UPDATE('SJAVA001', 'JAVA����');

SELECT *
FROM TBL_SUBJECT;


-- DELETE
EXEC PRC_SUBJECT_DELETE('SUB1111');
EXEC PRC_SUBJECT_DELETE('SJAVA001');
--==>> ������� ����� ���� ����
EXEC PRC_SUBJECT_DELETE('SJAVA003');

SELECT *
FROM TBL_SUBJECT;

ROLLBACK;
--------------------------------------------------------------------------------
-- �������� �׽�Ʈ
-- INSERT (STARTDATE, ENDDATE, �⼮, �Ǳ�, �ʱ�
--        , ���������ڵ�, �����ڵ�, �����ڵ�)

-- ��������� <= ����Ϸ���, �ƴϸ� ���� �߻� 
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA001', 'J001');

-- �����Ⱓ �ȿ� ������, ���� �߻�
    -- (��������� >= ���������� AND ����Ϸ��� <= �����Ϸ���)
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA001', 'J001');

-- ���� ���������ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 20, 40, 40, 'AAAAAAAA', 'SJAVA001', 'J001');

-- ���� �����ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA999', 'J001');

-- �ߺ��Ǵ� �����ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-03', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPORA001', 'SORA001', 'O001');

-- ���� �����ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA001', 'J999');

-- ��� + �Ǳ� + �Ǳ� ���� = 100 Ȯ�� ��, �ƴϸ� ���� �߻�
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-20', 'YYYY-MM-DD'), 20, 40, 90, 'OPJAVA001', 'SJAVA001', 'J001');

-- �������� ���� �ִ� ���񳢸� �Ⱓ ��ġ��, ���� �߻�
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA002', 'J001');
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-28', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA002', 'J001');

-- ����
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-26', 'YYYY-MM-DD'), TO_DATE('2022-04-28', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA002', 'J001');

SELECT *
FROM TBL_OPENCOURSE;
SELECT *
FROM TBL_SUBJECT;
SELECT *
FROM TBL_BOOK;
SELECT *
FROM TBL_OPENSUBJECT;
SELECT *

FROM TBL_OPENSUBJECT
WHERE OPENCOURSE_CODE = 'OPJAVA001'
ORDER BY OPENCOURSE_CODE, STARTDATE;
ROLLBACK;


-- UPDATE
-- TBL_OPENSUBJECT : �� �������� ����(��������) UPDATE
-- ���� ���������ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_UPDATE('OOOOOO1', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA001', 'J001');

-- ��������� <= ����Ϸ���, �ƴϸ� ���� �߻� 
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA001', 'J001');

-- �����Ⱓ �ȿ� ������, ���� �߻�
    -- (��������� >= ���������� AND ����Ϸ��� <= �����Ϸ���)
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA001', 'J001');

-- ���� ���������ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'),'AAAAAAAA', 'SJAVA001', 'J001');

-- ���� �����ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA999', 'J001');

-- �ߺ��Ǵ� �����ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-04-03', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'),'OPORA001', 'SORA001', 'O001');

-- ���� �����ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 'OPJAVA001', 'SJAVA001', 'J999');

-- �������� ���� �ִ� ���񳢸� �Ⱓ ��ġ��, ���� �߻�
EXEC PRC_OPENSUBJECT_UPDATE('OPSUB0008', TO_DATE('2022-03-28', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA002', 'J001');

-- ����
EXEC PRC_OPENSUBJECT_UPDATE('OPSUB0008', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-04-28', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA002', 'J001');

SELECT *
FROM TBL_OPENCOURSE;
SELECT *
FROM TBL_SUBJECT;
SELECT *
FROM TBL_BOOK;
SELECT *
FROM TBL_OPENSUBJECT;

SELECT *
FROM TBL_OPENSUBJECT
WHERE OPENCOURSE_CODE = 'OPJAVA001'
ORDER BY OPENCOURSE_CODE, STARTDATE;

ROLLBACK;


-- UPDATE  PRC_OPENSUBJECT_SCORE_UPDATE(���������ڵ�, ���, �Ǳ�, �ʱ�)
-- TBL_OPENSUBJECT : �� �������� ����(����) UPDATE
-- ���� ���������ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OOOOOO1', 0, 100, 0);

-- ��� + �Ǳ� + �Ǳ� ���� = 100 Ȯ�� ��, �ƴϸ� ���� �߻�
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 20, 60, 0);
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 70, 40, 50);
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 0, 0, 0);

-- ����
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 0, 100, 0);


SELECT *
FROM TBL_OPENSUBJECT;

ROLLBACK;


-- DELETE
-- ���� ���������ڵ��, ���� �߻�
EXEC PRC_OPENSUBJECT_DELETE('OOOOOO1');
-- ����
EXEC PRC_OPENSUBJECT_DELETE('OPSJAVA001');

SELECT *
FROM TBL_OPENSUBJECT;

ROLLBACK;

--------------------------------------------------------------------------------
-- ��Ż �׽�Ʈ
-- INSERT
-- ������û�ڵ� 1���л�, ��Ż���� 1��
EXEC PRC_DROP_INSERT(1, 1);    
EXEC PRC_DROP_INSERT(1, 2);

SELECT *
FROM TBL_SIGNCOURSE;
SELECT *
FROM TBL_DROPREASON;
SELECT *
FROM TBL_DROP;


-- UPDATE (��Ż�ڵ�, ��Ż�����ڵ�)
EXEC PRC_DROP_UPDATE(100, 1);
EXEC PRC_DROP_UPDATE(1, 1001);
EXEC PRC_DROP_UPDATE(3, 2);

SELECT *
FROM TBL_DROP;


-- DELETE
EXEC PRC_DROP_DELETE(1009);
EXEC PRC_DROP_DELETE(3);

SELECT *
FROM TBL_DROP;

ROLLBACK;
--------------------------------------------------------------------------------
-- ��Ż���� �׽�Ʈ
-- INSERT
EXEC PRC_DROPREASON_INSERT('???????');

SELECT *
FROM TBL_DROPREASON;


-- UPDATE
EXEC PRC_DROPREASON_UPDATE(110, '����');
EXEC PRC_DROPREASON_UPDATE(9, ';;;;;;');

SELECT *
FROM TBL_DROPREASON;


-- DELETE
EXEC PRC_DROPREASON_DELETE(999);
EXEC PRC_DROPREASON_DELETE(9);

SELECT *
FROM TBL_DROPREASON;

ROLLBACK;
--------------------------------------------------------------------------------
-- ���� �׽�Ʈ
-- INSERT
EXEC PRC_BOOK_INSERT('ä�־�', '����', '���ǻ�');
EXEC PRC_BOOK_INSERT('ååå', NULL, NULL);

SELECT *
FROM TBL_BOOK;


-- UPDATE
EXEC PRC_BOOK_UPDATE(99, '����', NULL, NULL);
EXEC PRC_BOOK_UPDATE(7, 'åýå','BOO', 'BOOK');

SELECT *
FROM TBL_BOOK;


-- DELETE
EXEC PRC_BOOK_DELETE(9);
EXEC PRC_BOOK_DELETE(7);
EXEC PRC_BOOK_DELETE(6);

SELECT *
FROM TBL_BOOK;

ROLLBACK;

--------------------------------------------------------------------------------
-- ���ǽ� �׽�Ʈ
-- INSERT
EXEC PRC_CLASSROOM_INSERT('A101', NULL, NULL);
EXEC PRC_CLASSROOM_INSERT('A201', NULL, NULL);
EXEC PRC_CLASSROOM_INSERT('A701', NULL, NULL);

SELECT *
FROM TBL_CLASSROOM;

ROLLBACK;


-- UPDATE
EXEC PRC_CLASSROOM_UPDATE('A701', NULL, NULL);
EXEC PRC_CLASSROOM_UPDATE('A101', '����������', 500);

SELECT *
FROM TBL_CLASSROOM;

ROLLBACK;


-- DELETE
EXEC PRC_CLASSROOM_DELETE('A111');
EXEC PRC_CLASSROOM_DELETE('A101');
--==>> ���� �ڽ����̺��� �������ϰ� �ִ� �÷��̶� ������ �ȵ�

SELECT *
FROM TBL_CLASSROOM;

DELETE TBL_CLASSROOM
WHERE CLASSROOM_CODE = 'A101';

SELECT *
FROM TBL_OPENCOURSE;
--==>> OPJAVA001	2022-03-01	2022-08-20	2022-01-02	P0001	JAVA001	A101

ROLLBACK;
--------------------------------------------------------------------------------