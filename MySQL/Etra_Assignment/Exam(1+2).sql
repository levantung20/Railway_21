DROP DATABASE IF EXISTS Design; 
CREATE DATABASE Design;
USE Design;
 -- TraineeID: định danh của thực tập sinh (auto increment)
--  Full_Name: tên đầy đủ của thực tập sinh
--  Birth_Date: ngày sinh của thực tập sinh
--  Gender: chỉ có 3 giá trị male, female, and unknown
--  ET_IQ: Entry test point (IQ) - Điểm test đầu vào của thực tập sinh (integer có
-- giá trị từ 0  20)
--  ET_Gmath: Entry test point (Gmath) - Điểm test đầu vào của thực tập sinh
-- (integer có giá trị từ 0  20)
--  ET_English: Entry test point (English) - Điểm test đầu vào của thực tập sinh
-- (integer có giá trị từ 0  50)
--  Training_Class: mã lớp của thực tập sinh đang học
--  Evaluation_Notes: 1 vài note đánh giá (free text).
 -- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
 
 DROP TABLE IF EXISTS SinhVien;
 CREATE TABLE SinhVien(
		TraineeID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Full_Name 		NVARCHAR(50) NOT NULL,
        Birth_Date		DATE NOT NULL,
        Gender			ENUM('MALE' ,'FEMALE','UNKOWN') NOT NULL,
        ET_IQ			TINYINT UNSIGNED CHECK(ET_IQ <=20),
        ET_Gmath		TINYINT UNSIGNED CHECK(ET_Gmath <=20),
        ET_English		TINYINT UNSIGNED CHECK(ET_English <=50),
        Training_Class		NVARCHAR(50) NOT NULL,
        Evaluation_Notes	NVARCHAR(50) NOT NULL
 );
 
 -- Exercise 2: Data Types
 DROP TABLE IF EXISTS DataTypes;
 CREATE TABLE DataTypes(
	ID				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`			VARCHAR(100) NOT NULL,
    `Code`			CHAR(10) NOT NULL,
    ModifieldDate	DATETIME DEFAULT NOW()
 );
 
  -- Exercise 3: Data Types (2)
  DROP TABLE IF EXISTS	DataTypes2;
  CREATE TABLE DataTypes2(
	ID			INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Name`		 VARCHAR(50) NOT NULL,
    Birth_Date		DATE NOT NULL,
    Gender			ENUM('MALE' ,'FEMALE' ,'UNKOWN'),
    IsDeletedFlag	BIT
  );

