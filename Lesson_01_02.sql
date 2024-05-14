-- Xóa cơ sỡ dữ liệu (nếu tồn tại)
DROP DATABASE IF EXISTS lesson_01;

-- Tạo cơ sở dữ liệu 
CREATE DATABASE lesson_01;

-- Hiển thị danh sách cơ sở dữ liệu
SHOW DATABASES;

-- Chọn cơ sở dữ liệu muốn thao tác 
USE lesson_01;

-- Kiểu dữ liệu 
-- Số nguyên : TINYINT, SMALLINT, MEDIUMINT, INT, BIGINT
-- Số thực : FLOAT, DOUBLE
-- Chuỗi: VARCHAR(50), CHAR(50)
-- Thời gian : DATE (yyyy-MM-dd), TIME, DATETIME
-- Logic: BOOLEAN, BIT
-- ENUM: ENUM("Loading", "Success", "Error")
-- Xóa bảng nếu tồn tại 
DROP TABLE IF EXISTS department;

-- Tạo bảng
CREATE TABLE department (
	id INT,
    name VARCHAR(50),
    created_date DATE
);

-- Thêm dữ liệu vào bảng
INSERT INTO department(id, name, created_date)
VALUES     (1, "Bảo vệ"    , "2020-04-19"),
		   (2, "Kinh doanh", "2023-02-13"),
           (3, "Giám đốc"  , "2024-04-05");

-- Hiển thị dữ liệu 
-- TABLE department;
-- Hoặc 
SELECT * FROM department;

-- Ràng buộc dữ liệu 
-- Khóa chính (PRIMARY KEY)
-- 1. Một bảng có tối đa 1 khóa chính
-- 2. Giá trị là duy nhất 
-- 3. Phải NOT NULL
-- Tự động tăng: AUTO_INCREMENT
CREATE TABLE product (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

INSERT INTO product (id, name)
VALUES (1, "Chuột máy tính");  
-- 
INSERT INTO product (id, name)
VALUES (2, "Bàn phím máy tính");             
-- 
INSERT INTO product ( name)
VALUES ( "Tủ lạnh");

-- NOT NULL: Không được để trống
DROP TABLE IF EXISTS question;
CREATE TABLE question (
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(100) NOT NULL
);
--
INSERT INTO question (content)
VALUES (NULL);
--
INSERT INTO question (content)
VALUES (" ");

-- UNIQUE KEY: Khóa duy nhất 
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE
);
-- 
INSERT INTO customer (email)
VALUES(NULL);
-- 
INSERT INTO customer (email)
VALUES("hdadadka@gmail.com");

-- DEFAULT : Mặc định
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (100) DEFAULT "unknow@gmail.com",
	created_date DATE DEFAULT (CURRENT_DATE)
);
INSERT INTO customer(id)
VALUE(100);

-- CHECK: Kiểm tra
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
	id INT PRIMARY KEY AUTO_INCREMENT,
    age INT CHECK (age >= 18)
);

-- 
INSERT INTO `user`(age)
VALUES(18);

-- FOREIGN KEY: Khóa ngoại
DROP TABLE IF EXISTS department;
CREATE TABLE department (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
); 
--
DROP TABLE IF EXISTS account;
CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id)
    ON UPDATE CASCADE ON DELETE CASCADE -- SET NULL
);
--
INSERT INTO department (id, name) 
VALUES (100, "Bao ve");
INSERT INTO account (full_name, department_id) 
VALUES ("Nguyen Van Khoa", 100);
