USE Design;
 -- Question 1: Thêm ít nhất 10 bản ghi vào table
 INSERT INTO SinhVien(TraineeID, Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes)
 VALUES(1, 'Lê Hồng Duyên', '2000-10-14' ,'FEMALE', 15,14,20, 'VTI001', 'DHLHN'),
 (2, 'Trần Thu Trang', '2000-9-16','FEMALE', 10,17,30, 'VTI011', 'DHTM'),
 (3, 'Lê Văn Tùng', '1999-01-17', 'MALE', 17,18,40, 'VTI0012', 'DHCNTT'),
 (4, 'Vũ Công Thắng', '1995-05-06','MALE', 14,12,30, 'VTI003', 'TCDNTHN'),
 (5, 'Lê Việt Hà', '2000-9-8','FEMALE',10,18,35, 'VTI003', 'DHKK'),
 (6, 'Vũ Công Thành', '1994-05-10','MALE',18,19,40,'VTI004', 'DKBKHN'),
 (7, 'NGuyễn Đức Chiến', '1990-07-20', 'MALE', 18,17,35,'VTI007', 'HVBC&TH'),
 (8, 'Phạm Yến Thanh', '1996-04-18','MALE',18,10,30,'VTI005', 'DHNNHN'),
 (9, 'Nguyễn Hải Nam', '1996-05-20', 'UNKOWN',  10,15,45,'VTI008', 'DHTL'),
 (10, 'Bùi Tiến Lực', '1996-04-14', 'MALE', 15,14,30,'VTI009', 'DHKT'),
 (11, 'Trần Tuấn Lộc', '1997-05-20','UNKOWN', 17,15,40,'VTI010', 'DHCNHN');
 
 -- Question 2: Viết lệnh để lấy ra tất cả các thực tập sinh đã vượt qua bài test đầu vào,
 -- nhóm chúng thành các tháng sinh khác nhau
 
 SELECT 		Full_Name,ET_IQ,ET_Gmath,ET_English,Birth_Date
 FROM			SinhVien
 WHERE (ET_IQ <=20) AND(ET_Gmath <=20)AND (ET_English <=50)
 GROUP BY 		Birth_Date;
 
  -- Question 3: Viết lệnh để lấy ra thực tập sinh có tên dài nhất, lấy ra các thông tin sau:
 -- tên, tuổi, các thông tin cơ bản (như đã được định nghĩa trong table)
 SELECT *
FROM SinhVien
WHERE length(Full_Name) =(SELECT MAX(length(Full_Name)) FROM SinhVien);

-- Question 4: Viết lệnh để lấy ra tất cả các thực tập sinh là ET, 1 ET thực tập sinh là
 -- những người đã vượt qua bài test đầu vào và thỏa mãn số điểm như sau:
 SELECT Full_Name,ET_IQ,ET_Gmath,ET_English
 FROM 	SinhVien
 WHERE ET_IQ >=8 AND ET_Gmath >=8 AND (ET_IQ+ET_Gmath) >=20;
 
 -- Question 5: xóa thực tập sinh có TraineeID = 3
 DELETE FROM SinhVien WHERE TraineeID = 3;
 
 -- Question 6: Thực tập sinh có TraineeID = 5 được chuyển sang lớp "2". Hãy cập nhật
-- thông tin vào database
UPDATE 	SinhVien
SET 
		Training_Class ='LOP2'
WHERE 	TraineeID = 5;
        