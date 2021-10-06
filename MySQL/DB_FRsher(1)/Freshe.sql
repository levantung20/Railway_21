DROP DATABASE IF EXISTS Freshe_12;
CREATE DATABASE Freshe_12;
USE Freshe_12;

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
 DROP TABLE IF EXISTS Trainee;
 CREATE TABLE Trainee(
		TraineeID 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Full_Name		NVARCHAR(50) NOT NULL,
        Birth_Date		DATE NOT NULL,
        Gender			ENUM('MALE' ,'FEMALE','Unknown') NOT NULL,
        ET_IQ			TINYINT UNSIGNED NOT NULL CHECK(ET_IQ <=20),
        ET_Gmath		TINYINT UNSIGNED NOT NULL CHECK(ET_Gmath <=20),
        ET_English		TINYINT UNSIGNED NOT NULL CHECK (ET_English <=50),
		Training_Class	NVARCHAR(50)  NOT NULL,
		Evaluation_Notes	NVARCHAR(50) NOT NULL
 );
 -- Question 2: Thêm ít nhất 10 bản ghi vào table
 INSERT INTO Trainee(TraineeID , Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes)
 VALUES (1,	'Lê Hồng Duyên',	'1995-12-08',	'MALE',	'12',	'13',	'48',	'VTI008',	'DHBKHN'),
(2,'Lê Văn Tùng',	'1999-02-21',	'FEMALE',	'0',	'12',	'18',	'VTI004',	'DHKTQD'),
(3,	'Vũ Công Thành',	'1994-06-15',	'MALE',	'11',	'17',	'24',	'VTI007',	'DHXDHN'),
(4,	'Nguyễn Hải Nam',	'1990-06-10',	'FEMALE',	'5',	'0',	'8',	'VTI005',	'DHNT'),
(5,	'Lê Việt Hà',	'1998-06-16',	'FEMALE',	'2',	'11',	'30',	'VTI002',	'HVNG'),
(6,	'Vũ Thu Thảo',	'1995-09-04',	'Unknown',	'16',	'20',	'20',	'VTI002',	'DHGTVT'),
(7,	'Nguyễn Đức Chiến',	'1994-06-02',	'FEMALE',	'1',	'4',	'16',	'VTI004',	'DHBKHN'),
(8,	'Phạm Yến Thanh',	'1994-03-05',	'MALE',	'15',	'16',	'50',	'VTI006',	'DHTM'),
(9,	'Ha Hue Chi',	'1993-05-10',	'Unknown',	'17',	'2',	'24',	'VTI008',	'DHBKHN'),
(10,'Hoàng Văn Tuyên',	'1992-06-30',	'FEMALE',	'12',	'7',	'42',	'VTI002',	'DHTM');

-- Question 3 : Insert 1 bản ghi mà có điểm ET_IQ =30. Sau đó xem kết quả.
  INSERT INTO Trainee(TraineeID , Full_Name, Birth_Date, Gender, ET_IQ, ET_Gmath, ET_English, Training_Class, Evaluation_Notes)
  VALUES ( 11, 'Vũ Tuấn Long', '1995-08-21' , 'MALE' , '30', '15', '15' ,'VTI0014', 'DHHKQGHN');
  
  -- Question4: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
-- và sắp xếp theo ngày sinh. Điểm ET_IQ >=12, ET_Gmath>=12, ET_English>=20

SELECT * FROM Trainee WHERE (ET_IQ >=12)AND(ET_Gmath>=12)AND(ET_English>=20) ORDER BY Birth_Date;

-- Question 5: Viết lệnh để lấy ra thông tin thực tập sinh có tên bắt đầu bằng chữ L và kết thúc bằng chữ N
SELECT * 
FROM Trainee
WHERE Full_Name LIKE 'L%N';

-- Question 6: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có ký thự thứ 2 là chữ G
SELECT * 
FROM Trainee
WHERE Full_Name LIKE ('_g%');

-- Question 7: Viết lệnh để lấy ra thông tin thực tập sinh mà tên có 10 ký tự và ký tự cuối cùng là i
SELECT * 
FROM Trainee
WHERE length(Full_Name) = 10 AND Full_Name  LIKE '%i';

-- -- Question 8: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, lọc bỏ các tên trùng nhau.
SELECT DISTINCT Full_Name
FROM Trainee;
-- Question 9: Viết lệnh để lấy ra Fullname của các thực tập sinh trong lớp, sắp xếp các tên này theo thứ tự từ A-Z.
SELECT Full_Name
FROM Trainee
ORDER BY Full_Name;

-- Question 10: Viết lệnh để lấy ra thông tin thực tập sinh có tên dài nhất
SELECT * 
FROM Trainee
WHERE length(Full_Name) = (SELECT MAX(length(Full_Name)) FROM Trainee);


-- Question 11: Viết lệnh để lấy ra ID, Fullname và Ngày sinh thực tập sinh có tên dài nhất
SELECT TraineeID, Full_Name, Birth_Date
FROM Trainee
WHERE length(Full_Name) = (SELECT MAX(length(Full_Name)) FROM Trainee);

-- Question 12: Viết lệnh để lấy ra Tên, và điểm IQ, Gmath, English thực tập sinh có tên dài nhất
SELECT  Full_Name, ET_IQ, ET_Gmath, ET_English
FROM Trainee
WHERE length(Full_Name) =(SELECT MAX(length(Full_Name)) FROM Trainee);


-- Question 13 Lấy ra 5 thực tập sinh có tuổi nhỏ nhất
SELECT *, year(curdate()) - year(birth_date) as Age
FROM Trainee
ORDER BY Age
LIMIT 5;

-- Question 14: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là những người thỏa mãn số điểm như sau:
-- 			ET_IQ + ET_Gmath>=30
-- 			ET_IQ>=8
-- 			ET_Gmath>=8
-- 			ET_English>=18
SELECT Full_Name
FROM Trainee
WHERE ET_IQ >=8 AND ET_Gmath>=8 AND ET_English >=18 AND(ET_IQ +ET_Gmath) >=30;

-- Question 15: Xóa thực tập sinh có TraineeID = 3
DELETE FROM Trainee WHERE TraineeID = 3;
-- Question 16: Xóa thực tập sinh có tổng điểm ET_IQ, ET_Gmath <=15
DELETE FROM Trainee WHERE ET_IQ +ET_Gmath <=15;

-- Question 17: Xóa thực tập sinh quá 30 tuổi.
DELETE
FROM Trainee
WHERE year(curdate()) - year(birth_date) >30;
-- Question 18: Thực tập sinh có TraineeID = 3 được chuyển sang lớp " VTI003". Hãy cập nhật thông tin vào database
UPDATE 		Trainee
SET
			Training_Class = "VTI003"
WHERE		TraineeID = 3;
-- Question 19: Do có sự nhầm lẫn khi nhập liệu nên thông tin của học sinh số 10 đang bị sai, hãy cập nhật lại tên thành “LeVanA”, điểm ET_IQ =10, điểm ET_Gmath =15, điểm ET_English = 30.

UPDATE 		Trainee
SET
			Full_Name = "Lê Văn A", ET_IQ = 10 , ET_Gmath = 15, ET_English =30
WHERE		TraineeID = 10 ;
-- Question 20: Đếm xem trong lớp VTI002 có bao nhiêu thực tập sinh.9(20,21 đề bài là 1)
SELECT 		 Training_Class,COUNT(1) as Number_of_Trainee
FROM 		Trainee
WHERE		Training_Class = 'VTI002'
GROUP BY	Training_Class ;


-- Question 22: Đếm tổng số thực tập sinh trong lớp VTI002 và VTI008 có bao nhiêu thực tập sinh.
SELECT  COUNT(1) as Number_of_Trainee
FROM 	Trainee
GROUP BY  Training_Class HAVING Training_Class ='VTI004' OR Training_Class = 'VTI008';

-- Question 23: Lấy ra số lượng các thực tập sinh theo giới tính: Male, Female, Unknown.
SELECT 	Gender, COUNT(1)
FROM 	Trainee
GROUP BY Gender;
-- Question 25: Lấy ra lớp có lớn hơn 4 thực tập viên(câu 24,25 đề bài là 1)
SELECT	Training_Class,COUNT(1) as Number_of_Trainee
FROM 	Trainee
GROUP BY	Training_Class HAVING COUNT(1) >=4;
-- Question 26: Lấy ra trường có ít hơn 4 thực tập viên tham gia khóa học
SELECT Training_Class, COUNT(1) AS Number_of_Trainee
FROM 	Trainee
GROUP BY 	Training_Class HAVING COUNT(1) <4;

/* Question 27: Bước 1: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp
'VTI002'
Bước 2: Lấy ra danh sách thông tin ID, Fullname, lớp thực tập viên có lớp 'VTI005'
Bước 3: Sử dụng UNION để nối 2 kết quả ở bước 1 và 2 */

-- Bước 1
SELECT 	TraineeID,Full_Name,Training_Class
FROM 	Trainee
WHERE	Training_Class = 'VTI002';
 -- Bước 2 
 SELECT TraineeID,Full_Name,Training_Class
 FROM	Trainee
 WHERE	Training_Class = 'VTI003';
 
-- Bước 3
SELECT 	TraineeID,Full_Name,Training_Class
FROM 	Trainee
WHERE 	Training_Class ='VTI002'
UNION
SELECT 	TraineeID,Full_Name,Training_Class
FROM 	Trainee
WHERE	Training_Class ='VTI003';
