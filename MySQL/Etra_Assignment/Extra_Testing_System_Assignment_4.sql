-- Cho table sau:
/*Department (Department_Number, Department_Name)
Employee_Table (Employee_Number, Employee_Name,
Department_Number)
Employee_Skill_Table (Employee_Number, Skill_Number, Date Registered)
Skill_Table (Skill_Number, Skill_Name)
Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
Question 2: Thêm ít nhất 10 bản ghi vào table
Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
Hướng dẫn: sử dụng UNION
Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
Hướng dẫn: sử dụng GROUP BY
Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
Hướng dẫn: sử dụng DISTINCT */

DROP DATABASE IF EXISTS quan_ly_nhan_vien;
CREATE DATABASE quan_ly_nhan_vien;
USE quan_ly_nhan_vien;

-- Question 1: Tạo table với các ràng buộc và kiểu dữ liệu
DROP TABLE IF EXISTS department;
CREATE TABLE department(
		Department_Number TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Department_Name		VARCHAR(50) NOT NULL UNIQUE KEY
);

DROP TABLE IF EXISTS Employee_Table;
CREATE TABLE Employee_Table(
			Employee_Number		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            Employee_Name		VARCHAR(50) NOT NULL UNIQUE KEY,
            Department_Number	TINYINT UNSIGNED NOT NULL,
            FOREIGN KEY(Department_Number) REFERENCES department(Department_Number)
);
DROP TABLE IF EXISTS Skill_Table;
CREATE TABLE Skill_Table(
		Skill_Number 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        Skill_Name 			VARCHAR(50)NOT NULL
);
DROP TABLE IF EXISTS Employee_Skill_Table;
CREATE TABLE Employee_Skill_Table(
		Employee_Number 		TINYINT UNSIGNED NOT NULL,
        Skill_Number			VARCHAR(30) NOT NULL,
        Date_Registered			DATETIME,
        PRIMARY KEY(Employee_Number,Skill_Number),
        FOREIGN KEY(Employee_Number) REFERENCES Employee_Table(Employee_Number)
);

 -- ==========================================================================
  -- Question 2: Thêm ít nhất 10 bản ghi vào table
insert into department (Department_Name) values ('Engineering');
insert into department (Department_Name) values ('Product Management');
insert into department (Department_Name) values ('Business Development');
insert into department (Department_Name) values ('Legal');
insert into department (Department_Name) values ('Support');
insert into department (Department_Name) values ('Accounting');
insert into department (Department_Name) values ('Services');
insert into department (Department_Name) values ('Sale');
insert into department (Department_Name) values ('Training');
insert into department (Department_Name) values ('Human Resources');
insert into department (Department_Name) values ('Research and Development');


insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('1', 'Livia Edmondson','1');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('2', 'Cordell Gerauld','2');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('3', 'Taffy Howgego','3');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('4', 'Verna Kiernan','4');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('5', 'Tiffanie Gegg','5');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('6', 'Lanie Ghirardi','6');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('7', 'Erena Allwood','7');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('8', 'Livia Beckham','8');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('9', 'Monte Rizzi','9');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('10', 'Mayne Lynes','10');
insert into Employee_Table (Employee_Number, Employee_Name,Department_Number) values
('11', 'Obama Lynes','11');

insert into Skill_Table (Skill_Number,Skill_Name) values ('1','Oracle');
insert into Skill_Table (Skill_Number,Skill_Name) values ('2','SQL');
insert into Skill_Table (Skill_Number,Skill_Name) values ('3','C++');
insert into Skill_Table (Skill_Number,Skill_Name) values ('4','PYTHON');
insert into Skill_Table (Skill_Number,Skill_Name) values ('5','JAVA');

insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('1','1','2019-12-11');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('2','2','2020-07-14');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('3','3','2019-08-15');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('4','5','2019-02-12');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('5','4','2019-08-11');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('6','2','2019-02-12');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('7','3','2021-04-11');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('8','1','2019-02-10');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('9','3','2019-07-11');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('10','1','2019-08-11');
insert into Employee_Skill_Table (Employee_Number,Skill_Number,Date_Registered) values ('11','2','2019-10-11');

 -- Question 3: Viết lệnh để lấy ra danh sách nhân viên (name) có skill Java
SELECT a.Employee_Number, c.Skill_Name, b.Employee_Name
FROM	Employee_Skill_Table a
JOIN	Employee_Table b ON a.Employee_Number = b.Employee_Number
JOIN	Skill_Table c On a.Skill_Number = c.Skill_Number
WHERE 	c.Skill_Name ='JAVA' GROUP BY c.Skill_Name;



 -- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
 
 SELECT  a.Department_Name, COUNT(a.Department_Number)
 FROM
department a
	LEFT JOIN
	Employee_Table b ON a.Department_Number = b.Department_Number
    GROUP BY a.Department_Number
    HAVING COUNT(a.Department_Number) >=3;
  
-- Question 5: Viết lệnh để lấy ra danh sách nhân viên của mỗi văn phòng ban.
SELECT a.Department_Number, a.Department_Name,  b.Employee_Name
FROM 	Department a
JOIN
	Employee_Table b On a.Department_Number = b.Department_Number
    GROUP BY (B.Employee_Name) ORDER BY Department_Number;
    
 -- Question 6: Viết lệnh để lấy ra danh sách nhân viên có > 1 skills.
SELECT  Employee_Number,COUNT(Employee_Number)
FROM	Employee_Skill_Table
GROUP BY (Employee_Number) HAVING COUNT(Employee_Number) >=1;