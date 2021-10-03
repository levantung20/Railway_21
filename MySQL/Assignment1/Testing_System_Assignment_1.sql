DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

--  Table1:create Department

CREATE TABLE Department(
DepartmentID INT,	
DepartmentName VARCHAR(50)
);	

--  Table2 :create Position
CREATE TABLE `Position`(
	PositionID INT,
    PositionName VARCHAR(50)
);

--  Table3 :create Account
CREATE TABLE `Account`(
	AccountID INT,
    Email VARCHAR(50),
    Username VARCHAR(10),
    FullName VARCHAR(20),
    DepartmentID INT,
    PositionID INT,
    CreateDate Date
);

--  Table4 :create Group
	CREATE TABLE `Group`(
    GroupID INT,
    GroupName VARCHAR(15),
    CreatorID INT,
    CreateDate Date
    );
    
    -- Table5 : Create GroupAccount
    CREATE TABLE GroupAccount(
		GroupID INT,
        AccountID INT,
        JoinDate Date
    );
    
    -- Table6 : CreateTypeQuesition
    CREATE TABLE TypeQuesiton(
    TypeID INT,
    TypeName VARCHAR(15)
    );
    
    -- Table7: CategoryQuesition
    
    CREATE TABLE CategoryQuesition(
    CategoryID INT,
    CategoryName VARCHAR(15)
    );
    
    -- Table8:Quesition
    
    CREATE TABLE Quesition(
    QuesitionID INT,
    Content VARCHAR(50),
    CategoryID INT,
    TypeID INT,
    CreatorID INT,
    CreateDate Date
    );
    
    -- Table9 : Answer
    
    CREATE TABLE Answer(
	AnswerID INT,
    Content VARCHAR(20),
    QuesitionID INT,
    isCorrect  VARCHAR(20)
    );
    
     -- Table10 : Exam
     
     CREATE TABLE Exam(
     ExamID INT,
     `Code` INT,
     Title VARCHAR(50),
     CategoryID INT,
     Duration INT,
     CreatorID VARCHAR(50),
     CreateDate Date
     );
     
     -- Table 11 ExamQuesition
     
     CREATE TABLE ExamQuesition(
     ExamID INT,
     QuesitionID VARCHAR(50)
     );