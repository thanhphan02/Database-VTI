DROP TABLE IF EXISTS assignment_01;
CREATE DATABASE assignment_01;
USE assignment_01;

-- 1.Tạo bảng Department
Drop TABLE IF EXISTS department;
CREATE TABLE department (
	id  INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
INSERT INTO department( id, name) 
VALUE ( 1 ,"Sale");
INSERT INTO department( name)
VALUES ("Marketing"), ("Accountant");

-- 2.Tạo bảng Position
DROP TABLE IF EXISTS position;
CREATE TABLE position (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Dev","Test", "Scrum Master", "PM")
);
INSERT INTO position ( id,name)
VALUES (1, "Dev"),
       (2, "Test"),
       (3,"Scrum Master"),
       (4,"PM");

-- 3.Tạo bảng Account
DROP TABLE IF EXISTS account;
CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50),
    user_name VARCHAR(50),
    full_name VARCHAR(50),
    department_id VARCHAR(50),
    position_id VARCHAR(50),
    create_date DATE
);
INSERT INTO account(id, email, user_name, full_name, department_id, position_id, create_date)
VALUE(1, "thanh@gmail.com", "thanh", "Phan Thanh", "145", "246", "2024-05-10"),
     (2, "quang@gmail.com", "quang", "Nguyen Quang", "124", "234", "2024-06-04") ;
 
 -- 4.Tạo bảng Group
 DROP TABLE IF EXISTS `group`;
 CREATE TABLE `group` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50),
	creator_id VARCHAR(50),
    create_date DATE
 );
 
 -- 5. Tạo bảng GroupAccount
 DROP TABLE IF EXISTS group_account; 
 CREATE TABLE group_account(
	 group_id INT,
     account_id INT,
     join_date DATE,
     PRIMARY KEY (group_id, account_id)
 );
 
 -- 6. Tao bang TypeQuestion
 DROP TABLE IF EXISTS type_question;
 CREATE TABLE type_question(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
 );
 
 -- 7. Tao bang CategoryQuestion
 DROP TABLE IF EXISTS category_question;
 CREATE TABLE category_question (
    id INT,
    name VARCHAR(50)
);

-- 8. Tao bang Question
DROP TABLE IF EXISTS question; 
CREATE TABLE question (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50),
    category_id INT,
    type_id INT,
    creator_id INT,
    created_date DATE
);

-- 9. Tao bang Answer
DROP TABLE IF EXISTS answer;
CREATE TABLE answer (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(50),
    question_id INT,
    is_correct BOOLEAN
);

-- 10. Tao bang  Exam
DROP TABLE IF EXISTS exam;
CREATE TABLE exam (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    code VARCHAR(50),
    title VARCHAR(50),
    category_id INT,
    duration INT,
    creator_id INT,
    created_date DATE
);

-- 11. Tao bang ExamQuestion
DROP TABLE IF EXISTS exam_question;
CREATE TABLE exam_question(
	exam_id INT,
    question_id INT
);




 
 