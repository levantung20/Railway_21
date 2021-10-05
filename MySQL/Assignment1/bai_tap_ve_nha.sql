DROP DATABASE IF EXISTS bai_tap_ve_nha;
CREATE DATABASE bai_tap_ve_nha;
USE bai_tap_ve_nha;


-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
DROP TABLE IF EXISTS Trainee;
CREATE TABLE Trainee(
		TraineeID 							TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Full_Name 							NVARCHAR(20) NOT NULL,
        Birth_Date 							DATE NOT NULL,
		Gender 								ENUM('MALE' , 'FEMALE', 'UNKNOWN'),
        ET_IQ 								TINYINT UNSIGNED NOT NULL CHECK(ET_IQ <=20), 
        ET_Gmath 							TINYINT UNSIGNED NOT NULL CHECK(ET_Gmath <=20),
        ET_English 							TINYINT UNSIGNED  NOT NULL CHECK(ET_English <=50),
        Training_Class 						VARCHAR(10) NOT NULL,
		Evaluation_Notes 					VARCHAR(100) NOT NULL
);

-- Question 2: Thêm ít nhất 10 bản ghi vào table
 
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(1 , "Lê Hồng Duyên", '2000-10-15','FEMALE' ,9,14,30,'VTI001','DHBKHN');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(2 , "Lê Việt Hà", '2000-5-05','FEMALE' ,19,10,20,'VTI002','DHQGHN');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(3 , "Trần Thu Trang", '2021-07-20','FEMALE' ,8,14,10,'VTI003','HVBCVT');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(4 , "Lê Văn Tùng", '2002-05-08','MALE' ,11,16,13,'VTI004','DHCNHN');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(5 , "Vũ Công Thành", '1994-11-04','MALE' ,15,19,30,'VTI005','DHTL');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(6 , "Vũ Đức Long", '2001-05-17','MALE' ,7,15,25,'VTI006','DHCNTT');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(7 , "Bùi Tiến Lực", '1998-06-15','MALE' ,8,18,15,'VTI007','DHYHN');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(8 , "Phạm Yến Thanh", '1996-07-15','MALE' ,10,16,20,'VTI008','HVCSND');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(9 , "Đào Thị Thanh Loan", '1996-07-15','FEMALE' ,18,10,20,'VTI009','HVCSND');
INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(10 , "Phan Văn Thăng", '1997-05-20','MALE' ,9,10,17,'VTI010','HVCSND');

-- Question 3: Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả.
 INSERT INTO Trainee (TraineeID, Full_Name, Birth_Date, Gender, ET_IQ ,ET_Gmath , ET_English, Training_Class ,Evaluation_Notes) VALUES(11 , "Vũ Thu Thảo", '1996-10-12','FEMALE' ,30,30,14,'VTI11','TSQLQ1'); 

