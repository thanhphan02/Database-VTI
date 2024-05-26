-- LOCAL VARIABLE: Biến cục bộ
-- Phạm vi sử dụng: BEGIN END
-- Từ khóa : DECLARE
-- VD: DECLARE id INT;

-- SESSION VARIABLE: Biến sesion
-- Phạm vi sử dụng: Cả session
-- Từ khóa: SET
-- VD
SET @age =18;
SELECT @age;

-- GLOBAL VARIABLE: Biến toàn cục
-- Phạm vi sử dụng: Toàn bộ
-- Từ khóa: SET
-- Hiển thị danh sách biến

SHOW VARIABLES;
-- VD: Thay đổi connect_timeout thành 5
SET GLOBAL connect_timeout =10;

-- TRIGGER
-- Thời điểm: BEFORE, AFTER
-- Sự kiện : INSERT, UPDATE, DELETE
-- VD 1:
DROP TRIGGER IF EXISTS  trigger_01;
DELIMITER $$
CREATE TRIGGER trigger_01
BEFORE INSERT ON group_account
FOR EACH ROW 
BEGIN
	IF NEW.joined_date> CURRENT_DATE THEN
		SET NEW.joined_date = CURRENT_DATE;
    END IF;
END $$
DELIMITER ;
INSERT INTO group_account (group_id, account_id, joined_date)
VALUES (5, 10, "4000-04-04");

-- VD 2:
DROP TRIGGER IF EXISTS  trigger_02;
DELIMITER $$
CREATE TRIGGER trigger_02
BEFORE INSERT ON group_account
FOR EACH ROW 
BEGIN
	IF NEW.joined_date> CURRENT_DATE THEN
		SIGNAL SQLSTATE "12345"
        SET MESSAGE_TEXT ="Thời gian tham gia không hợp lệ";
    END IF;
END $$
DELIMITER ;
INSERT INTO group_account (group_id, account_id, joined_date)
VALUES (5, 1, "4000-04-04");

-- Hiển thị danh sách trigger
SHOW TRIGGERS;