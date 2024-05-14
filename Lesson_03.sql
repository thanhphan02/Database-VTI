-- Mệnh đề SELECT
SELECT CURRENT_DATE;
SELECT PI();
SELECT 1+1;
SELECT "Khoa";
SELECT CURRENT_DATE AS "Today", NOW() AS "NOW";
SELECT CURRENT_DATE "Today", NOW() "NOW";
-- Mệnh đề FROM
SELECT department_name, department_id
FROM department;
-- *: Tất cả 
SELECT *
FROM question;

-- Mệnh đề Where
-- Toán tử : >, >=, <, <=, =, != (<>)
SELECT *
FROM department
WHERE department_id > 5;
-- 
-- Mệnh đề SELECT
SELECT CURRENT_DATE;
SELECT PI();
SELECT 1+1;
SELECT "Khoa";
SELECT CURRENT_DATE AS "Today", NOW() AS "NOW";
SELECT CURRENT_DATE "Today", NOW() "NOW";
-- Mệnh đề FROM
SELECT department_name, department_id
FROM department;
-- *: Tất cả 
SELECT *
FROM question;

-- Mệnh đề Where
-- Toán tử : >, >=, <, <=, =, != (<>)
SELECT *
FROM department
WHERE department_id > 5;
--  AND, OR
SELECT *
FROM department
WHERE department_id >= 3 AND department_id <=8;
-- BETWEEN ... AND ...
SELECT *
FROM department
WHERE department_id BETWEEN 3 AND 8;
-- IN
SELECT *
FROM department
WHERE department_id IN (2, 4 ,6 ,7);

-- Like 
-- _: Đại diện cho 1 kí tự
-- %: Đại diện cho 0 hoặc nhiều kí tự 
SELECT *
FROM department
WHERE department_name LIKE "%g%";
-- IS NULL / IS NOT NULL
SELECT *
FROM department
WHERE department_name IS NOT NULL;

-- Mệnh đề LIMIT
SELECT *
FROM department
LIMIT 5;
-- Phân trang
SELECT *
FROM department
LIMIT 1,3; -- Start, Number

-- Mệnh đề ORDER BY ( Sắp xếp)
-- ASC, DESC( Tăng, giảm)
-- Mặc định: ASC
SELECT *
FROM exam
ORDER BY duration DESC, created_date ASC;

-- Hàm tổng hợp
-- COUNT(*): Đếm số dòng
SELECT COUNT(*) AS exam_count
FROM exam;
-- COUNT(id): Đếm số dòng mà id IS NOT NULL
SELECT COUNT(duration) AS exam_count
FROM exam;
INSERT INTO exam (exam_id, code, title, category_id, duration, creator_id)
VALUES 			 ('11', 'VTIQ011', 'Đề thi MySQL', '2', null, '9');

-- SUM, MIN, MAX, AVG (Applies only to # null values)
SELECT 
	SUM(duration),
    MIN(duration),
    MAX(duration),
    AVG(duration)
FROM exam;    

-- Mệnh đề GROUP BY
SELECT duration, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration;
--
SELECT duration, created_date, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration, created_date
ORDER BY duration, created_date;

-- Mệnh đề HAVING (Điều kiện trong GROUP)
SELECT duration, created_date, COUNT(exam_id) AS exam_count
FROM exam
GROUP BY duration, created_date
HAVING COUNT(exam_id)>1
ORDER BY duration, created_date;

-- Cập nhật dữ liệu
UPDATE department
SET department_name = "Phong chờ"
WHERE department_id=1;

-- Xóa dữ liệu
DELETE FROM exam
WHERE duration IS NULL;

