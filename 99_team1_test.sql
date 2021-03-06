/*
예외
과목UPDATE      : 과목코드 존재확인
과목DELETE      : 과목코드 존재확인
개설과목INSERT  : 과목시작일 <= 과목완료일
                  과목일자가 과정기간 안에 있어야 개설가능
                  같은과정 내에 과목끼리 기간 겹치면 안됨
                  배점(출결+필기+실기 = 100) 확인
                  과목코드 중복되는지 확인
                  개설과정코드 존재확인
                  과목코드 존재확인
                  교재코드 존재확인
개설과목UPDATE
    _①배점제외 : 개설과목코드 존재확인
                  과목일자가 과정기간 안에 있어야 개설가능
                  같은과정 내에 과목끼리 기간 겹치면 안됨
                  과목코드 중복되는지 확인
                  개설과정코드 존재확인
                  과목코드 존재확인
                  교재코드 존재확인
개설과목UPDATE
       _②배점  : 개설과목코드 존재확인
                  배점(출결+필기+실기 = 100) 확인
개설과목DELETE  : 개설과목코드 존재확인
중탈INSERT      : 수강신청코드 중복확인
중탈UPDATE      : 중탈코드 존재확인
                  중탈사유코드 존재확인
중탈DELETE      : 중탈코드 존재확인
중탈사유UPDATE  : 중탈사유코드 존재확인
중탈사유DELETE  : 중탈사유코드 존재확인
교재UPDATE      : 교재코드 존재확인
교재DELETE      : 교재코드 존재확인
강의실INSERT    : 강의실코드 중복확인
강의실UPDATE    : 강의실코드 존재확인
강의실DELETE    : 강의실코드 존재확인
*/

--------------------------------------------------------------------------------
-- 교수 테스트
-- INSERT
EXEC PRC_PROFESSOR_INSERT('교수님', '9603292234567');
EXEC PRC_PROFESSOR_INSERT('교수님', '8603292234567');

SELECT *
FROM TBL_PROFESSOR;


-- UPDATE
EXEC PRC_PROFESSOR_UPDATE('S0001', '이수정', '1234');
EXEC PRC_PROFESSOR_UPDATE('P0004', '교수정', '9999');

SELECT *
FROM TBL_PROFESSOR;


-- DELETE
EXEC PRC_PROFESSOR_DELETE('S0001');
EXEC PRC_PROFESSOR_DELETE('P0004');

SELECT *
FROM TBL_PROFESSOR;

ROLLBACK;

--------------------------------------------------------------------------------
-- 학생 테스트
-- INSERT
EXEC PRC_STUDENT_INSERT('학생1', '9606082234567');
EXEC PRC_STUDENT_INSERT('학생1', '9906082234567');

SELECT *
FROM TBL_STUDENT;


-- UPDATE
EXEC PRC_STUDENT_UPDATE('9999999', '0학생0', '9999');
EXEC PRC_STUDENT_UPDATE('S00004', '학생11', '1111');

SELECT *
FROM TBL_STUDENT;


-- DELETE
EXEC PRC_STUDENT_DELETE('9999999');
EXEC PRC_STUDENT_DELETE('S00004');

SELECT *
FROM TBL_STUDENT;

ROLLBACK;
--------------------------------------------------------------------------------
-- 과정 테스트
-- INSERT
EXEC PRC_COURSE_INSERT('자료구조 마스터');

SELECT *
FROM TBL_COURSE;


-- UPDATE
EXEC PRC_COURSE_UPDATE('C1111', '하이');
EXEC PRC_COURSE_UPDATE('CO0002', '자료구조 MASTER');

SELECT *
FROM TBL_COURSE;


-- DELETE
EXEC PRC_COURSE_DELETE('C11111');
EXEC PRC_COURSE_DELETE('CO0002');

SELECT *
FROM TBL_COURSE;

ROLLBACK;

--------------------------------------------------------------------------------
-- 개설과정 테스트

-- INSERT (STARTDATE, ENDDATE, 과정개설일, 교수번호, 과정코드, 강의실코드
-- 교수코드 없을시 예외 
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), SYSDATE, 'P9999', 'PYTHON001', 'A301');

-- 과정코드 없을시 예외
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'YYYYYY001', 'A301');

-- 강의실코드 없을시 예외
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-11-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A399');

-- 과정시작일 > 종료일
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-12-24', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A301');

-- 이미 진행중인 과정의 강의실 OR 교수님
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0003', 'PYTHON001', 'A101');
EXEC PRC_OPENCOURSE_INSERT(TO_DATE('2022-08-15', 'YYYY-MM-DD'), TO_DATE('2022-12-01', 'YYYY-MM-DD'), SYSDATE, 'P0001', 'PYTHON001', 'A301');

-- 정상
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


-- UPDATE (과정코드, 과정이름)
-- 해당 개설과정 코드 없을 때, 예외처리
EXEC PRC_OPENCOURSE_UPDATE('OOOOO1', 'P0001', 'JAVA001', 'A101');

-- 교수코드 없을시 예외 
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001', 'P9999', 'JAVA001', 'A101');

-- 과정코드 없을시 예외
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001', 'P0001', 'JJJJ01', 'A101');

-- 강의실코드 없을시 예외
EXEC PRC_OPENCOURSE_UPDATE('OPJAVA001','P0001', 'JAVA001', 'A999');

-- 이미 진행중인 과정의 강의실 OR 교수님
-- 강의실
EXEC PRC_OPENCOURSE_UPDATE('OPORA001','P0002', 'ORA001', 'A101');
-- 교수님
EXEC PRC_OPENCOURSE_UPDATE('OPORA001','P0001', 'ORA001', 'A201'); 

-- 정상
INSERT INTO TBL_PROFESSOR VALUES('P0004', '교수', '7801011234567', '0000', TO_DATE('2004-12-01', 'YYYY-MM-DD'));
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
--==>> 참조받는 곳 있어서 삭제 ㄴㄴ
EXEC PRC_OPENCOURSE_DELETE('OP_CO1');

SELECT *
FROM TBL_OPENCOURSE;

ROLLBACK;
--------------------------------------------------------------------------------
-- 과목 테스트
-- INSERT
EXEC PRC_SUBJECT_INSERT('한국사');

SELECT *
FROM TBL_SUBJECT;


-- UPDATE
EXEC PRC_SUBJECT_UPDATE('SUB0111', 'ㅎㅎ');
EXEC PRC_SUBJECT_UPDATE('SJAVA001', 'JAVA기초');

SELECT *
FROM TBL_SUBJECT;


-- DELETE
EXEC PRC_SUBJECT_DELETE('SUB1111');
EXEC PRC_SUBJECT_DELETE('SJAVA001');
--==>> 사용중인 교재라 삭제 ㄴㄴ
EXEC PRC_SUBJECT_DELETE('SJAVA003');

SELECT *
FROM TBL_SUBJECT;

ROLLBACK;
--------------------------------------------------------------------------------
-- 개설과목 테스트
-- INSERT (STARTDATE, ENDDATE, 출석, 실기, 필기
--        , 개설과정코드, 과목코드, 교재코드)

-- 과목시작일 <= 과목완료일, 아니면 예외 발생 
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA001', 'J001');

-- 과정기간 안에 없으면, 예외 발생
    -- (과목시작일 >= 과정시작일 AND 과목완료일 <= 과정완료일)
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA001', 'J001');

-- 없는 개설과정코드면, 예외 발생
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'), 20, 40, 40, 'AAAAAAAA', 'SJAVA001', 'J001');

-- 없는 과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA999', 'J001');

-- 중복되는 과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-03', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPORA001', 'SORA001', 'O001');

-- 없는 교재코드면, 예외 발생
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA001', 'J999');

-- 출결 + 실기 + 실기 배점 = 100 확인 후, 아니면 예외 발생
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-20', 'YYYY-MM-DD'), 20, 40, 90, 'OPJAVA001', 'SJAVA001', 'J001');

-- 같은과정 내에 있는 과목끼리 기간 겹치면, 예외 발생
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-07-01', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA002', 'J001');
EXEC PRC_OPENSUBJECT_INSERT(TO_DATE('2022-03-28', 'YYYY-MM-DD'), TO_DATE('2022-06-20', 'YYYY-MM-DD'), 20, 40, 40, 'OPJAVA001', 'SJAVA002', 'J001');

-- 정상
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
-- TBL_OPENSUBJECT : ① 개설과목 정보(배점제외) UPDATE
-- 없는 개설과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_UPDATE('OOOOOO1', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA001', 'J001');

-- 과목시작일 <= 과목완료일, 아니면 예외 발생 
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2021-05-31', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA001', 'J001');

-- 과정기간 안에 없으면, 예외 발생
    -- (과목시작일 >= 과정시작일 AND 과목완료일 <= 과정완료일)
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-21', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA001', 'J001');

-- 없는 개설과정코드면, 예외 발생
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-08-20', 'YYYY-MM-DD'),'AAAAAAAA', 'SJAVA001', 'J001');

-- 없는 과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA999', 'J001');

-- 중복되는 과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-04-03', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'),'OPORA001', 'SORA001', 'O001');

-- 없는 교재코드면, 예외 발생
EXEC PRC_OPENSUBJECT_UPDATE('OPSJAVA001', TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'), 'OPJAVA001', 'SJAVA001', 'J999');

-- 같은과정 내에 있는 과목끼리 기간 겹치면, 예외 발생
EXEC PRC_OPENSUBJECT_UPDATE('OPSUB0008', TO_DATE('2022-03-28', 'YYYY-MM-DD'), TO_DATE('2022-05-01', 'YYYY-MM-DD'),'OPJAVA001', 'SJAVA002', 'J001');

-- 정상
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


-- UPDATE  PRC_OPENSUBJECT_SCORE_UPDATE(개설과목코드, 출결, 실기, 필기)
-- TBL_OPENSUBJECT : ② 개설과목 정보(배점) UPDATE
-- 없는 개설과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OOOOOO1', 0, 100, 0);

-- 출결 + 실기 + 실기 배점 = 100 확인 후, 아니면 예외 발생
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 20, 60, 0);
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 70, 40, 50);
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 0, 0, 0);

-- 정상
EXEC PRC_OPENSUBJECT_SCORE_UPDATE('OPSJAVA001', 0, 100, 0);


SELECT *
FROM TBL_OPENSUBJECT;

ROLLBACK;


-- DELETE
-- 없는 개설과목코드면, 예외 발생
EXEC PRC_OPENSUBJECT_DELETE('OOOOOO1');
-- 정상
EXEC PRC_OPENSUBJECT_DELETE('OPSJAVA001');

SELECT *
FROM TBL_OPENSUBJECT;

ROLLBACK;

--------------------------------------------------------------------------------
-- 중탈 테스트
-- INSERT
-- 수강신청코드 1번학생, 중탈사유 1번
EXEC PRC_DROP_INSERT(1, 1);    
EXEC PRC_DROP_INSERT(1, 2);

SELECT *
FROM TBL_SIGNCOURSE;
SELECT *
FROM TBL_DROPREASON;
SELECT *
FROM TBL_DROP;


-- UPDATE (중탈코드, 중탈사유코드)
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
-- 중탈사유 테스트
-- INSERT
EXEC PRC_DROPREASON_INSERT('???????');

SELECT *
FROM TBL_DROPREASON;


-- UPDATE
EXEC PRC_DROPREASON_UPDATE(110, 'ㅎㅎ');
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
-- 교재 테스트
-- INSERT
EXEC PRC_BOOK_INSERT('채애액', '저자', '출판사');
EXEC PRC_BOOK_INSERT('책책책', NULL, NULL);

SELECT *
FROM TBL_BOOK;


-- UPDATE
EXEC PRC_BOOK_UPDATE(99, 'ㅎㅇ', NULL, NULL);
EXEC PRC_BOOK_UPDATE(7, '책첵책','BOO', 'BOOK');

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
-- 강의실 테스트
-- INSERT
EXEC PRC_CLASSROOM_INSERT('A101', NULL, NULL);
EXEC PRC_CLASSROOM_INSERT('A201', NULL, NULL);
EXEC PRC_CLASSROOM_INSERT('A701', NULL, NULL);

SELECT *
FROM TBL_CLASSROOM;

ROLLBACK;


-- UPDATE
EXEC PRC_CLASSROOM_UPDATE('A701', NULL, NULL);
EXEC PRC_CLASSROOM_UPDATE('A101', 'ㅎㅎㅎㅎㅎ', 500);

SELECT *
FROM TBL_CLASSROOM;

ROLLBACK;


-- DELETE
EXEC PRC_CLASSROOM_DELETE('A111');
EXEC PRC_CLASSROOM_DELETE('A101');
--==>> 현재 자식테이블에서 참조당하고 있는 컬럼이라 삭제는 안됨

SELECT *
FROM TBL_CLASSROOM;

DELETE TBL_CLASSROOM
WHERE CLASSROOM_CODE = 'A101';

SELECT *
FROM TBL_OPENCOURSE;
--==>> OPJAVA001	2022-03-01	2022-08-20	2022-01-02	P0001	JAVA001	A101

ROLLBACK;
--------------------------------------------------------------------------------