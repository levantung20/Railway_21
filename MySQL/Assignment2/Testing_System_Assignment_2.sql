DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    DepartmentName		VARCHAR(50) NOT NULL UNIQUE KEY
);

-- Table 2 
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID  		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	PositionName		ENUM('Dev' ,'Test' , 'Scrum Master' , 'PM' , 'Sale', 'MKT', 'BV', 'Warehouse') NOT NULL UNIQUE KEY
);

-- Table 3
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID			MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email				VARCHAR(50) NOT NULL UNIQUE KEY,
    Username 			VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName			VARCHAR(50) NOT NULL,
    DepartmentID		MEDIUMINT UNSIGNED NOT NULL,
    PositionID 			MEDIUMINT UNSIGNED NOT NULL,
    CreateDate			DATETIME DEFAULT NOW(),
	FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
	FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);
 -- TABLE 4
 DROP TABLE IF EXISTS `Group`;
 CREATE TABLE `Group`(
GroupID				MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
GroupName			VARCHAR(50) NOT NULL,
CreatorID 			MEDIUMINT  UNSIGNED NOT NULL UNIQUE KEY,
CreateDate			DATETIME DEFAULT NOW(),
FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
 );
 
-- Table 5
 DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
GroupID			MEDIUMINT UNSIGNED ,
AccountID		MEDIUMINT UNSIGNED ,
JoinDate		DATETIME DEFAULT NOW(),
PRIMARY KEY (GroupID, AccountID),
FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID)
);

-- Table 6
DROP TABLE IF EXISTS  TypeQuesition;
CREATE TABLE TypeQuesition(
TypeID			MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
TypeName		VARCHAR(50) NOT NULL
);

-- Table 7
DROP TABLE IF EXISTS CategoryQuesition;
CREATE TABLE CategoryQuesition(
	CategoryID 		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName	VARCHAR(50) NOT NULL
);

-- Table 8 
DROP TABLE IF EXISTS Quesition;
CREATE TABLE Quesition(
	QuesitionID 	MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content			Text,
    CategoryID 		MEDIUMINT UNSIGNED NOT NULL,
	TypeID          MEDIUMINT UNSIGNED NOT NULL,
    CreatorID		MEDIUMINT UNSIGNED NOT NULL,
    CreateDate		DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) REFERENCES `Group`(CreatorID),
       FOREIGN KEY (TypeID) REFERENCES TypeQuesition (TypeID),
    FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);

-- Table 9
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID  		MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content			TEXT,
    QuesitionID		MEDIUMINT UNSIGNED NOT NULL,
    isCorrect			BIT NOT NULL,
    FOREIGN KEY(QuesitionID) REFERENCES Quesition (QuesitionID)
        );
        
-- Table 10
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
		ExamID  	MEDIUMINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `Code`		VARCHAR(50) NOT NULL,
        Title		VARCHAR(50) NOT NULL,
        CategoryID	MEDIUMINT UNSIGNED NOT NULL UNIQUE KEY,
        Duration 	MEDIUMINT NOT NULL,
        CreatorID	MEDIUMINT UNSIGNED UNIQUE KEY,
        CreateDate 	DATETIME DEFAULT NOW(),
		FOREIGN KEY (CategoryID) REFERENCES CategoryQuesition (CategoryID),
		FOREIGN KEY (CreatorID) REFERENCES `Account` (AccountID)
);
-- Table 11
DROP TABLE IF EXISTS ExamQuesition;
CREATE TABLE ExamQuesition(
	ExamID			MEDIUMINT  UNSIGNED NOT NULL,
    QuesitionID 	MEDIUMINT UNSIGNED NOT NULL ,
    PRIMARY KEY (ExamID, QuesitionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
	FOREIGN KEY(QuesitionID) REFERENCES Quesition (QuesitionID)
);


-- Bang Department
INSERT INTO Department (DepartmentName)
VALUES					('Production'),
						('Research and Development'),
                        ('Sale'),
                        ('Marketing'),
                        ('Human Resource Management'),
                        ('Accounting and Finance'),
                        ('Waiting Room');
                        
-- Bang Position
INSERT INTO `Position` (PositionName)
VALUES				 ('Dev'), ('Test'), ('Scrum Master'), ('PM'), ('Sale'), ('MKT'), ('BV'), ('Warehouse');
                        
-- Bang Account
INSERT INTO `Account`
(Email, 							UserName, 			FullName, 					DepartmentID, 		PositionID) VALUES
('duyen14@ucla.edu', 				'Duyêntv', 		'Lê Hồng Duyên', 			1, 					1		   ),
('tgatchell1@bbb.org', 				'tgatchell1', 		'Lê Văn Tùng', 			2, 					8		   ),
('bsoutherell2@tripadvisor.com', 	'bsoutherell2', 	'Nguyễn Đức Chiến', 			3, 					2		   ),
('dtomley3@nymag.com', 				'dtomley3', 		'Đào Thị Thanh Loan', 			2, 					1		   ),
('asteaning4@paginegialle.it', 		'asteaning4', 		'Trần Thị Thu Hà', 			5, 					5		   ),
('rwynrehame5@census.gov', 			'rwynrehame5', 		'Lê Việt Hà', 		6, 					4		   ),
('atanti6@eventbrite.com', 			'atanti6', 			'Vũ Tuấn Long', 			5, 					3		   ),
('olewington7@seesaa.net', 			'olewington7', 		'Bùi Tiến Lực', 		1, 					6		   ),
('glinklater8@w3.org', 				'glinklater8', 		'Nguyễn Đức Duy', 		5, 					7		   ),
('mmcorkil9@reference.com', 		'mmcorkil9', 		'Vũ Công Thành', 		2, 					2		   ),
('cjonuzia@irs.gov', 				'cjonuzia', 		'Phan Văn Thăng', 			3, 					6		   ),
('tlamontb@ow.ly', 					'tlamontb', 		'Phạm Yến Thanh', 			3, 					3		   ),
('dkelsallc@ftc.gov', 				'dkelsallc', 		'Bùi Đức Anh', 			4, 					4		   ),
('cbleackleyd@myspace.com', 		'cbleackleyd', 		'Trần Thu Trang', 		5, 					7		   ),
('agerrarde@altervista.org', 		'agerrarde', 		'Nguyễn Văn Quyết', 			3, 					8		   ),
('mkevisf@photobucket.com', 		'mkevisf', 			'Nguyễn Đức Lộc', 				4, 					3		   ),
('ewahlbergg@independent.co.uk', 	'ewahlbergg', 		'Từ Hồng Hạnh', 		6, 					1		   ),
('fcoyh@baidu.com', 				'fcoyh', 			'Đoàn Minh Vương', 				5, 					2		   ),
('lcuruclisi@eepurl.com', 			'lcuruclisi', 		'Lê Văn Việt', 	2, 					5		   ),
('eribeiroj@unblog.fr', 			'eribeiroj', 		'Trần Đăng Hiếu', 			5, 					2		   );		


-- Bang Group
INSERT INTO `Group` (GroupName, 				CreatorID)
VALUES				 ('Annihilators',			1		  ),
					 ('Avengers',				3		  ),
                     ('Bad to The Bone',		5		  ),
                     ('Black Panthers',			7		  ),
                     ('Black Widows',			9		  ),
                     ('Blitzkrieg ',			11		  ),
                     ('Braindead Zombies',		13		  ),
                     ('Brewmaster Crew',		15		  ),
                     ('Brute Force',			17		  ),
                     ('Butchers ',				19	      );

-- Bang GroupAccount
INSERT INTO GroupAccount (GroupID, 		AccountID, 		JoinDate)
VALUES					  (1,		 	1,				'2020-01-01'),
						  (1,			2,				'2020-01-01'),
                          (2,			1,				'2020-01-01'),
                          (2,			4,				'2020-01-01'),
                          (3,			5,				'2020-01-01'),
                          (3,			2,				'2020-01-01'),
                          (4,			7,				'2020-01-01'),
                          (4,			8,				'2020-01-01'),
                          (5,			9,				'2020-01-01'),
                          (5,			10,				'2020-01-01'),
                          (6,			11,				'2020-01-01'),
                          (6,			12,				'2020-01-01'),
                          (7,			13,				'2020-01-01'),
                          (7,			14,				'2020-01-01'),
                          (8,			15,				'2020-01-01'),
                          (8,			16,				'2020-01-01'),
                          (1,			17,				'2020-01-01'),
                          (1,			18,				'2020-01-01'),
                          (1,			19,				'2020-01-01');
                        
-- Bang TypeQuestion
INSERT INTO TypeQuesition(TypeName)
VALUES					  ('Essay Question'),
						  ('Multiple Choice Question'),
                          ('Rank Order Scaling Question'),
                          ('Text Slider Question'),
                          ('Likert Scale Question'),
                          ('Semantic Differential Scale'),
                          ('Stapel Scale Question'),
                          ('Constant Sum Question'),
                          ('Comment Box Open Ended Question'),
                          ('Text Question');

-- Bang CategoryQuestion
INSERT INTO CategoryQuesition (CategoryName)
VALUES						  ('Java'),
							  ('C'),
                              ('Python'),
                              ('C++'),
                              ('C#'),
                              ('Visual Basic .Net'),
                              ('JavaScript'),
                              ('PHP'),
                              ('Swift'),
                              ('SQL');
                        
-- Bang Question
INSERT INTO Quesition 
(Content, CategoryID, TypeID, CreatorID) VALUES
('Please explain what you understand by computer programming.',
1, 1, 1),
('Can you enumerate and explain the various types of errors that can occur during the execution of a computer program?',
1, 2, 3),
('Please explain an algorithm. What are some of its important features?',
2, 2, 5),
('What do you understand by maintaining and updating a computer program?',
2, 4, 7),
('Please provide a brief explanation on variables.',
2, 4, 9),
('Every programming language has reserved words. What are they? Give some examples.',
3, 4, 11),
('What do you understand by loops? Briefly explain the various types of loops.',
3, 6, 13),
('Please explain program documentation. Why is it important?',
3, 8, 15),
('What are constants? Explain their types.',
3, 8, 17),
('Please explain the operators.',
5, 1, 19),
('Program documentation is the written description of the algorithm(s), coding method, design, testing, and proper use of a particular computer program. It is valuable for those who use the program on a day-to-day basis and also for the programmer(s) who are meant to correct, modify, and upDATETIME the computer program. Program documentation is the written description of the algorithm(s), coding method, design, testing, and proper use of a particular computer program. It is valuable for those who use the program on a day-to-day basis and also for the programmer(s) who are meant to correct, modify, and upDATETIME the computer program.',
2, 2, 1);

-- Bang Answer
INSERT INTO Answer 
(Content, QuesitionID, IsCorrect) VALUES
('Also known as coding or programming, computer programming is the process of encoding an algorithm into a notation, typically a computer program, by means of some programming language so that it can be executed by a computer.',
1, 1),
('Three types of errors can occur during the execution of a computer program.',
1, 0),
('An algorithm can be defined as a set of finite steps that when followed helps in accomplishing a particular task. Important features of an algorithm are clarity, efficiency, and finiteness.',
1, 0),
('The maintenance and updating process of a computer program starts post its successful installation. While program maintenance is the continuous process of monitoring the computer program for bugs and errors, updating the computer program means making it better with minor and major changes over time.',
3, 1),
('Variables are used for storing the input of a program as well as the computational results during program execution. These are actually named memory locations. The value stored in a variable can change during the program execution.',
3, 0),
('Reserved words, also known as keywords, are the words that have predefined meanings in a particular programming language. These reserved words can’t be used or redefined for serving other purposes. Following are some examples of reserved words.',
4, 1),
('A loop is a structure in programming that can repeat a defined set of statements for a set number of times or until a particular condition is satisfied. There are three important types of loops.',
4, 1),
('Program documentation is the written description of the algorithm(s), coding method, design, testing, and proper use of a particular computer program. It is valuable for those who use the program on a day-to-day basis and also for the programmer(s) who are meant to correct, modify, and upDATETIME the computer program.',
5, 0),
('A constant is a programming entity whose value can’t be changed or modified during program execution. Constants are of two main types.',
5, 1),
('Operators are used for performing certain operations on data in a computer program. These are represented by symbols. For example, / represent mathematical division while * represents multiplication.',
1, 0);

-- Bang Exam
INSERT INTO Exam (`code`, 		Title, 								CategoryID, 	Duration, 	CreatorID)
VALUES			  ('E001', 		'Exam for Java', 					1, 			 	60, 		1		  ),
				  ('E002', 		'Exam for C', 						2, 			 	120, 		3		  ),
                  ('E003', 		'Exam for Python', 					3, 				180, 		5		  ),
                  ('E004', 		'Exam for C++', 					4, 				20, 		7		  ),
                  ('E005', 		'Exam for C#', 						5, 				120, 		9		  ),
                  ('E006', 		'Exam for Visual Basic .Net', 		6, 				180, 		11		  ),
                  ('E007', 		'Exam for JavaScript', 				7, 				60, 		13		  ),
                  ('E008', 		'Exam for PHP', 					8, 				30, 		15		  ),
                  ('E009', 		'Exam for Swift', 					9, 				45, 		17		  ),
                  ('E010', 		'Exam for SQL', 					10, 			45, 		19		  );

-- Bang ExamQuestion
INSERT INTO ExamQuesition  (ExamID, 	QuesitionID)
VALUES					  (1, 		1		   ),
						  (2, 		1		   ),
                          (3, 		1		   ),
                          (4, 		1		   ),
                          (5, 		2		   ),
                          (6, 		2		   ),
                          (7, 		2		   ),
                          (8, 		2		   ),
                          (3, 		10		   ),
                          (10, 		9		   );
                          
-- Update Table DepartmentName
UPDATE 	department
SET		DepartmentName = 'Sale'
WHERE	DepartmentID = 3;

-- DELETE TABLE AccountName
DELETE
FROM	`Account`
WHERE	UserName = 'rwynrehame5';