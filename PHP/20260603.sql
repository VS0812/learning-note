SELECT userName, COUNT(id) total FROM member GROUP BY userName HAVING COUNT(id)>1;
SELECT sum(id) total FROM member;
INSERT INTO city (cityName) VALUES (台中市);
UPDATE `member` SET `cityid` = '2' WHERE `member`.`id` = 2;
SELECT * FROM member WHERE cityid IS null;
SELECT * FROM member WHERE cityid IS NOT null; //null 是什麼資料都沒有
SELECT * FROM member WHERE userName = ''; //空白是有資料的

CREATE DATABASE `sQL`;
DROP DATABASE `sQL`;
SHOW DATABASES;

USE `sQL`;
CREATE TABLE `student`(
    `studentId` INT PRIMARY KEY,
    `name` VARCHAR(20),
    `major` VARCHAR(20),
);

CREATE TABLE `student`(
    `studentId` INT,
    `name` VARCHAR(20),
    `major` VARCHAR(20),
    PRIMARY KEY(`studentId`);
);

DESCRIBE `student`;
DROP TABLE `student`;

//新增或刪除table的欄位
ALTER TABLE `student` ADD gpa DECIMAL(3.2);
ALTER TABLE `student` DROP COLUMN gpa;

//在table裡面新增資料
INSERT INTO `student` VALUES (1,'小白','歷史');
    //當欄位有一個是沒有的時候
    INSERT INTO `student` VALUES (2,'小綠','null');

INSERT INTO `student` (`name`,`major`,`studentId`) VALUES ('小白','歷史',1);
INSERT INTO `student` (`major`,`studentId`) VALUES ('歷史',1);


//查全部資料
SELECT * FROM `student`;

//contraints限制、約束
CREATE TABLE `student`(
    `studentId` INT,
    `name` VARCHAR(20) NOT NULL,  //這個屬性不能是空的 
    `major` VARCHAR(20) UNIQUE, //這個屬性每一個值都不能重複，都要是唯一的
    PRIMARY KEY(`studentId`);
);

CREATE TABLE `student`(
    `studentId` INT,
    `name` VARCHAR(20) ,
    `major` VARCHAR(20) DEFAULT '歷史', //沒有寫這個屬性時，就是預設是歷史
    PRIMARY KEY(`studentId`);
);

CREATE TABLE `student`(
    `studentId` INT  AUTO INCREMENT,
    `name` VARCHAR(20) ,
    `major` VARCHAR(20) ,
    PRIMARY KEY(`studentId`);
);

//開始製造關聯
SELECT a.userId, a.userName b.cityName FROM member a INNER JOIN city b on a.cityid = b.cityid
SELECT a.userId, a.userName, b.cityName FROM member a LEFT JOIN city b ON a.cityid = b.cityid;
