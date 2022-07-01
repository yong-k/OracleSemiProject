SELECT *
FROM TBL_SIGNCOURSE;
SELECT *
FROM TBL_PROFESSOR;
SELECT *
FROM TBL_COURSE;
SELECT *
FROM TBL_OPENCOURSE;
SELECT *
FROM TBL_OPENSUBJECT;
SELECT *
FROM TBL_SUBJECT;
SELECT *
FROM TBL_BOOK;
SELECT *
FROM TBL_SIGNCOURSE;
-- 예전 코스 하나 만들기 P0011, 과목 추가
EXEC PRC_COURSE_INSERT('알고리즘 마스터');
EXEC PRC_OPENCOURSE_INSERT('2021-12-31', '2022-03-18', SYSDATE, 'P0011', 'CO0010', 'C101');
EXEC PRC_SUBJECT_INSERT('알고리즘(상)');
EXEC PRC_SUBJECT_INSERT('알고리즘(하)');
EXEC PRC_BOOK_INSERT('쉽게 이해되는 알고리즘(상)', NULL, NULL);
EXEC PRC_BOOK_INSERT('쉽게 이해되는 알고리즘(하)', NULL, NULL); 
EXEC PRC_OPENSUBJECT_INSERT('2021-12-31', '2022-01-28','OP_CO6', 'SUB0038', '18');
EXEC PRC_OPENSUBJECT_INSERT('2022-01-29', '2022-03-18','OP_CO6', 'SUB0039', '19');
EXEC PRC_OPENSUBJECT_UPDATE('OPSUB0041', '2022-01-29', '2022-03-18', 'OP_CO6', 'SUB0039', '19');
COMMIT;
SELECT *
FROM TBL_OPENSUBJECT;

EXEC PRC_PROFESSOR_LOGIN('P0011', '1566789');

-- 예전 코스 하나 만들기 P0011, 과목 추가
EXEC PRC_COURSE_INSERT('알고리즘 마스터');
EXEC PRC_OPENCOURSE_INSERT('2021-12-31', '2022-03-18', SYSDATE, 'P0011', 'CO0010', 'C101');
EXEC PRC_SUBJECT_INSERT('알고리즘(상)');
EXEC PRC_SUBJECT_INSERT('알고리즘(하)');
EXEC PRC_BOOK_INSERT('쉽게 이해되는 알고리즘(상)', NULL, NULL);
EXEC PRC_BOOK_INSERT('쉽게 이해되는 알고리즘(하)', NULL, NULL); 
EXEC PRC_OPENSUBJECT_INSERT('2021-12-31', '2022-01-28','OP_CO6', 'SUB0038', '18');
EXEC PRC_OPENSUBJECT_INSERT('2022-01-29', '2022-03-18','OP_CO6', 'SUB0039', '19');
EXEC PRC_OPENSUBJECT_UPDATE('OPSUB0041', '2022-01-29', '2022-03-18', 'OP_CO6', 'SUB0039', '19');
COMMIT;
SELECT *
FROM TBL_OPENSUBJECT;

EXEC PRC_PROFESSOR_LOGIN('P0011', '1566789');



CREATE OR REPLACE VIEW VIEW_SCORE_PRINT
AS
SELECT DECODE(DR.DROP_DATE, NULL, 'X', 'O') "중도탈락여부", SC.OPENCOURSE_CODE "개설과정코드", OS.OPENSUBJECT_CODE "개설과목코드", SD.STUDNO "학번"
, SD.NAME "학생이름", NVL(S.ATTEND, 0) "출결점수", NVL(S.PRACTICE, 0) "필기점수", NVL(S.WRITE, 0) "실기점수"
FROM TBL_SCORE S FULL JOIN TBL_SIGNCOURSE SC 
                    ON S.SIGNCOURSE_CODE = SC.SIGNCOURSE_CODE AND SC.SIGNCOURSE_CODE = S.SIGNCOURSE_CODE
                 FULL JOIN TBL_STUDENT SD
                    ON SC.STUDNO = SD.STUDNO 
                 FULL JOIN TBL_OPENSUBJECT OS 
                    ON OS.OPENCOURSE_CODE = SC.OPENCOURSE_CODE 
                 FULL JOIN TBL_DROP DR
                    ON SC.SIGNCOURSE_CODE = DR.SIGNCOURSE_CODE 
ORDER BY 개설과정코드, 개설과목코드;

SELECT *
FROM VIEW_SCORE_PRINT;











